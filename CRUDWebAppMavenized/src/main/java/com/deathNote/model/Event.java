package com.deathNote.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Event {
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column
	private String description;
	@Column
	private Date date;
	@Column
	private boolean murder;
	@Column
	private String location;
	@Column
	private Boolean pointOfView;
	@Column
	private int idkiller;
	@OneToOne
	private Picture picture;
	@OneToOne
	private Episode episode;
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Person> persons = new ArrayList<Person>();
	

	public Event() {
		
	}


	public Event(int id, String description, Date date, boolean murder, String location, Boolean pointOfView,
			int idkiller, Picture picture, Episode episode, List<Person> persons) {
		super();
		this.id = id;
		this.description = description;
		this.date = date;
		this.murder = murder;
		this.location = location;
		this.pointOfView = pointOfView;
		this.idkiller = idkiller;
		this.picture = picture;
		this.episode = episode;
		this.persons = persons;
	}

	public List<Person> getPersons() {
		return persons;
	}

	public void setPersons(List<Person> persons) {
		this.persons = persons;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public boolean isMurder() {
		return murder;
	}

	public void setMurder(boolean murder) {
		this.murder = murder;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Boolean getPointOfView() {
		return pointOfView;
	}

	public void setPointOfView(Boolean pointOfView) {
		this.pointOfView = pointOfView;
	}

	public int getIdkiller() {
		return idkiller;
	}

	public void setIdkiller(int idkiller) {
		this.idkiller = idkiller;
	}
	public Picture getPicture() {
		return picture;
	}
	public void setPicture(Picture picture) {
		this.picture = picture;
	}
	public Episode getEpisode() {
		return episode;
	}
	public void setEpisode(Episode episode) {
		this.episode = episode;
	}

}
