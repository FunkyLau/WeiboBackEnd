package com.domain;

import java.sql.Timestamp;

/**
 * Pictures entity. @author MyEclipse Persistence Tools
 */

public class Pictures implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	private Integer picturesId;
	private Messages messages;
	private Users users;
	private String picturesUrl;
	private String picturesType;
	private Timestamp picturesTime;

	// Constructors

	/** default constructor */
	public Pictures() {
		super();
	}

	/** full constructor */
	public Pictures(Integer picturesId,Messages messages, Users users, String picturesUrl,
			String picturesType, Timestamp picturesTime) {
		super();
		this.picturesId = picturesId;
		this.messages = messages;
		this.users = users;
		this.picturesUrl = picturesUrl;
		this.picturesType = picturesType;
		this.picturesTime = picturesTime;
	}

	// Property accessors

	public Integer getPicturesId() {
		return this.picturesId;
	}

	public void setPicturesId(Integer picturesId) {
		this.picturesId = picturesId;
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

	public String getPicturesUrl() {
		return this.picturesUrl;
	}

	public void setPicturesUrl(String picturesUrl) {
		this.picturesUrl = picturesUrl;
	}

	public String getPicturesType() {
		return this.picturesType;
	}

	public void setPicturesType(String picturesType) {
		this.picturesType = picturesType;
	}

	public Timestamp getPicturesTime() {
		return this.picturesTime;
	}

	public void setPicturesTime(Timestamp picturesTime) {
		this.picturesTime = picturesTime;
	}

}