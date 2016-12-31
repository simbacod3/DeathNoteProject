package com.deathNote.dao;

import com.deathNote.model.Admin;

public interface AdminDao {
	public void add(Admin admin);
	public void edit(Admin admin);
	public void delete(Admin admin);
	public Admin getAdminById(int id);
}
