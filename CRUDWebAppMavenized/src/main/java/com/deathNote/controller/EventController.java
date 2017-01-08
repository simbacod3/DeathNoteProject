package com.deathNote.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.deathNote.model.Admin;
import com.deathNote.model.Event;
import com.deathNote.service.EventService;


@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/event")
	@ResponseBody
	public String getEventNumber1() {
		Event e = eventService.getEventById(6);
		
		return e.getDescription();
	}
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("/loadEvents")
	public ModelAndView loadEvents() {
		ModelAndView model = new ModelAndView("events-main");
		Event even = new Event();
		model.addObject("admin", new Admin());
		model.addObject("event", even);
		model.addObject("eventList", eventService.getAllEvents());
		model.addObject("failConnection", "");
		return model;
	}
}
