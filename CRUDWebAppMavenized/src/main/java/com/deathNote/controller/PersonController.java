package com.deathNote.controller;

import java.util.Collections;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.deathNote.model.Person;
import com.deathNote.service.PersonService;

@Controller
public class PersonController {
	@Autowired
	PersonService personService;
	
	@RequestMapping("/persons")
	@ResponseBody
	public String getPersonByName() {
		Person p = personService.getPersonById(1);
		
		return p.getName();
	}
	
	@RequestMapping("/persons/add1")
	@ResponseBody
	public String add1() {
		Person p = new Person();
		personService.add(p);
		return "OK";
	}
}
