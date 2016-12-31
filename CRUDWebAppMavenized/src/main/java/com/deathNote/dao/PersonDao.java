package com.deathNote.dao;

import java.util.Collections;

import com.deathNote.model.Person;


public interface PersonDao {
	public void add(Person person);
	public void edit(Person person);
	public void delete(Person person);
	public Person getPersonById(int id);
	public Collections getAllPerson();
}
