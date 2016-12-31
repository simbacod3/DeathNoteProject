package com.deathNote.dao.impl;

import java.util.Collections;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.deathNote.dao.PersonDao;
import com.deathNote.model.Person;

@Repository
public class PersonDaoImpl implements PersonDao {
	@Autowired
	SessionFactory session;
	
	@Override
	public void add(Person person) {
		session.getCurrentSession().save(person);
	}

	@Override
	public void edit(Person person) {
		session.getCurrentSession().update(person);
		
	}

	@Override
	public void delete(Person person) {
		session.getCurrentSession().delete(person);
	}

	@Override
	public Person getPersonById(int id) {
		return (Person)session.getCurrentSession().get(Person.class, id);
	}

	@Override
	public Collections getAllPerson() {
		return (Collections)session.getCurrentSession().createQuery("from person").list();
	}

}
