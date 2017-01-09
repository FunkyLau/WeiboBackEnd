package com.domain;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Messages entity. @author MyEclipse Persistence Tools
 */

public class Messages implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	private Integer messagesId;
	private Users users;
	private String messagesType;
	private String messagesInfo;
	private Timestamp messagesTime;
	private Integer messagesCollectnum;
	private Integer messagesCommentnum;
	private Integer messagesTranspondnum;
	private Integer messagesAgreenum;
	private Integer messagesReadnum;
	private String messagesLabel;
	private Set<Collections> collectionses = new HashSet<Collections>(0);
	private Set<Pictures> pictureses = new HashSet<Pictures>(0);
	private Set<Comments> commentses = new HashSet<Comments>(0);
	private Set<Atusers> atuserses = new HashSet<Atusers>(0);

	// Constructors

	/** default constructor */
	public Messages() {
		super();
	}

//	// minimal constructor
//	public Messages(Users users) {
//		this.users = users;
//	}

	/** full constructor */
	public Messages(Integer messagesId,Users users, String messagesType, String messagesInfo,
			Timestamp messagesTime, Integer messagesCollectnum,
			Integer messagesCommentnum, Integer messagesTranspondnum,
			Integer messagesAgreenum, Integer messagesReadnum,
			String messagesLabel, Set<Collections> collectionses, Set<Pictures> pictureses,
			Set<Comments> commentses, Set<Atusers> atuserses) {
		super();
		this.messagesId = messagesId;
		this.users = users;
		this.messagesType = messagesType;
		this.messagesInfo = messagesInfo;
		this.messagesTime = messagesTime;
		this.messagesCollectnum = messagesCollectnum;
		this.messagesCommentnum = messagesCommentnum;
		this.messagesTranspondnum = messagesTranspondnum;
		this.messagesAgreenum = messagesAgreenum;
		this.messagesReadnum = messagesReadnum;
		this.messagesLabel = messagesLabel;
		this.collectionses = collectionses;
		this.pictureses = pictureses;
		this.commentses = commentses;
		this.atuserses = atuserses;
	}

	// Property accessors

	public Integer getMessagesId() {
		return this.messagesId;
	}

	public void setMessagesId(Integer messagesId) {
		this.messagesId = messagesId;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getMessagesType() {
		return this.messagesType;
	}

	public void setMessagesType(String messagesType) {
		this.messagesType = messagesType;
	}

	public String getMessagesInfo() {
		return this.messagesInfo;
	}

	public void setMessagesInfo(String messagesInfo) {
		this.messagesInfo = messagesInfo;
	}

	public Timestamp getMessagesTime() {
		return this.messagesTime;
	}

	public void setMessagesTime(Timestamp messagesTime) {
		this.messagesTime = messagesTime;
	}

	public Integer getMessagesCollectnum() {
		return this.messagesCollectnum;
	}

	public void setMessagesCollectnum(Integer messagesCollectnum) {
		this.messagesCollectnum = messagesCollectnum;
	}

	public Integer getMessagesCommentnum() {
		return this.messagesCommentnum;
	}

	public void setMessagesCommentnum(Integer messagesCommentnum) {
		this.messagesCommentnum = messagesCommentnum;
	}

	public Integer getMessagesTranspondnum() {
		return this.messagesTranspondnum;
	}

	public void setMessagesTranspondnum(Integer messagesTranspondnum) {
		this.messagesTranspondnum = messagesTranspondnum;
	}

	public Integer getMessagesAgreenum() {
		return this.messagesAgreenum;
	}

	public void setMessagesAgreenum(Integer messagesAgreenum) {
		this.messagesAgreenum = messagesAgreenum;
	}

	public Integer getMessagesReadnum() {
		return this.messagesReadnum;
	}

	public void setMessagesReadnum(Integer messagesReadnum) {
		this.messagesReadnum = messagesReadnum;
	}

	public String getMessagesLabel() {
		return this.messagesLabel;
	}

	public void setMessagesLabel(String messagesLabel) {
		this.messagesLabel = messagesLabel;
	}

	public Set<Collections> getCollectionses() {
		return this.collectionses;
	}

	public void setCollectionses(Set<Collections> collectionses) {
		this.collectionses = collectionses;
	}

	public Set<Pictures> getPictureses() {
		return this.pictureses;
	}

	public void setPictureses(Set<Pictures> pictureses) {
		this.pictureses = pictureses;
	}

	public Set<Comments> getCommentses() {
		return this.commentses;
	}

	public void setCommentses(Set<Comments> commentses) {
		this.commentses = commentses;
	}

	public Set<Atusers> getAtuserses() {
		return this.atuserses;
	}

	public void setAtuserses(Set<Atusers> atuserses) {
		this.atuserses = atuserses;
	}

}