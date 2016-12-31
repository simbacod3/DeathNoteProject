package com.deathNote.service;

import com.deathNote.model.Episode;

public interface EpisodeService {
	public void add(Episode episode);
	public void delete(Episode episode);
	public void edit(Episode episode);
	public Episode getEpisodeById(int id);
}
