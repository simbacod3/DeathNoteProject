package com.deathNote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.deathNote.model.Episode;
import com.deathNote.service.EpisodeService;

@Controller
public class EpisodeController {
	
	@Autowired
	EpisodeService episodeService;
	
	@RequestMapping("/episode1")
	@ResponseBody
	public String getEpisode1() {
		Episode e = episodeService.getEpisodeById(1);
		
		return e.getLink();
	}
	
}
