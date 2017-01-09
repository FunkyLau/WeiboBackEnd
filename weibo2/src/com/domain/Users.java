package com.domain;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	private Integer usersId;
	private String usersEmail;
	private String usersPassword;
	private String usersNikename;
	private Timestamp usersTime;
	private Integer usersStatus;
	private Set<Userinfo> userinfos = new HashSet<Userinfo>(0);
	private Set<Relation> relationsForUsersId = new HashSet<Relation>(0);
	private Set<Privateletter> privatelettersForUsersSid = new HashSet<Privateletter>(0);
	private Set<Comments> commentses = new HashSet<Comments>(0);
	private Set<Pictures> pictureses = new HashSet<Pictures>(0);
	private Set<Collections> collectionses = new HashSet<Collections>(0);
	private Set<Atusers> atuserses = new HashSet<Atusers>(0);
	private Set<Relation> relationsForUsersByid = new HashSet<Relation>(0);
	private Set<Privateletter> privatelettersForUsersReid = new HashSet<Privateletter>(0);
	private Set<Messages> messageses = new HashSet<Messages>(0);

	// Constructors

	//default constructor
	public Users() {
	}
/*
	// minimal constructor 
	public Users(String usersEmail, String usersPassword, String usersNikename,
			Timestamp usersTime, Integer usersStatus) {
		this.usersEmail = usersEmail;
		this.usersPassword = usersPassword;
		this.usersNikename = usersNikename;
		this.usersTime = usersTime;
		this.usersStatus = usersStatus;
	}

	// full constructor
	public Users(String usersEmail, String usersPassword, String usersNikename,
			Timestamp usersTime, Integer usersStatus, Set<Userinfo> userinfos,
			Set<Relation> relationsForUsersId, Set<Privateletter> privatelettersForUsersSid,
			Set<Comments> commentses, Set<Pictures> pictureses, Set<Collections> collectionses, Set<Atusers> atuserses,
			Set<Relation> relationsForUsersByid, Set<Privateletter> privatelettersForUsersReid,
			Set<Messages> messageses) {
		this.usersEmail = usersEmail;
		this.usersPassword = usersPassword;
		this.usersNikename = usersNikename;
		this.usersTime = usersTime;
		this.usersStatus = usersStatus;
		this.userinfos = userinfos;
		this.relationsForUsersId = relationsForUsersId;
		this.privatelettersForUsersSid = privatelettersForUsersSid;
		this.commentses = commentses;
		this.pictureses = pictureses;
		this.collectionses = collectionses;
		this.atuserses = atuserses;
		this.relationsForUsersByid = relationsForUsersByid;
		this.privatelettersForUsersReid = privatelettersForUsersReid;
		this.messageses = messageses;
	}
*/
	// Property accessors

	public Integer getUsersId() {
		return this.usersId;
	}

	public void setUsersId(Integer usersId) {
		this.usersId = usersId;
	}

	public String getUsersEmail() {
		return this.usersEmail;
	}

	public void setUsersEmail(String usersEmail) {
		this.usersEmail = usersEmail;
	}

	public String getUsersPassword() {
		return this.usersPassword;
	}

	public void setUsersPassword(String usersPassword) {
		this.usersPassword = usersPassword;
	}

	public String getUsersNikename() {
		return this.usersNikename;
	}

	public void setUsersNikename(String usersNikename) {
		this.usersNikename = usersNikename;
	}

	public Timestamp getUsersTime() {
		return this.usersTime;
	}

	public void setUsersTime(Timestamp usersTime) {
		this.usersTime = usersTime;
	}

	public Integer getUsersStatus() {
		return this.usersStatus;
	}

	public void setUsersStatus(Integer usersStatus) {
		this.usersStatus = usersStatus;
	}

	public Set<Userinfo> getUserinfos() {
		return this.userinfos;
	}

	public void setUserinfos(Set<Userinfo> userinfos) {
		this.userinfos = userinfos;
	}

	public Set<Relation> getRelationsForUsersId() {
		return this.relationsForUsersId;
	}

	public void setRelationsForUsersId(Set<Relation> relationsForUsersId) {
		this.relationsForUsersId = relationsForUsersId;
	}

	public Set<Privateletter> getPrivatelettersForUsersSid() {
		return this.privatelettersForUsersSid;
	}

	public void setPrivatelettersForUsersSid(Set<Privateletter> privatelettersForUsersSid) {
		this.privatelettersForUsersSid = privatelettersForUsersSid;
	}

	public Set<Comments> getCommentses() {
		return this.commentses;
	}

	public void setCommentses(Set<Comments> commentses) {
		this.commentses = commentses;
	}

	public Set<Pictures> getPictureses() {
		return this.pictureses;
	}

	public void setPictureses(Set<Pictures> pictureses) {
		this.pictureses = pictureses;
	}

	public Set<Collections> getCollectionses() {
		return this.collectionses;
	}

	public void setCollectionses(Set<Collections> collectionses) {
		this.collectionses = collectionses;
	}

	public Set<Atusers> getAtuserses() {
		return this.atuserses;
	}

	public void setAtuserses(Set<Atusers> atuserses) {
		this.atuserses = atuserses;
	}

	public Set<Relation> getRelationsForUsersByid() {
		return this.relationsForUsersByid;
	}

	public void setRelationsForUsersByid(Set<Relation> relationsForUsersByid) {
		this.relationsForUsersByid = relationsForUsersByid;
	}

	public Set<Privateletter> getPrivatelettersForUsersReid() {
		return this.privatelettersForUsersReid;
	}

	public void setPrivatelettersForUsersReid(Set<Privateletter> privatelettersForUsersReid) {
		this.privatelettersForUsersReid = privatelettersForUsersReid;
	}

	public Set<Messages> getMessageses() {
		return this.messageses;
	}

	public void setMessageses(Set<Messages> messageses) {
		this.messageses = messageses;
	}

}