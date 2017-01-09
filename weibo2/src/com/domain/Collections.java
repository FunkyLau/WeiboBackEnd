package com.domain;

import java.sql.Timestamp;

/**
 * Collections entity. @author MyEclipse Persistence Tools
 */

public class Collections implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	private Integer collectionsId;
	private Messages messages;
	private Users users;
	private Timestamp collectionsTime;
	private Integer collectionsStatus;

	// Constructors

	// default constructor
	public Collections() {
		super();
	}
	/*
	// minimal constructor
	public Collections(Messages messages, Users users, Integer collectionsSatus) {
		this.messages = messages;
		this.users = users;
		this.collectionsStatus = collectionsSatus;
	}
*/
	// full constructor
	public Collections(Integer collectionsId,Messages messages, Users users,
			Timestamp collectionsTime, Integer collectionsSatus) {
		super();
		this.collectionsId = collectionsId;
		this.messages = messages;
		this.users = users;
		this.collectionsTime = collectionsTime;
		this.collectionsStatus = collectionsSatus;
	}

	// Property accessors

	public Integer getCollectionsId() {
		return this.collectionsId;
	}

	public void setCollectionsId(Integer collectionsId) {
		this.collectionsId = collectionsId;
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

	public Timestamp getCollectionsTime() {
		return this.collectionsTime;
	}

	public void setCollectionsTime(Timestamp collectionsTime) {
		this.collectionsTime = collectionsTime;
	}

	public Integer getCollectionsStatus() {
		return this.collectionsStatus;
	}

	public void setCollectionsStatus(Integer collectionsSatus) {
		this.collectionsStatus = collectionsSatus;
	}

}