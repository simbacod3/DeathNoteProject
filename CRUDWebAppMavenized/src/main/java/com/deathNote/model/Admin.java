package com.deathNote.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Admin {
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column
	private String firstname;
	@Column
	private String lastname;
	@Column
	private String username;
	@Column
	private int age;
	@Column
	private String description;
	@Column
	private int idpicture;
	@Column
	private String password;
	


	public Admin() {
		
	}
	public Admin( String firstname, String lastname, String username, int age, String description, int idpicture,
			String password) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.username = username;
		this.age = age;
		this.description = description;
		this.idpicture = idpicture;
		this.password = password;
	}
	public Admin(int id, String firstname, String lastname, String username, int age, String description, int idpicture,
			String password) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.username = username;
		this.age = age;
		this.description = description;
		this.idpicture = idpicture;
		this.password = password;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	} 
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getIdpicture() {
		return idpicture;
	}

	public void setIdpicture(int idpicture) {
		this.idpicture = idpicture;
	}
	
	
	
}
