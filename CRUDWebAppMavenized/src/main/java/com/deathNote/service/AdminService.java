package com.deathNote.service;

import com.deathNote.model.Admin;

public interface AdminService {
	public void add(Admin admin);
	public void edit(Admin admin);
	public void delete(Admin admin);
	public Admin getAdminById(int id);
	public java.util.List<Admin> getAllAdmin();
}
