package com.deathNote.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.deathNote.dao.PictureDao;
import com.deathNote.model.Picture;

@Repository
public class PicutreDaoImpl implements PictureDao{
	@Autowired
	SessionFactory session;
	
	@Override
	public void add(Picture pic) {
		session.getCurrentSession().save(pic);
	}

	@Override
	public void delete(Picture pic) {
		session.getCurrentSession().delete(pic);
	}

	@Override
	public Picture getPicture(int id) {
		return (Picture)session.getCurrentSession().get(Picture.class, id);
	}

}
