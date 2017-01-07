package com.deathNote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.deathNote.model.Admin;
import com.deathNote.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping("goToAdmin")
	@ResponseBody
	public String getAdmin1() {
		Admin a = adminService.getAdminById(1);
		
		return a.getFirstname() + " "+ a.getLastname(); 
	}
	
	@RequestMapping("register")
	public String launchRegisterOnCall() {
		return "registerAdmin";
	}
	
	@RequestMapping(value="registerAndSend", method=RequestMethod.POST)
	public String registerMember() {
		
		return "loadEvents";
	}
}