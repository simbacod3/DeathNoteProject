package com.deathNote.service.impl;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathNote.dao.PersonDao;
import com.deathNote.model.Person;
import com.deathNote.service.PersonService;

@Service
public class PersonServiceImpl implements PersonService{
	
	@Autowired
	PersonDao personDao;
	
	@Transactional
	public void add(Person person) {
		personDao.add(person);
	}

	@Transactional
	public void edit(Person person) {
		personDao.edit(person);
	}

	@Transactional
	public void delete(Person person) {
		personDao.delete(person);
	}

	@Transactional
	public Person getPersonById(int id) {
		return personDao.getPersonById(id);
	}

	@Transactional
	public Collections getAllPerson() {
		return personDao.getAllPerson();
	}

}
