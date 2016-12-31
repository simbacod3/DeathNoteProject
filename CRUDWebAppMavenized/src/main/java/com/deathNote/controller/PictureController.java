package com.deathNote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.deathNote.model.Picture;
import com.deathNote.service.PictureService;

@Controller
public class PictureController {
	@Autowired
	private PictureService pictureService;
	
	@RequestMapping("/picture1")
	@ResponseBody
	public String getPicture1() {
		Picture p = pictureService.getPicture(1);
		
		return p.getUrl();
	}
}
