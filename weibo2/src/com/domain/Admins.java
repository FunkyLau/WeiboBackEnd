package com.domain;

/**
 * Admins entity. @author MyEclipse Persistence Tools
 */

public class Admins implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	private Integer adminsId;
	private String adminsName;
	private String adminsPass;
	private String adminsType;

	// Constructors

	/** default constructor */
	public Admins() {
		super();
	}

	/** full constructor */
	public Admins(Integer adminsId,String adminsName, String adminsPass, String adminsType) {
		this.adminsId = adminsId;
		this.adminsName = adminsName;
		this.adminsPass = adminsPass;
		this.adminsType = adminsType;
	}

	// Property accessors

	public Integer getAdminsId() {
		return this.adminsId;
	}

	public void setAdminsId(Integer adminsId) {
		this.adminsId = adminsId;
	}

	public String getAdminsName() {
		return this.adminsName;
	}

	public void setAdminsName(String adminsName) {
		this.adminsName = adminsName;
	}

	public String getAdminsPass() {
		return this.adminsPass;
	}

	public void setAdminsPass(String adminsPass) {
		this.adminsPass = adminsPass;
	}

	public String getAdminsType() {
		return this.adminsType;
	}

	public void setAdminsType(String adminsType) {
		this.adminsType = adminsType;
	}

}