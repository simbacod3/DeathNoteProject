package com.deathNote.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathNote.dao.EpisodeDao;
import com.deathNote.model.Episode;
import com.deathNote.service.EpisodeService;

@Service
public class EpisodeServiceImpl implements EpisodeService {
	@Autowired
	private EpisodeDao episodeDao;
	
	@Transactional
	public void add(Episode episode) {
		episodeDao.add(episode);
	}

	@Transactional
	public void delete(Episode episode) {
		episodeDao.delete(episode);
	}

	@Transactional
	public void edit(Episode episode) {
		episodeDao.edit(episode);
	}

	@Transactional
	public Episode getEpisodeById(int id) {
		return episodeDao.getEpisodeById(id);
	}

}
