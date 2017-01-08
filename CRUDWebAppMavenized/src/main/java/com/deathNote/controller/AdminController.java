package com.deathNote.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.deathNote.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
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
}