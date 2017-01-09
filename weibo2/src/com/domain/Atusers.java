package com.domain;

import java.sql.Timestamp;

/**
 * Atusers entity. @author MyEclipse Persistence Tools
 */

public class Atusers implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	private Integer atusersId;
	private Messages messages;
	private Users users;
	private Timestamp atusersTime;

	// Constructors

	/** default constructor */
	public Atusers() {
		super();
	}

	/** minimal constructor */
	public Atusers(Messages messages, Users users) {
		this.messages = messages;
		this.users = users;
	}

	/** full constructor */
	public Atusers(Messages messages, Users users, Timestamp atusersTime) {
		this.messages = messages;
		this.users = users;
		this.atusersTime = atusersTime;
	}

	// Property accessors

	public Integer getAtusersId() {
		return this.atusersId;
	}

	public void setAtusersId(Integer atusersId) {
		this.atusersId = atusersId;
	}

	public Messages getMessages() {
		return this.messages;
	}

	public void setMessages(Messages messages) {
		this.messages = messages;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Timestamp getAtusersTime() {
		return this.atusersTime;
	}

	public void setAtusersTime(Timestamp atusersTime) {
		this.atusersTime = atusersTime;
	}

}