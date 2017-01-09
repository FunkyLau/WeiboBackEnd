package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.domain.Messages;
import com.domain.ObjectResult;
import com.domain.Relation;
import com.domain.Userinfo;
import com.domain.Users;
import com.service.UserinfoService;
import com.utils.ComboBoxBean;
import com.utils.Pagination;

public class UserinfoAction extends BaseAction implements UserinfoService {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserinfoService userinfoService;
	private Userinfo userinfo;

	public Userinfo getUserinfo() {
		return userinfo;
	}

	private Users users;
	private String birthday;
	private String pageflag;
	private String updateflag;

	private String userMessages;
	private String userFans;
	private String userAttention;

	public void setUpdateflag(String updateflag) {
		this.updateflag = updateflag;
	}

	public Users getUsers() {
		return users;
	}

	public String getPageflag() {
		return pageflag;
	}

	public void setPageflag(String pageflag) {
		this.pageflag = pageflag;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public void setUserinfoService(UserinfoService userinfoService) {
		this.userinfoService = userinfoService;
	}
	
	public String query() {

		pagination = new Pagination(this.page, this.rows);
		String sql = spliceSql();
		pagination.setTotal(baseService.getCount(Userinfo.class, sql));
		pagination.setRows(baseService.getObjects(Userinfo.class, sql,
				pagination.getFrom(), pagination.getSize(), this.order,
				this.sort));

		return "query";
	}
	
	private String spliceSql() {

		String whereSql = " where 1=1 ";
		if (userinfo != null) {
			// 序号
			String trueName = userinfo.getUserinfoTruename();
			if (!"".equals(trueName) && (trueName != null)) {
				whereSql += " and  userinfoTruename like '%" + trueName + "%'";
			}
			String sexUal = userinfo.getUserinfoSexual();
			if (!"".equals(sexUal) && (sexUal != null)) {
				whereSql += " and  userinfoSexual = '" + sexUal + "'";
			}
			String sex = userinfo.getUserinfoSex();
			if (!"".equals(sex) && (sex != null)) {
				whereSql += " and  userinfoSex = '" + sex + "'";
			}
			String bloodType = userinfo.getUserinfoBloodtype();
			if (!"".equals(bloodType) && (bloodType != null)) {
				whereSql += " and  userinfoBloodtype = '" + bloodType + "'";
			}
		}
		return whereSql;
	}

	public String update() {
		/*
		 * Date date = null; try { date = new
		 * SimpleDateFormat("yyyyMMdd").parse(birthday); } catch (ParseException
		 * e) { e.printStackTrace(); }
		 */
		baseService.saveOrUpdateObject(users);
		userinfo.setUsers(users);
		userinfo.setUserinfoBirthday(birthday);
		this.flag = baseService.saveOrUpdateObject(userinfo);
		return "saveorupdate";
	}

	public String saveOrUpdateObject() {
		this.flag = baseService.saveOrUpdateObject(userinfo);
		return "saveorupdate";
	}

	public String deleteObject() {
		this.flag = baseService.deleteObjects(Userinfo.class, ids);
		return "delete";
	}

	public String getAllUsers() {
		List<Users> users = baseService.getAllObjects(Users.class);
		for (Users user : users) {
			list.add(new ComboBoxBean(user.getUsersId(), user.getUsersEmail(), false));
		}
		return "queryall";
	}

	public String getUsersInfo() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Users user = (Users) request.getSession().getAttribute("user");

		List<Messages> listLoginMessages = baseService.getObjects(
				Messages.class, "where users.usersId=" + user.getUsersId());
		List<Relation> listLoginFans = baseService.getObjects(Relation.class,
				"where usersByUsersByid.usersId=" + user.getUsersId());
		List<Relation> listLoginAtt = baseService.getObjects(Relation.class,
				"where usersByUsersId.usersId=" + user.getUsersId());
		request.getSession().setAttribute("userMessages", listLoginMessages.size());
		request.getSession().setAttribute("userFans", listLoginFans.size());
		request.getSession().setAttribute("userAttention", listLoginAtt.size());

		if (user != null) {
			Userinfo userinfo = (Userinfo) baseService.getObjects(
					Userinfo.class, "where users.usersId=" + user.getUsersId()).get(0);
			//System.out.println(""+userinfo.getUserinfoEmail());
			//获取成功
			request.getSession().setAttribute("userinfos", userinfo);
			pageflag = "userinfo";
			request.setAttribute("pageflag", pageflag);
			return "userinfo";
		} else {
			return "userinfonull";
		}
	}

	public String updateUserInfo() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession httpSession = request.getSession();
		Users sessionusers = (Users) httpSession.getAttribute("user");
		if (userinfo != null && sessionusers != null) {

			Integer usersId = sessionusers.getUsersId();
			//System.out.println(usersId+"");
			//获取用户id成功
			Users findUsers = (Users) baseService.getObjectById(Users.class,usersId);
			Userinfo oldUserinfo = (Userinfo) baseService.getObjects(
					Userinfo.class, "where users.usersId = " + usersId).get(0);
			Integer oldUserinfoId = oldUserinfo.getUserinfoId();
			if ("jbinfo".equals(updateflag)) {
				if (users != null) {
					//System.out.println(users.getUsersNikename()+"");
					//获取用户昵称成功
					findUsers.setUsersNikename(users.getUsersNikename());
				}
				baseService.saveOrUpdateObject(findUsers);
				if (userinfo.getUserinfoTruename() != null
						&& userinfo.getUserinfoTruename() != "")
				oldUserinfo.setUserinfoTruename(userinfo.getUserinfoTruename());
				oldUserinfo.setUserinfoAddress(userinfo.getUserinfoAddress());
				oldUserinfo.setUserinfoSex(userinfo.getUserinfoSex());
				oldUserinfo.setUserinfoSexual(userinfo.getUserinfoSexual());
				oldUserinfo.setUserinfoFeeling(userinfo.getUserinfoFeeling());
				oldUserinfo.setUserinfoBirthday(userinfo.getUserinfoBirthday());
				oldUserinfo.setUserinfoBloodtype(userinfo.getUserinfoBloodtype());
				oldUserinfo.setUserinfoBlogurl(userinfo.getUserinfoBlogurl());
				oldUserinfo.setUserinfoRealname(userinfo.getUserinfoRealname());
				oldUserinfo.setUserinfoIntro(userinfo.getUserinfoIntro());

				httpSession.removeAttribute("user");
				Users newusers = (Users) baseService.getObjectById(Users.class,usersId);
				httpSession.setAttribute("user", newusers);

			}
			if ("lxinfo".equals(updateflag)) {
				//更改基本信息
				oldUserinfo.setUserinfoEmail(userinfo.getUserinfoEmail());
				oldUserinfo.setUserinfoQqnumber(userinfo.getUserinfoQqnumber());
				oldUserinfo.setUserinfoMessenger(userinfo.getUserinfoMessenger());

			}
			if ("zyinfo".equals(updateflag)) {
				//更改专业信息
				oldUserinfo.setUserinfoProfession(userinfo.getUserinfoProfession());

			}
			if ("bqinfo".equals(updateflag)) {
				//更改个人标签
				oldUserinfo.setUserinfoLabel(userinfo.getUserinfoLabel());

			}
			baseService.saveOrUpdateObject(oldUserinfo);
			System.out.println(oldUserinfo.toString()
					+ "*****************************");
			System.out.println("update**************************" + updateflag);
			httpSession.removeAttribute("userinfos");
			Userinfo newuserinfo = (Userinfo) baseService.getObjectById(
					Userinfo.class, oldUserinfoId);
			System.out.println("*************************"
					+ newuserinfo.toString());
			httpSession.setAttribute("userinfos", newuserinfo);
			/*
			 * try { Thread.sleep(1000); } catch (InterruptedException e) {
			 * e.printStackTrace(); }
			 */
		}
		pageflag = "userinfo";
		request.setAttribute("pageflag", pageflag);
		return "updateUserInfo";
	}
	
	public String iosUpdateUserNickName(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if (request == null) {
			result = new ObjectResult("100", "false", null);
			return "iosFail";
		}
		Integer usersId = Integer.parseInt(request.getParameter("userId"));
		//获取用户id成功
		Users findUsers = (Users) baseService.getObjectById(Users.class,usersId);
		
		return "iosUpdateUserNickName";
	}
	
	public String iosUpdateUserInfo() {
		HttpServletRequest request = ServletActionContext.getRequest();
		if (request == null) {
			result = new ObjectResult("100", "false", null);
			return "iosFail";
		}
		Integer usersId = Integer.parseInt(request.getParameter("userId"));
		String trueName = request.getParameter("userName");
		String introStr = request.getParameter("introStr");
		String addrStr = request.getParameter("addrStr");
		String birthDate = request.getParameter("birthDate");
		//System.out.println(usersId+"");
		//获取用户id成功
		Users findUsers = (Users) baseService.getObjectById(Users.class,usersId);
		//获取旧的用户信息
		Userinfo oldUserinfo = (Userinfo) baseService.getObjects(
				Userinfo.class, "where users.usersId = " + usersId).get(0);
		//Integer oldUserinfoId = oldUserinfo.getUserinfoId();
//		if (users != null) {
//			//System.out.println(users.getUsersNikename()+"");
//			//获取用户昵称成功
//			findUsers.setUsersNikename(users.getUsersNikename());
//		}
		//baseService.saveOrUpdateObject(findUsers);
		
		//已经登记过姓名，设置用户信息
		
		oldUserinfo.setUserinfoTruename(trueName);
		oldUserinfo.setUserinfoRealname(trueName);
		oldUserinfo.setUserinfoAddress(addrStr);
		//oldUserinfo.setUserinfoSex(userinfo.getUserinfoSex());
		
		oldUserinfo.setUserinfoBirthday(birthDate);
		
		oldUserinfo.setUserinfoIntro(introStr);

		
		//更改基本信息
		oldUserinfo.setUserinfoEmail(findUsers.getUsersEmail());
		oldUserinfo.setUserinfoQqnumber("");
		oldUserinfo.setUserinfoMessenger("");
		oldUserinfo.setUserinfoBlogurl("");
		oldUserinfo.setUserinfoBloodtype("");
		//更改专业信息
		oldUserinfo.setUserinfoProfession("");
		//更改个人标签
		oldUserinfo.setUserinfoLabel("");
		oldUserinfo.setUserinfoSex("男");
		oldUserinfo.setUserinfoSexual("");
		oldUserinfo.setUserinfoFeeling("");
		
		baseService.saveOrUpdateObject(oldUserinfo);
		System.out.println(oldUserinfo.toString()
				+ "*****************************");
		
		Userinfo newuserinfo = (Userinfo) baseService.getObjects(
				Userinfo.class, "where users.usersId = " + usersId).get(0);
		//Userinfo oldUserinfo = (Userinfo) baseService.getObjects(
		//Userinfo.class, "where users.usersId = " + usersId).get(0);
		System.out.println("*************************"
				+ newuserinfo.toString());
		Users newusers = (Users) baseService.getObjectById(Users.class,usersId);
		//pageflag = "userinfo";
		if (newuserinfo != null) {
			//String usersId = users.getUsersId().toString();
			result = new ObjectResult("0","success",newusers);
			return "iosUpdateUserInfo";
		}else{
			result = new ObjectResult("100","false",newusers);
			return "iosFail";
		}
	}
	
}
