package com.domain;

/**
 * Userinfo entity. @author MyEclipse Persistence Tools
 */

public class Userinfo implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	private Integer userinfoId;
	private Users users;
	private String userinfoTruename;
	private String userinfoAddress;
	private String userinfoSex;
	private String userinfoSexual;
	private String userinfoFeeling;
	private String userinfoBirthday;
	private String userinfoBloodtype;
	private String userinfoBlogurl;
	private String userinfoRealname;
	private String userinfoIntro;
	private String userinfoEmail;
	private String userinfoQqnumber;
	private String userinfoMessenger;
	private String userinfoProfession;
	private String userinfoLabel;

	// Constructors

	/** default constructor */
	public Userinfo() {
		super();
	}
/*
	// minimal constructor 
	public Userinfo(Users users) {
		this.users = users;
	}

	// full constructor
	public Userinfo(Users users, String userinfoTruename,
			String userinfoAddress, String userinfoSex, String userinfoSexual,
			String userinfoFeeling, String userinfoBirthday,
			String userinfoBloodtype, String userinfoBlogurl,
			String userinfoRealname, String userinfoIntro,
			String userinfoEmail, String userinfoQqnumber,
			String userinfoMessenger, String userinfoProfession,
			String userinfoLabel) {
		this.users = users;
		this.userinfoTruename = userinfoTruename;
		this.userinfoAddress = userinfoAddress;
		this.userinfoSex = userinfoSex;
		this.userinfoSexual = userinfoSexual;
		this.userinfoFeeling = userinfoFeeling;
		this.userinfoBirthday = userinfoBirthday;
		this.userinfoBloodtype = userinfoBloodtype;
		this.userinfoBlogurl = userinfoBlogurl;
		this.userinfoRealname = userinfoRealname;
		this.userinfoIntro = userinfoIntro;
		this.userinfoEmail = userinfoEmail;
		this.userinfoQqnumber = userinfoQqnumber;
		this.userinfoMessenger = userinfoMessenger;
		this.userinfoProfession = userinfoProfession;
		this.userinfoLabel = userinfoLabel;
	}
*/
	// Property accessors

	public Integer getUserinfoId() {
		return this.userinfoId;
	}

	public void setUserinfoId(Integer userinfoId) {
		this.userinfoId = userinfoId;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getUserinfoTruename() {
		return this.userinfoTruename;
	}

	public void setUserinfoTruename(String userinfoTruename) {
		this.userinfoTruename = userinfoTruename;
	}

	public String getUserinfoAddress() {
		return this.userinfoAddress;
	}

	public void setUserinfoAddress(String userinfoAddress) {
		this.userinfoAddress = userinfoAddress;
	}

	public String getUserinfoSex() {
		return this.userinfoSex;
	}

	public void setUserinfoSex(String userinfoSex) {
		this.userinfoSex = userinfoSex;
	}

	public String getUserinfoSexual() {
		return this.userinfoSexual;
	}

	public void setUserinfoSexual(String userinfoSexual) {
		this.userinfoSexual = userinfoSexual;
	}

	public String getUserinfoFeeling() {
		return this.userinfoFeeling;
	}

	public void setUserinfoFeeling(String userinfoFeeling) {
		this.userinfoFeeling = userinfoFeeling;
	}

	public String getUserinfoBirthday() {
		return this.userinfoBirthday;
	}

	public void setUserinfoBirthday(String userinfoBirthday) {
		this.userinfoBirthday = userinfoBirthday;
	}

	public String getUserinfoBloodtype() {
		return this.userinfoBloodtype;
	}

	public void setUserinfoBloodtype(String userinfoBloodtype) {
		this.userinfoBloodtype = userinfoBloodtype;
	}

	public String getUserinfoBlogurl() {
		return this.userinfoBlogurl;
	}

	public void setUserinfoBlogurl(String userinfoBlogurl) {
		this.userinfoBlogurl = userinfoBlogurl;
	}

	public String getUserinfoRealname() {
		return this.userinfoRealname;
	}

	public void setUserinfoRealname(String userinfoRealname) {
		this.userinfoRealname = userinfoRealname;
	}

	public String getUserinfoIntro() {
		return this.userinfoIntro;
	}

	public void setUserinfoIntro(String userinfoIntro) {
		this.userinfoIntro = userinfoIntro;
	}

	public String getUserinfoEmail() {
		return this.userinfoEmail;
	}

	public void setUserinfoEmail(String userinfoEmail) {
		this.userinfoEmail = userinfoEmail;
	}

	public String getUserinfoQqnumber() {
		return this.userinfoQqnumber;
	}

	public void setUserinfoQqnumber(String userinfoQqnumber) {
		this.userinfoQqnumber = userinfoQqnumber;
	}

	public String getUserinfoMessenger() {
		return this.userinfoMessenger;
	}

	public void setUserinfoMessenger(String userinfoMessenger) {
		this.userinfoMessenger = userinfoMessenger;
	}

	public String getUserinfoProfession() {
		return this.userinfoProfession;
	}

	public void setUserinfoProfession(String userinfoProfession) {
		this.userinfoProfession = userinfoProfession;
	}

	public String getUserinfoLabel() {
		return this.userinfoLabel;
	}

	public void setUserinfoLabel(String userinfoLabel) {
		this.userinfoLabel = userinfoLabel;
	}

}