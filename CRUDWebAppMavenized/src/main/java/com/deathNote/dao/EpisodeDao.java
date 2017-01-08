package com.deathNote.dao;

import java.util.List;

import com.deathNote.model.Episode;

public interface EpisodeDao {
	public void add(Episode episode);
	public void delete(Episode episode);
	public void edit(Episode episode);
	public Episode getEpisodeById(int id);
	public List<Episode> getAllEpisodes();
}
