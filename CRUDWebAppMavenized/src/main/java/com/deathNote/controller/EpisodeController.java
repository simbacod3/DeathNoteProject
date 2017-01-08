package com.deathNote.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.deathNote.model.Episode;
import com.deathNote.service.EpisodeService;

@Controller
public class EpisodeController {
	
	@Autowired
	EpisodeService episodeService;
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/episode1")
	@ResponseBody
	public String getEpisode1() {
		Episode e = episodeService.getEpisodeById(6);
		
		return e.getLink();
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="episodes", method=RequestMethod.GET)
	public String getAllEpisodes(Map<String, Object> map) {
		Episode ep = new Episode();
		map.put("episode", ep);
		map.put("episodeList", episodeService.getAllEpisodes());
		
		return "episodesPanel";
	}
	
}
