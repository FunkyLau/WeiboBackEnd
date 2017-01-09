package com.domain;

import java.sql.Timestamp;

/**
 * Privateletter entity. @author MyEclipse Persistence Tools
 */

public class Privateletter implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	private Integer privateletterId;
	private Users usersByUsersReid;//收信用户
	private Users usersByUsersSid;//发信用户
	private String privateletterInfo;
	private Integer privateletterInfostatus;
	private Timestamp privateletterTime;

	// Constructors

	/** default constructor */
	public Privateletter() {
		super();
	}

	/** minimal constructor */
	public Privateletter(Users usersByUsersReid, Users usersByUsersSid) {
		this.usersByUsersReid = usersByUsersReid;
		this.usersByUsersSid = usersByUsersSid;
	}

	/** full constructor */
	public Privateletter(Users usersByUsersReid, Users usersByUsersSid,
			String privateletterInfo, Integer privateletterInfostatus,
			Timestamp privateletterTime) {
		this.usersByUsersReid = usersByUsersReid;
		this.usersByUsersSid = usersByUsersSid;
		this.privateletterInfo = privateletterInfo;
		this.privateletterInfostatus = privateletterInfostatus;
		this.privateletterTime = privateletterTime;
	}

	// Property accessors

	public Integer getPrivateletterId() {
		return this.privateletterId;
	}

	public void setPrivateletterId(Integer privateletterId) {
		this.privateletterId = privateletterId;
	}

	public Users getUsersByUsersReid() {
		return this.usersByUsersReid;
	}

	public void setUsersByUsersReid(Users usersByUsersReid) {
		this.usersByUsersReid = usersByUsersReid;
	}

	public Users getUsersByUsersSid() {
		return this.usersByUsersSid;
	}

	public void setUsersByUsersSid(Users usersByUsersSid) {
		this.usersByUsersSid = usersByUsersSid;
	}

	public String getPrivateletterInfo() {
		return this.privateletterInfo;
	}

	public void setPrivateletterInfo(String privateletterInfo) {
		this.privateletterInfo = privateletterInfo;
	}

	public Integer getPrivateletterInfostatus() {
		return this.privateletterInfostatus;
	}

	public void setPrivateletterInfostatus(Integer privateletterInfostatus) {
		this.privateletterInfostatus = privateletterInfostatus;
	}

	public Timestamp getPrivateletterTime() {
		return this.privateletterTime;
	}

	public void setPrivateletterTime(Timestamp privateletterTime) {
		this.privateletterTime = privateletterTime;
	}

}