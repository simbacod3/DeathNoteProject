package com.deathNote.service.impl;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathNote.dao.EventDao;
import com.deathNote.model.Event;
import com.deathNote.service.EventService;


@Service
public class EventServiceImpl implements EventService{
	@Autowired
	EventDao eventDao;
	
	@Transactional
	public void add(Event event) {
		eventDao.add(event);
	}

	@Transactional
	public void edit(Event event) {
		eventDao.edit(event);
	}

	@Transactional
	public void delete(Event event) {
		eventDao.delete(event);
	}

	@Transactional
	public Event getEventById(int id) {
		return eventDao.getEventById(id);
	}

	@Transactional
	public List<Event> getAllEvents() {
		return eventDao.getAllEvents();
	}

}
