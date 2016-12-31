package com.deathNote.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathNote.dao.PictureDao;
import com.deathNote.model.Picture;
import com.deathNote.service.PictureService;

@Service
public class PictureServiceImpl implements PictureService{
	@Autowired
	PictureDao picture;
	
	@Transactional
	public void add(Picture pic) {
		picture.add(pic);
	}

	@Transactional
	public void delete(Picture pic) {
		picture.delete(pic);
	}

	@Transactional
	public Picture getPicture(int id) {
		return picture.getPicture(id);
	}

}
