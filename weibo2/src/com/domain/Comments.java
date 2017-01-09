package com.domain;

import java.sql.Timestamp;

/**
 * Comments entity. @author MyEclipse Persistence Tools
 */

public class Comments implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	private Integer commentsId;
	private Messages messages;
	private Users users;
	private String commentsInfo;
	private Integer commentsInfostatus;
	private Timestamp commentsTime;

	// Constructors

	/** default constructor */
	public Comments() {
		super();
	}

//	/** minimal constructor */
//	public Comments(Messages messages, Users users) {
//		this.messages = messages;
//		this.users = users;
//	}

//	/** full constructor */
//	public Comments(Messages messages, Users users, String commentsInfo,
//			Integer commentsInfostatus, Timestamp commentsTime) {
//		super();
//		this.messages = messages;
//		this.users = users;
//		this.commentsInfo = commentsInfo;
//		this.commentsInfostatus = commentsInfostatus;
//		this.commentsTime = commentsTime;
//	}

	// Property accessors

	public Integer getCommentsId() {
		return this.commentsId;
	}

	public void setCommentsId(Integer commentsId) {
		this.commentsId = commentsId;
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

	public String getCommentsInfo() {
		return this.commentsInfo;
	}

	public void setCommentsInfo(String commentsInfo) {
		this.commentsInfo = commentsInfo;
	}

	public Integer getCommentsInfostatus() {
		return this.commentsInfostatus;
	}

	public void setCommentsInfostatus(Integer commentsInfostatus) {
		this.commentsInfostatus = commentsInfostatus;
	}

	public Timestamp getCommentsTime() {
		return this.commentsTime;
	}

	public void setCommentsTime(Timestamp commentsTime) {
		this.commentsTime = commentsTime;
	}

}