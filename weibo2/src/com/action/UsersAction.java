package com.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.domain.Messages;
import com.domain.Pictures;
import com.domain.Relation;
import com.domain.Userinfo;
import com.domain.Users;
import com.domain.ObjectResult;
import com.opensymphony.xwork2.ActionContext;
import com.service.UsersService;
import com.utils.Pagination;
import com.utils.ShowUsers;
import com.utils.ShowUsersInfo;


public class UsersAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Users users;
	private UsersService usersService;
	private String code;
	private String searchKey;
	private String searchValue;
	private ShowUsers showUsers;
	private String byUsersId;
	private String groupName;
	private String relationNote;
	

	

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public UsersService getUsersService() {
		return usersService;
	}

	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public ShowUsers getShowUsers() {
		return showUsers;
	}

	public void setShowUsers(ShowUsers showUsers) {
		this.showUsers = showUsers;
	}

	public String getByUsersId() {
		return byUsersId;
	}

	public void setByUsersId(String byUsersId) {
		this.byUsersId = byUsersId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getRelationNote() {
		return relationNote;
	}

	public void setRelationNote(String relationNote) {
		this.relationNote = relationNote;
	}
	
	public String query(){
		pagination =new Pagination(this.page,this.rows);
		String sql = spliceSql();
		pagination.setTotal(baseService.getCount(Users.class, sql));
		pagination.setRows(baseService.getObjects(Users.class, sql, pagination.getFrom(), pagination.getSize(), this.order, this.sort));
		return "query";
		
	}
	
	public String spliceSql(){
		
		String whereSql = "where 1=1";
		if (users != null) {
			//序号
			String email = users.getUsersEmail();
			if(!"".equals(email)&&(email!=null)){
				whereSql += " and usersEmail like '%" + email + "%'";
			}
			
			String nikeName = users.getUsersNikename();
			if (!"".equals(nikeName)&&(nikeName!=null)) {
				whereSql += " and usersNikename like '%" +nikeName + "%'";
			}
			
			Integer status = users.getUsersStatus();
			if (!"".equals(status) && status!=null)  {
				whereSql += " and usersStatus = '" + status + "'";
			}
		}
		
		return whereSql;
	}
	
	public String saveOrUpdateObject(){
		this.flag = baseService.saveOrUpdateObject(users);
		return "saveorupdate";
	}
	
	public String deleteObject(){
		String[] arrids = ids.split(",");
		Users delUser = null;
		for (int i = 0; i < arrids.length; i++) {
			delUser = (Users)baseService.getObjectById(Users.class, Integer.valueOf(arrids[i]));
			baseService.deleteObject(delUser);
		}
		this.flag = true;
		return "delete";
	}
	public String checkEmail(){
		this.flag = baseService.checkProperty(Users.class, "usersEmail", users.getUsersEmail(), users.getUsersId());
		return "check";
	}
	
	public String checkNikeName() {
		this.flag = baseService.checkProperty(Users.class, "usersNikename",
				users.getUsersNikename(), users.getUsersId());
		return "check";
	}
	
	public String iosLogin(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if (request == null) {
			return "iosFail";
		}
		//System.out.println(request.getQueryString());
		String usersEmail = request.getParameter("telnum");
		String usersPassword = request.getParameter("password");
		users = usersService.login(usersEmail,usersPassword);
		if (users != null) {
			//String usersId = users.getUsersId().toString();
			result = new ObjectResult("0","success",users);
			return "iosLogin";
		}else{
			result = new ObjectResult("100","false",users);
			return "iosFail";
		}
		
	}
	@SuppressWarnings("unchecked")
	public String login() {
		if(users!=null){
			HttpServletRequest request = ServletActionContext.getRequest();
			users = usersService.login(users.getUsersEmail(), users.getUsersPassword());
			if (users != null) {
				List<Pictures> userPicList = baseService.getObjects(Pictures.class, "where users.usersId =" + users.getUsersId());
				request.getSession().setAttribute("userPicList", userPicList);
				
				List<Pictures> headPicList = baseService.getObjects(
						Pictures.class, "where users.usersId=" + users.getUsersId()+ "and picturesType='头像'");
				if (headPicList.size() != 0) {
					Pictures headPic = headPicList.get(0);
					request.getSession().setAttribute("headPic", headPic);
				} else {
					request.getSession().setAttribute("headPic", null);
				}
				Set<Userinfo> sets = users.getUserinfos();
				for (Userinfo userinfo : sets) {
					request.getSession().setAttribute("userinfos", userinfo);
					break;
				}

				/*
				 * ActionContext.getContext().getSession().put("pictrues",
				 * users.getPictures());
				 * ActionContext.getContext().getSession().put("users", users);
				 */
				request.getSession().setAttribute("user", users);

				return "login";
			}else{
				return "out";
			}
		}else{
			return "out";
		}
	}
	//ios注册
	public String iosSaveRegister(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if (request == null) {
			result = new ObjectResult("100","注册失败",null);
			return "iosFail";
		}
		String email = request.getParameter("telnum");
		String passWord = request.getParameter("password");
		String nikeName = request.getParameter("nickname");
		String checkimg = request.getParameter("code");
		String randimg = (String) ActionContext.getContext().getSession().get("randimg");
		System.out.println(checkimg + " --- " + randimg );
		if(!checkimg.equals(randimg)){
			//验证码错误
			result = new ObjectResult("100","验证码错误",users);
			return "iosFail";
		}
		Users entity = new Users();
		entity.setUsersEmail(email);
		entity.setUsersPassword(passWord);
		entity.setUsersNikename(nikeName);
		entity.setUsersStatus(0);
		entity.setUsersTime(new Timestamp(new Date().getTime()));
		boolean saveUserSuccess = baseService.saveOrUpdateObject(entity);
		Users newUsers=(Users) baseService.getObjects(Users.class, "where usersEmail='"+email+"' and usersPassword='"+passWord+"'").get(0);
		Userinfo newUserinfo=new Userinfo();
		newUserinfo.setUserinfoSex("男"); //默认
		newUserinfo.setUserinfoAddress("北京 东城区");  //默认
		newUserinfo.setUserinfoEmail(newUsers.getUsersEmail());
		newUserinfo.setUsers(newUsers);
		baseService.saveOrUpdateObject(newUserinfo);
		if (saveUserSuccess == false) {
			result = new ObjectResult("100","注册失败",newUsers);
			return "iosFail";
		}else{
			result = new ObjectResult("0","注册成功",newUsers);
			return "iosSaveRegister";
		}
		
		
	}
	
	public String saveregister() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String email = request.getParameter("email");
		String passWord = request.getParameter("pass");
		String nikeName = request.getParameter("name");
		String checkimg = request.getParameter("checkimg");
		String randimg = (String) ActionContext.getContext().getSession().get("randimg");
		if(!checkimg.equals(randimg)){
			return "faile";
		}
		Users entity = new Users();
		entity.setUsersEmail(email);
		entity.setUsersPassword(passWord);
		entity.setUsersNikename(nikeName);
		entity.setUsersStatus(0);
		entity.setUsersTime(new Timestamp(new Date().getTime()));
		this.flag = baseService.saveOrUpdateObject(entity);
		Users newUsers=(Users) baseService.getObjects(Users.class, "where usersEmail='"+email+"' and usersPassword='"+passWord+"'").get(0);
		Userinfo newUserinfo=new Userinfo();
		newUserinfo.setUserinfoSex("男");
		newUserinfo.setUserinfoAddress("北京 东城区");
		newUserinfo.setUserinfoEmail(newUsers.getUsersEmail());
		newUserinfo.setUsers(newUsers);
		/*Date newDate=new Date();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String dateStr=format.format(newDate);
		newUserinfo.setBirthday(dateStr);*/
		baseService.saveOrUpdateObject(newUserinfo);
		
		if (flag == false) {
			return "faile";
		}
		return "out";
	}
	
	public String checkCode() {
		String randimg = (String) ActionContext.getContext().getSession().get("randimg");
		if (!randimg.equals(code) && randimg != code) {
			this.flag = false;
		} else {
			this.flag = true;
		}
		return "check";
	}

	public String checkPass() {
		this.flag = usersService.checkPass(Users.class, "usersPassword",
				users.getUsersPassword(), users.getUsersId());
		return "check";
	}

	public String updatePassword() {
		Users entity = (Users) baseService.getObjectById(Users.class,
				users.getUsersId());
		entity.setUsersPassword(users.getUsersPassword());
		this.flag = baseService.saveOrUpdateObject(entity);
		return "check";
	}

	public String checkEmails() {
		this.flag = usersService.checkPass(Users.class, "email",
				users.getUsersEmail(), users.getUsersId());
		return "check";
	}

	public String updateEmail() {
		Users entity = (Users) baseService.getObjectById(Users.class,
				users.getUsersId());
		entity.setUsersEmail(users.getUsersEmail());
		this.flag = baseService.saveOrUpdateObject(entity);
		return "check";
	}

	
	@SuppressWarnings("unchecked")
	public String searchUsers() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Users loginUsers = (Users) request.getSession().getAttribute("user");
		if (loginUsers != null) {
			Integer loginUId = loginUsers.getUsersId();
			List<ShowUsersInfo> showUsersInfos = new ArrayList<ShowUsersInfo>();
			List<Users> listUsers = baseService.getObjects(Users.class,
					"where usersNikename like '%" + searchValue + "%'");
			if (listUsers.size() != 0) {
				for (Users liuser : listUsers) {
					Set<Userinfo> setUserinfos = liuser.getUserinfos();
					List<Pictures> listPictures = baseService.getObjects(
							Pictures.class, "where users.usersId=" + liuser.getUsersId()
									+ "and picturesType='头像'");
					Set<Messages> setMessages = liuser.getMessageses();
					//Set<Relation> setFance = liuser.getByRelations();
					//Set<Relation> setAttention = liuser.gettRelations();
					List<Relation> listF = baseService.getObjects(Relation.class, "where usersByUsersId.usersId=" + liuser.getUsersId()+ " and usersByUsersByid.usersId=" + loginUId);
					List<Relation> listAtt = baseService.getObjects(Relation.class, "where usersByUsersId.usersId=" + loginUId+ " and usersByUsersByid.usersId=" + liuser.getUsersId());
					List<Relation> listFans= baseService.getObjects(Relation.class, "where usersByUsersId.usersId=" + liuser.getUsersId());
					List<Relation> listAttention = baseService.getObjects(Relation.class, "where usersByUsersByid.usersId=" + liuser.getUsersId());
					ShowUsersInfo showUsersInfo = new ShowUsersInfo();

					if (listFans.size() != 0) {
						for(Relation liFans:listFans){
							if(liFans.getUsersByUsersId().getUsersId()==loginUId){
								showUsersInfo.setsUsersRelationMark("粉丝");
							}
						}
					}
					if (listAttention.size() != 0) {
						for(Relation liAtt:listAttention){
							if(liAtt.getUsersByUsersByid().getUsersId()==loginUId){
								showUsersInfo.setsUsersRelationMark("已关注");
								showUsersInfo.setsUsersGroupName(liAtt.getRelationGroupname());
								showUsersInfo.setsUsersNote(liAtt.getRelationNote());
							}
						}
						
					}
					if (listF.size() != 0 && listAtt.size() != 0) {
						Relation listA = listAttention.get(0);
						showUsersInfo.setsUsersRelationMark("相互关注");
						showUsersInfo.setsUsersGroupName(listA.getRelationGroupname());
						showUsersInfo.setsUsersNote(listA.getRelationNote());
					}

					if (setUserinfos.size() != 0) {
						for (Userinfo setUserinfo : setUserinfos) {
							showUsersInfo.setsUsersAddress(setUserinfo
									.getUserinfoAddress());
						}
					}
					showUsersInfo.setsUsersFance(listAttention.size());
					showUsersInfo.setsUsersAttention(listFans.size());
					showUsersInfo.setsUsersMessages(setMessages.size());
					showUsersInfo.setsUsersId(liuser.getUsersId());
					showUsersInfo.setsUsersNikeName(liuser.getUsersNikename());
					if (setUserinfos.size() != 0) {
						for (Userinfo sUI : setUserinfos) {
							showUsersInfo.setsUsersIntro(sUI.getUserinfoIntro());
							showUsersInfo.setsUsersSex(sUI.getUserinfoSex());
						}

					}
					if (listPictures.size() != 0) {
						Pictures showPictures = listPictures.get(0);
						showUsersInfo.setsUsersHeadPicUrl(showPictures.getPicturesUrl());
					}
					showUsersInfos.add(showUsersInfo);

				}
				showUsers = new ShowUsers();
				showUsers.setShowUsersInfo(showUsersInfos);
				request.setAttribute("showUsers", showUsers);
			} else {
				request.setAttribute("showUsers", null);
			}
		}
		request.setAttribute("searchFlag", searchKey);
		return "searchUsers";
	}

	//ios搜索用户
	public String iosSearchUsers() {
		HttpServletRequest request = ServletActionContext.getRequest();
		if (request == null) {
			result = new ObjectResult("100", "false", null);
			return "iosFail";
		}
		String userId = request.getParameter("userId");
		Integer loginUId = Integer.parseInt(userId);
		String nickName = request.getParameter("nickName").trim();
		List<ShowUsersInfo> showUsersInfos = new ArrayList<ShowUsersInfo>();
		List<Users> listUsers = baseService.getObjects(Users.class,
				"where usersNikename like '%" + nickName + "%'");
		if (listUsers.size() != 0) {
			for (Users liuser : listUsers) {
				Set<Userinfo> setUserinfos = liuser.getUserinfos();
				List<Pictures> listPictures = baseService.getObjects(
						Pictures.class, "where users.usersId=" + liuser.getUsersId()
								+ "and picturesType='头像'");
				//暂时不需要搜索用户的微博信息
				//Set<Messages> setMessages = liuser.getMessageses();
				
				//Set<Relation> setFance = liuser.getByRelations();
				//Set<Relation> setAttention = liuser.gettRelations();
				List<Relation> listF = baseService.getObjects(Relation.class, "where usersByUsersId.usersId=" + liuser.getUsersId()+ " and usersByUsersByid.usersId=" + loginUId);
				List<Relation> listAtt = baseService.getObjects(Relation.class, "where usersByUsersId.usersId=" + loginUId+ " and usersByUsersByid.usersId=" + liuser.getUsersId());
				List<Relation> listFans= baseService.getObjects(Relation.class, "where usersByUsersId.usersId=" + liuser.getUsersId());
				List<Relation> listAttention = baseService.getObjects(Relation.class, "where usersByUsersByid.usersId=" + liuser.getUsersId());
				ShowUsersInfo showUsersInfo = new ShowUsersInfo();

				if (listFans.size() != 0) {
					for(Relation liFans:listFans){
						if(liFans.getUsersByUsersId().getUsersId()==loginUId){
							showUsersInfo.setsUsersRelationMark("粉丝");
						}
					}
				}
				if (listAttention.size() != 0) {
					for(Relation liAtt:listAttention){
						if(liAtt.getUsersByUsersByid().getUsersId()==loginUId){
							showUsersInfo.setsUsersRelationMark("已关注");
							showUsersInfo.setsUsersGroupName(liAtt.getRelationGroupname());
							showUsersInfo.setsUsersNote(liAtt.getRelationNote());
						}
					}
					
				}
				if (listF.size() != 0 && listAtt.size() != 0) {
					Relation listA = listAttention.get(0);
					showUsersInfo.setsUsersRelationMark("相互关注");
					showUsersInfo.setsUsersGroupName(listA.getRelationGroupname());
					showUsersInfo.setsUsersNote(listA.getRelationNote());
				}

				if (setUserinfos.size() != 0) {
					for (Userinfo setUserinfo : setUserinfos) {
						showUsersInfo.setsUsersAddress(setUserinfo
								.getUserinfoAddress());
					}
				}
				showUsersInfo.setsUsersFance(listAttention.size());
				showUsersInfo.setsUsersAttention(listFans.size());
				//暂时不用显示搜索到的用户微博
				//showUsersInfo.setsUsersMessages(setMessages.size());
				showUsersInfo.setsUsersId(liuser.getUsersId());
				showUsersInfo.setsUsersNikeName(liuser.getUsersNikename());
				if (setUserinfos.size() != 0) {
					for (Userinfo sUI : setUserinfos) {
						showUsersInfo.setsUsersIntro(sUI.getUserinfoIntro());
						showUsersInfo.setsUsersSex(sUI.getUserinfoSex());
					}

				}
				if (listPictures.size() != 0) {
					Pictures showPictures = listPictures.get(0);
					showUsersInfo.setsUsersHeadPicUrl(showPictures.getPicturesUrl());
				}
				showUsersInfos.add(showUsersInfo);

			}
			showUsers = new ShowUsers();
			showUsers.setShowUsersInfo(showUsersInfos);
			result = new ObjectResult("0", "success", showUsers);
			//request.setAttribute("showUsers", showUsers);
		} else {
			//request.setAttribute("showUsers", null);
			result = new ObjectResult("0", "success", showUsers);
		}
		//request.setAttribute("searchFlag", searchKey);
		return "iosSearchUsers";
	}
	
	//查找分组
	@SuppressWarnings("unchecked")
	public String searchAttention() {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("searchFlag", searchKey);
		System.out.println(searchKey + "---------------------------------");
		Users loginUsers = (Users) request.getSession().getAttribute("user");
		List<ShowUsersInfo> showUsersInfos = new ArrayList<ShowUsersInfo>();
		if (loginUsers != null) {
			Integer loginUId = loginUsers.getUsersId();
			if ("all".equals(searchKey)) {
				List<Relation> logAttention = baseService.getObjects(
						Relation.class, "where usersByUsersId.usersId=" + loginUId);
				searchAttentionFor(showUsersInfos, logAttention, loginUId);
			}
			if (("special".equals(searchKey)) || ("star".equals(searchKey))
					|| ("friend".equals(searchKey))
					|| ("schoolmate".equals(searchKey))
					|| ("colleague".equals(searchKey))
					|| ("family".equals(searchKey))
					|| ("secret".equals(searchKey))) {
				String searchStr = null;
				if("special".equals(searchKey)){
					searchStr="特别关注";
				}else if("star".equals(searchKey)){
					searchStr="明星名人";
				}else if("friend".equals(searchKey)){
					searchStr="朋友";
				}else if("schoolmate".equals(searchKey)){
					searchStr="同学";
				}else if("colleague".equals(searchKey)){
					searchStr="同事";
				}else if("family".equals(searchKey)){
					searchStr="家人";
				}else if("secret".equals(searchKey)){
					searchStr="悄悄关注";
				}
				List<Relation> logAttention = baseService.getObjects(
						Relation.class, "where usersByUsersId.usersId=" + loginUId
								+ " and relationGroupname='" + searchStr + "'");
				searchAttentionFor(showUsersInfos, logAttention, loginUId);
			}
			if ("fans".equals(searchKey)) {
				List<Relation> logAttention = baseService.getObjects(Relation.class, "where usersByUsersByid.usersId=" + loginUId);
				for (Relation logRelation : logAttention) {
					ShowUsersInfo showUsersInfo = new ShowUsersInfo();
					showUsersInfo.setsUsersId(logRelation.getUsersByUsersId().getUsersId());
					showUsersInfo.setsUsersNikeName(logRelation.getUsersByUsersId().getUsersNikename());
					List<Userinfo> listUserinfos = baseService.getObjects(Userinfo.class, "where users.usersId="+ logRelation.getUsersByUsersId().getUsersId());
					List<Pictures> listPictures = baseService.getObjects(Pictures.class, "where users.usersId="+ logRelation.getUsersByUsersId().getUsersId()+ " and picturesType='头像'");

					List<Relation> logTogether = baseService.getObjects(Relation.class, "where usersByUsersId.usersId=" + loginUId+" and usersByUsersByid.usersId="+logRelation.getUsersByUsersId().getUsersId());
					Set<Relation> settFans = logRelation.getUsersByUsersId().getRelationsForUsersByid();
					//Set<Relation> setAttention = logRelation.getUsersByUsersByid().getRelationsForUsersId();
					Set<Relation> setAttention = logRelation.getUsersByUsersId().getRelationsForUsersId();
					System.out.println(settFans.size()+"--"+setAttention.size()+"--------------------");
					Set<Messages> setMessages = logRelation.getUsersByUsersId().getMessageses();
					if (listUserinfos.size() != 0) {
						showUsersInfo.setsUsersSex(listUserinfos.get(0).getUserinfoSex());
						showUsersInfo.setsUsersIntro(listUserinfos.get(0).getUserinfoIntro());
						showUsersInfo.setsUsersAddress(listUserinfos.get(0).getUserinfoAddress());
					}
					if (listPictures.size() != 0) {
						showUsersInfo.setsUsersHeadPicUrl(listPictures.get(0).getPicturesUrl());
					}
						if(logTogether.size()!=0){
							showUsersInfo.setsUsersRelationMark("相互关注");
						}else{
							showUsersInfo.setsUsersRelationMark("粉丝");
						}
					
					showUsersInfo.setsUsersFance(settFans.size());
					showUsersInfo.setsUsersAttention(setAttention.size());
					showUsersInfo.setsUsersMessages(setMessages.size());
					showUsersInfos.add(showUsersInfo);
				}
			}

			showUsers = new ShowUsers();
			showUsers.setShowUsersInfo(showUsersInfos);
			request.setAttribute("showUsers", showUsers);
		}

		return "searchAttention";
	}

	@SuppressWarnings("unchecked")
	public void searchAttentionFor(List<ShowUsersInfo> showUsersInfos,
			List<Relation> logAttention, Integer loginUId) {
		for (Relation logRelation : logAttention) {
			ShowUsersInfo showUsersInfo = new ShowUsersInfo();
			showUsersInfo.setsUsersId(logRelation.getUsersByUsersByid().getUsersId());
			showUsersInfo.setsUsersNikeName(logRelation.getUsersByUsersByid().getUsersNikename());
			showUsersInfo.setsUsersNote(logRelation.getRelationNote());
			List<Userinfo> listUserinfos = baseService.getObjects(
					Userinfo.class, "where users.usersId="
							+ logRelation.getUsersByUsersByid().getUsersId());
			List<Pictures> listPictures = baseService.getObjects(
					Pictures.class, "where users.usersId="
							+ logRelation.getUsersByUsersByid().getUsersId()
							+ " and picturesType='头像'");
			List<Relation> listRelations = baseService.getObjects(
					Relation.class, "where usersByUsersId.usersId="
							+ logRelation.getUsersByUsersByid().getUsersId()
							+ " and usersByUsersByid.usersId=" + loginUId);
			if (listUserinfos.size() != 0) {
				showUsersInfo.setsUsersSex(listUserinfos.get(0).getUserinfoSex());
				showUsersInfo.setsUsersIntro(listUserinfos.get(0).getUserinfoIntro());
				showUsersInfo.setsUsersAddress(listUserinfos.get(0).getUserinfoAddress());
			}
			if (listPictures.size() != 0) {
				showUsersInfo.setsUsersHeadPicUrl(listPictures.get(0).getPicturesUrl());
			}
			showUsersInfo.setsUsersGroupName(logRelation.getRelationGroupname());
			if (listRelations.size() != 0) {
				showUsersInfo.setsUsersRelationMark("相互关注");
			} else {
				showUsersInfo.setsUsersRelationMark("已关注");
			}
			showUsersInfos.add(showUsersInfo);
		}
	}
	
	public String addRelation(){
		HttpServletRequest request = ServletActionContext.getRequest();
		Users loginUsers = (Users) request.getSession().getAttribute("user");
		
		if (loginUsers != null) {
			Relation newRelation=new Relation();
			newRelation.setUsersByUsersId(loginUsers);
			Users byusers=new Users();
			
			//byusers.setUsersId(Integer.valueOf(byUsersId));
			byusers.setUsersId(Integer.valueOf(byUsersId));
			newRelation.setUsersByUsersByid(byusers);
			if(groupName!=null){
				newRelation.setRelationGroupname(groupName);
			}else{
				newRelation.setRelationGroupname("未分组");
			}
			newRelation.setRelationNote(relationNote);
			newRelation.setRelationTime(new Timestamp(new Date().getTime()));
			baseService.saveOrUpdateObject(newRelation);
		}
		return "addRelation";
	}
	
	@SuppressWarnings("unchecked")
	public String cancelRelation(){
		HttpServletRequest request = ServletActionContext.getRequest();
		Users loginUsers = (Users) request.getSession().getAttribute("user");
		if (loginUsers != null) {
			List<Relation> delRelations=baseService.getObjects(Relation.class, "where usersByUsersId.usersId=" + loginUsers.getUsersId()+ " and usersByUsersByid.usersId=" + byUsersId);
			if(delRelations.size()!=0){
				baseService.deleteObject(delRelations.get(0));
			}
		}
		
		return "cancelRelation";
	}
	
	@SuppressWarnings("unchecked")
	public String updateNote(){
		//relationNote
		HttpServletRequest request = ServletActionContext.getRequest();
		Users loginUsers = (Users) request.getSession().getAttribute("user");
		if (loginUsers != null) {
			List<Relation> updateRelations=baseService.getObjects(Relation.class, "where usersByUsersId.usersId=" + loginUsers.getUsersId()+ " and usersByUsersByid.usersId=" + byUsersId);
			if(updateRelations.size()!=0){
				Relation updateRelation=updateRelations.get(0);
				updateRelation.setRelationNote(relationNote);
				baseService.saveOrUpdateObject(updateRelation);
			}
		}
		return "updateNote";
	}
	
	@SuppressWarnings("unchecked")
	public String removeFans(){
		HttpServletRequest request = ServletActionContext.getRequest();
		Users loginUsers = (Users) request.getSession().getAttribute("user");
		if (loginUsers != null) {
			List<Relation> delRelations=baseService.getObjects(Relation.class, "where usersByUsersId.usersId=" + byUsersId+ " and usersByUsersByid.usersId=" + loginUsers.getUsersId());
			if(delRelations.size()!=0){
				Relation delRelation=delRelations.get(0);
				baseService.deleteObject(delRelation);
			}
		}
		
		
		return "removeFans";
	}
	
	public String logout(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.removeAttribute("user");
		HttpSession session1 = request.getSession();
		session1.invalidate();
		return "logout";
	}
}
