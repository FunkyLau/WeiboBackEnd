package com.domain;

import java.sql.Timestamp;

/**
 * Relation entity. @author MyEclipse Persistence Tools
 */

public class Relation implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	private Integer relationId;//关系id
	private Users usersByUsersId;//关注用户id
	private Users usersByUsersByid;//被关注用户
	private Timestamp relationTime;
	private String relationNote;
	private String relationGroupname;

	// Constructors

	/** default constructor */
	public Relation() {
		super();
	}

//	/** minimal constructor */
//	public Relation(Users usersByUsersId, Users usersByUsersByid) {
//		this.usersByUsersId = usersByUsersId;
//		this.usersByUsersByid = usersByUsersByid;
//	}
//
//	/** full constructor */
//	public Relation(Users usersByUsersId, Users usersByUsersByid,
//			Timestamp relationTime, String relationNote,
//			String relationGroupname) {
//		this.usersByUsersId = usersByUsersId;
//		this.usersByUsersByid = usersByUsersByid;
//		this.relationTime = relationTime;
//		this.relationNote = relationNote;
//		this.relationGroupname = relationGroupname;
//	}

	// Property accessors

	public Integer getRelationId() {
		return this.relationId;
	}

	public void setRelationId(Integer relationId) {
		this.relationId = relationId;
	}

	public Users getUsersByUsersId() {
		return this.usersByUsersId;
	}

	public void setUsersByUsersId(Users usersByUsersId) {
		this.usersByUsersId = usersByUsersId;
	}

	public Users getUsersByUsersByid() {
		return this.usersByUsersByid;
	}

	public void setUsersByUsersByid(Users usersByUsersByid) {
		this.usersByUsersByid = usersByUsersByid;
	}

	public Timestamp getRelationTime() {
		return this.relationTime;
	}

	public void setRelationTime(Timestamp relationTime) {
		this.relationTime = relationTime;
	}

	public String getRelationNote() {
		return this.relationNote;
	}

	public void setRelationNote(String relationNote) {
		this.relationNote = relationNote;
	}

	public String getRelationGroupname() {
		return this.relationGroupname;
	}

	public void setRelationGroupname(String relationGroupname) {
		this.relationGroupname = relationGroupname;
	}

}