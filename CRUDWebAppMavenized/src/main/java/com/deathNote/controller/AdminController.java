package com.deathNote.controller;

import java.util.Calendar;
import java.sql.Date;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.deathNote.model.Admin;
import com.deathNote.model.Episode;
import com.deathNote.model.Event;
import com.deathNote.model.Picture;
import com.deathNote.service.AdminService;
import com.deathNote.service.EpisodeService;
import com.deathNote.service.EventService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	EpisodeService episodeService_extern;
	@Autowired
	EventService eventService_extern;
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("goToAdmin")
	@ResponseBody
	public String getAdmin1() {
		Admin a = adminService.getAdminById(1);
		
		return a.getFirstname() + " "+ a.getLastname(); 
	}
	
	// | ADMIN PART FOR REGISTRATION |
	/**
	 * 
	 * @return
	 */
	@RequestMapping("register")
	public ModelAndView launchRegisterOnCall() {
		ModelAndView modelView = new ModelAndView("registerAdmin");
		modelView.addObject("admin", new Admin());
		return modelView;
	}
	
	/**
	 * 
	 * @param admin
	 * @param reqParam
	 * @return
	 */
	@RequestMapping(value="registerAndSend", method=RequestMethod.POST)
	public ModelAndView registerMember(@ModelAttribute("admin")Admin admin, @RequestParam Map<String, String> reqParam) {
		List<Admin> list = adminService.getAllAdmin();
		ModelAndView modelView = new ModelAndView("registerAdmin");
		
		for(Admin adminElement : list) {
			String usName = adminElement.getUsername() == null? "" : adminElement.getUsername();
			String reqEl = reqParam.get("username");
			
			if(reqEl.matches(usName))  {
				
				modelView.addObject("errorMsg","The username "+ reqParam.get("username") +" already exist.");
				modelView.addObject("admin", new Admin());
				return modelView;	
			}
		}
		
		adminService.add(admin);
		modelView = new ModelAndView("connection-success");
		modelView.addObject("userName", reqParam.get("username"));
		return modelView;
	}
	// END ADMIN PART FOR REGISTRATION
	
	// LOGIN PART
	
	@RequestMapping(value="adminPanel", method=RequestMethod.GET)
	public ModelAndView adminPanelAccess() {
		Event event = new Event();
		ModelAndView modelView = new ModelAndView("panelAdmin");
		modelView.addObject("event", event);
		modelView.addObject("previousTitle", "");
		modelView.addObject("episodesList", episodeService_extern.getAllEpisodes());
		return modelView;
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="panelAdd", method=RequestMethod.POST)
	public ModelAndView adminPanelSaveDataEvent(@ModelAttribute("event")Event event, BindingResult result, @RequestParam Map<String, String> reqParam) {
		

		System.out.println(reqParam.get("episode") + " " + reqParam.get("date"));
		
		//TREAT DATE
		String[] el = reqParam.get("date").split("-");
		System.out.println(el[0] + " " +el[1] + " " +el[2]+ " " + el.length);
		int[] dateTab = new int[3];
				
		for(int i = 0; i < el.length;i++)
			dateTab[i] = Integer.parseInt(el[i]);
		
		
		
		//TREAT DATA
		Calendar calend = Calendar.getInstance();
		calend.set(dateTab[0], dateTab[1], dateTab[2]);
		Date d = new Date(dateTab[0]-1900, dateTab[1], dateTab[2]);

		event.setDate(d);
		event.setPicture(new Picture(1,""));
		Episode ep = episodeService_extern.getEpisodeById(Integer.parseInt(reqParam.get("episode")));
		event.setEpisode(ep);
		event.setMurder(true);
		switch(reqParam.get("pointOfView")) {
		case "false":
			event.setPointOfView(new Boolean(false));
			break;
		case "true":
			event.setPointOfView(new Boolean(false));
			break;
		default:
			event.setPointOfView(null);
			break;
			
		}
		
		//SEND EVENT IN DATABASE
		eventService_extern.add(event);
		ModelAndView modelView = new ModelAndView("panelAdmin");
		modelView.addObject("previousTitle", reqParam.get("title"));
		modelView.addObject("event", new Event());
		modelView.addObject("episodesList", episodeService_extern.getAllEpisodes());
		return modelView;
	}
	

	
}