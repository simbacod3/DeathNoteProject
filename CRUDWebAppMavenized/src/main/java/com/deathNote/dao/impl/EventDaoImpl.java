package com.deathNote.dao.impl;

import java.util.Collections;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.deathNote.dao.EventDao;
import com.deathNote.model.Event;

import antlr.collections.List;

@Repository
public class EventDaoImpl implements EventDao {
	@Autowired
	SessionFactory session;
	
	@Override
	public void add(Event event) {
		session.getCurrentSession().save(event);
	}

	@Override
	public void edit(Event event) {
		session.getCurrentSession().update(event);
	}

	@Override
	public void delete(Event event) {
		session.getCurrentSession().delete(event);
	}

	@Override
	public Event getEventById(int id) {
		return (Event)session.getCurrentSession().get(Event.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public java.util.List<Event> getAllEvents() {
		
		return session.getCurrentSession().createSQLQuery("SELECT * FROM event ORDER BY date ASC").addEntity(Event.class).list();
	}

}
