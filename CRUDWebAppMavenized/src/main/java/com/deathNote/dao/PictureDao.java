package com.deathNote.dao;

import com.deathNote.model.Picture;

public interface PictureDao {
	public void add(Picture pic);
	public void delete(Picture pic);
	public Picture getPicture(int id);
}
