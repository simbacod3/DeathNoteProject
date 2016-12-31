package com.deathNote.service;

import com.deathNote.model.Picture;

public interface PictureService {
	public void add(Picture pic);
	public void delete(Picture pic);
	public Picture getPicture(int id);
}
