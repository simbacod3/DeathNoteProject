package com.deathNote.dao.impl;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.deathNote.dao.AdminDao;
import com.deathNote.model.Admin;
import com.deathNote.model.Event;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	SessionFactory session;
	
	@Override
	public void add(Admin admin) {
		session.getCurrentSession().save(admin);
	}

	@Override
	public void edit(Admin admin) {
		session.getCurrentSession().update(admin);
	}

	@Override
	public void delete(Admin admin) {
		session.getCurrentSession().delete(admin);
	}

	@Override
	public Admin getAdminById(int id) {
		return (Admin)session.getCurrentSession().get(Admin.class,id);
	}

	@Override
	public java.util.List<Admin> getAllAdmin() {
		return  session.getCurrentSession().createSQLQuery("SELECT * FROM admin").addEntity(Admin.class).list();
	}
	
}
