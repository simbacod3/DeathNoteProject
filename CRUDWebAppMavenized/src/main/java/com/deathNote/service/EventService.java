package com.deathNote.service;

import java.util.Collections;
import java.util.List;

import com.deathNote.model.Event;

public interface EventService {
	public void add(Event event);
	public void edit(Event event);
	public void delete(Event event);
	public Event getEventById(int id);
	public List<Event> getAllEvents();
}
