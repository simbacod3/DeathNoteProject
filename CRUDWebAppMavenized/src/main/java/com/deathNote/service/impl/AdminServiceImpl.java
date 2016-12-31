package com.deathNote.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathNote.dao.AdminDao;
import com.deathNote.model.Admin;
import com.deathNote.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;
	
	@Transactional
	public void add(Admin admin) {
		adminDao.add(admin);
	}

	@Transactional
	public void edit(Admin admin) {
		adminDao.edit(admin);
	}

	@Transactional
	public void delete(Admin admin) {
		adminDao.delete(admin);
	}

	@Transactional
	public Admin getAdminById(int id) {
		return adminDao.getAdminById(id);
	}

}
