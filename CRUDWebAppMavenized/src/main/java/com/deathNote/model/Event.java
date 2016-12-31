package com.deathNote.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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
	private boolean pointOfView;
	@Column
	private int idkiller;
	@Column
	private int idpicture;
	
	public Event() {
		
	}

	public Event(int id, String description, Date date, boolean murder, String location, boolean pointOfView,
			int idkiller, int idpicture) {
		super();
		this.id = id;
		this.description = description;
		this.date = date;
		this.murder = murder;
		this.location = location;
		this.pointOfView = pointOfView;
		this.idkiller = idkiller;
		this.idpicture = idpicture;
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

	public boolean isPointOfView() {
		return pointOfView;
	}

	public void setPointOfView(boolean pointOfView) {
		this.pointOfView = pointOfView;
	}

	public int getIdkiller() {
		return idkiller;
	}

	public void setIdkiller(int idkiller) {
		this.idkiller = idkiller;
	}

	public int getIdpicture() {
		return idpicture;
	}

	public void setIdpicture(int idpicture) {
		this.idpicture = idpicture;
	}
}
