package com.deathNote.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.deathNote.dao.EpisodeDao;
import com.deathNote.model.Episode;
import com.deathNote.model.Event;

@Repository
public class EpisodeDaoImpl implements EpisodeDao {
	
	@Autowired
	SessionFactory session;
	
	@Override
	public void add(Episode episode) {
		session.getCurrentSession().save(episode);
	}

	@Override
	public void delete(Episode episode) {
		session.getCurrentSession().delete(episode);
	}

	@Override
	public void edit(Episode episode) {
		session.getCurrentSession().update(episode);
	}

	@Override
	public Episode getEpisodeById(int id) {
		return (Episode)session.getCurrentSession().get(Episode.class,id);
	}

	@Override
	public List<Episode> getAllEpisodes() {
		return session.getCurrentSession().createSQLQuery("SELECT * FROM episode ORDER BY number ASC").addEntity(Episode.class).list();
	}

}
