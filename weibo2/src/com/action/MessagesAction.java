package com.action;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.domain.Atusers;
import com.domain.Collections;
import com.domain.Comments;
import com.domain.Messages;
import com.domain.ObjectResult;
import com.domain.Pictures;
import com.domain.Relation;
import com.domain.Users;
import com.opensymphony.xwork2.ActionContext;
import com.service.MessagesService;
import com.utils.ComboBoxBean;
import com.utils.Pagination;
import com.utils.ShowComments;
import com.utils.ShowMessages;

public class MessagesAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Messages messages;
	private MessagesService messagesService;
	private ShowMessages showMessages;
	private Integer messagesNum;
	private String lastMessages;
	private ShowComments showComments;
	private Comments comments;
	private List messageses;
	
	public void setMessageses(List messageses){
		this.messageses = messageses;
	}
	
	public List getMessageses(){
		
		return messageses;
	}
	
	public ShowComments getShowComments() {
		return showComments;
	}
	public void setComments(Comments comments) {
		this.comments = comments;
	}

	public Comments getComments(){
		return comments;
	}
	public void setShowComments(ShowComments showComments) {
		this.showComments = showComments;
	}

	public void setLastMessages(String lastMessages) {
		this.lastMessages = lastMessages;
	}
	
	public String getLastMessages(){
		return lastMessages;
	}
	
	public void setMessagesNum(Integer messagesNum){
		this.messagesNum = messagesNum;
	}
	
	public Integer getMessagesNum() {
		return messagesNum;
	}

	public ShowMessages getShowMessages() {
		return showMessages;
	}

	public void setShowMessages(ShowMessages showMessages) {
		this.showMessages = showMessages;
	}

	public void setMessagesService(MessagesService messagesService) {
		this.messagesService = messagesService;
	}

	public Messages getMessages() {
		return messages;
	}

	public void setMessages(Messages messages) {
		this.messages = messages;
	}
	
	public String query(){
		System.out.println(this.page + "------------------" + this.rows);
		pagination = new Pagination(this.page, this.rows);
		String whereSql = spliceSql();
		pagination.setTotal(baseService.getCount(Messages.class, whereSql));
		pagination.setRows(baseService.getObjects(Messages.class, whereSql,
				pagination.getFrom(), pagination.getSize(), this.order,
				this.sort));

		return "query";
	}
	private String spliceSql() {

		String whereSql = " as tt where 1=1 ";

		if (messages != null) {
			// 内容
			String info = messages.getMessagesInfo();
			if (!"".equals(info) && (info != null)) {
				whereSql += " and  tt.messagesInfo like '%" + info + "%'";
			}

			// 类型
			String type = messages.getMessagesType();
			if (!"".equals(type) && (type != null)) {
				whereSql += " and  tt.messagesType = '" + type + "'";
			}

			// 标签
			String label = messages.getMessagesLabel();
			if (!"".equals(label) && (label != null)) {
				whereSql += " and  tt.messagesLabel like '%" + label + "%'";
			}

			Users users = messages.getUsers();
			if (users != null) {
				// 邮箱
				String email = users.getUsersEmail();
				if (!"".equals(email) && (email != null)) {
					whereSql += " and  tt.users.usersEmail like '%" + email + "%'";
				}
			}
		}
		return whereSql;
	}
	
	public String getAllUsers() {
		List<Users> lists = this.baseService.getAllObjects(Users.class);
		for (Users user : lists) {
			this.list.add(new ComboBoxBean(user.getUsersId(), user.getUsersEmail(), false));
		}
		return "queryall";
	}
	
	public String saveMessages(){
		HttpServletRequest request = ServletActionContext.getRequest();
//		String params = request.getQueryString();
//		System.out.println(params);
		String usersId = request.getParameter("usersId");
//		System.out.println(usersId);
		String messagesInfo = request.getParameter("messagesInfo");
//		System.out.println(messagesInfo);
		Users user = (Users) baseService.getObjectById(Users.class,Integer.parseInt(usersId));
		if (messages.getMessagesId() == null) {
			messages.setMessagesAgreenum(0);
			messages.setMessagesCollectnum(0);
			messages.setMessagesCommentnum(0);
			messages.setMessagesReadnum(0);
			messages.setMessagesTranspondnum(0);
			if (messages.getMessagesTime() == null) {
				messages.setMessagesTime(new Timestamp(new Date().getTime()));
			}
			if (messages.getUsers() == null) {
				//messages.setUsers((Users) ActionContext.getContext().getSession().get("user"));
				messages.setUsers(user);
				messages.setMessagesInfo(messagesInfo);
			}
		}

		if (messages.getUsers() != null && messages.getMessagesInfo() != null) {
			this.flag = baseService.saveOrUpdateObject(messages);
		}
		return "saveMessages";
	}
	
	public String iosSaveMessages(){
		HttpServletRequest request = ServletActionContext.getRequest();
//		String params = request.getQueryString();
//		System.out.println(params);
		String usersId = request.getParameter("usersId");
		System.out.println(usersId);
		String messagesInfo = request.getParameter("messagesInfo");
		System.out.println(messagesInfo);
		Users user = (Users) baseService.getObjectById(Users.class,Integer.parseInt(usersId));
		//if (messages.getMessagesId() == null) {
		if (messages == null) {
			messages = new Messages();
			messages.setMessagesAgreenum(0);
			messages.setMessagesCollectnum(0);
			messages.setMessagesCommentnum(0);
			messages.setMessagesReadnum(0);
			messages.setMessagesTranspondnum(0);
			//messages.setMessagesLabel("原创");
			if (messages.getMessagesTime() == null) {
				messages.setMessagesTime(new Timestamp(new Date().getTime()));
			}
			if (messages.getUsers() == null) {
				//messages.setUsers((Users) ActionContext.getContext().getSession().get("user"));
				messages.setUsers(user);
				messages.setMessagesInfo(messagesInfo);
			}
		}

		if (messages.getUsers() != null && messages.getMessagesInfo() != null) {
			this.flag = baseService.saveOrUpdateObject(messages);
		}
		if (this.flag){
			result = new ObjectResult("0","success",messages);
			return "iosSaveMessages";
		}else{
			result = new ObjectResult("100","false",messages);
			return "iosFail";
		}
		
	}
	public String saveOrUpdateObject() {
		if (messages.getMessagesId() == null) {
			messages.setMessagesAgreenum(0);
			messages.setMessagesCollectnum(0);
			messages.setMessagesCommentnum(0);
			messages.setMessagesReadnum(0);
			messages.setMessagesTranspondnum(0);
			if (messages.getMessagesTime() == null) {
				messages.setMessagesTime(new Timestamp(new Date().getTime()));
			}
			if (messages.getUsers() == null) {
				messages.setUsers((Users) ActionContext.getContext().getSession().get("user"));
			}
		}

		if (messages.getUsers() != null) {
			this.flag = baseService.saveOrUpdateObject(messages);
		}

		return "saveorupdate";
	}
	
	public String updateAgreeNum() {
		Users user = (Users) ActionContext.getContext().getSession().get("user");
		Collections collections = null;
		messages = (Messages) baseService.getObjectById(Messages.class,
				messages.getMessagesId());
		if (user != null && messages != null) {
			List agreelist = baseService.getObjects(Collections.class,
					" where messages.messagesId =" + messages.getMessagesId() + " and users.usersId=" + user.getUsersId());
			if (agreelist.size() > 0) {
				collections = (Collections) agreelist.get(0);
			}
			if (collections == null) {
				messages.setMessagesAgreenum(messages.getMessagesAgreenum() + 1);
				collections = new Collections();
				collections.setCollectionsStatus(2);
				collections.setMessages(messages);
				collections.setUsers(user);
				this.flag = baseService.saveOrUpdateObject(collections);
			} else {
				this.flag = baseService.deleteObjects(Collections.class,
						String.valueOf(collections.getCollectionsId()));
				messages.setMessagesAgreenum(messages.getMessagesAgreenum() - 1);
				this.flag = baseService.saveOrUpdateObject(messages);
			}
		}
		return "saveorupdate";
	}
	public String updateComments() {
		messages = (Messages) baseService.getObjectById(Messages.class, messages.getMessagesId());
		Users user = (Users) ActionContext.getContext().getSession().get("user");
		if(messages!=null&&comments!=null&&user!=null){
			comments.setMessages(messages);
			comments.setUsers(user);
			//comments.setCommentsInfo();
			comments.setCommentsInfostatus(1);
			comments.setCommentsTime(new Timestamp(new Date().getTime()));
			messages.setMessagesCommentnum(messages.getMessagesCommentnum()+1);
			this.flag = baseService.saveOrUpdateObject(comments);
		}
		
		return "saveorupdate";
	}
	public String deleteObject() {
		List piclist = baseService.getObjects(Pictures.class,
				" where messages in (" + ids + ")");
		List atulist = baseService.getObjects(Atusers.class,
				" where messages in (" + ids + ")");
		List collist = baseService.getObjects(Collections.class,
				" where messages in (" + ids + ")");
		List comlist = baseService.getObjects(Comments.class,
				" where messages in (" + ids + ")");
		String del_ids = "";
		if (comlist.size() > 0) {
			del_ids = "";
			for (Comments com : (List<Comments>) comlist) {
				del_ids += com.getCommentsId() + ",";
			}
			del_ids = del_ids.substring(0, del_ids.length() - 1);
			baseService.deleteObjects(Comments.class, del_ids);
		}
		if (piclist.size() > 0) {
			del_ids = "";
			for (Pictures p : (List<Pictures>) piclist) {
				del_ids += p.getPicturesId() + ",";
			}
			del_ids = del_ids.substring(0, del_ids.length() - 1);
			baseService.deleteObjects(Pictures.class, del_ids);
		}
		if (atulist.size() > 0) {
			del_ids = "";
			for (Atusers a : (List<Atusers>) atulist) {
				del_ids += a.getAtusersId() + ",";
			}
			del_ids = del_ids.substring(0, del_ids.length() - 1);
			baseService.deleteObjects(Atusers.class, del_ids);
		}
		if (collist.size() > 0) {
			del_ids = "";
			for (Collections col : (List<Collections>) collist) {
				del_ids += col.getCollectionsId() + ",";
			}
			del_ids = del_ids.substring(0, del_ids.length() - 1);
			baseService.deleteObjects(Collections.class, del_ids);
		}
		this.flag = baseService.deleteObjects(Messages.class, ids);
		return "delete";
	}
	
	public String iosQueryPictures(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if(request != null){
			String usersId = request.getParameter("usersId");
			//System.out.println(usersId);
			//Users user = (Users) baseService.getObjectById(Users.class, usersId);
			
			//List relationlist = baseService.getObjects(Relation.class," where usersByUsersId.usersId =" + user.getUsersId());
			List relationlist = baseService.getObjects(Relation.class," where usersByUsersId.usersId =" + usersId);
			
			
			String byusers = "";
			for (Relation relation : (List<Relation>) relationlist) {
				byusers += relation.getUsersByUsersByid().getUsersId() + ",";
			}
			byusers = "(" + byusers + usersId + ")";
			messageses = baseService.getObjects(Messages.class,(" where users in " + byusers +" order by messagesTime desc limit 0"));
		}
		return null;
	}
	public String iosQueryMessages(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if(request != null){
			//System.out.println(request.getQueryString());
			String usersId = request.getParameter("usersId");
			Integer fromPosition = Integer.parseInt(request.getParameter("from"));
			//System.out.println(usersId);
			//Users user = (Users) baseService.getObjectById(Users.class, usersId);
			//List relationlist = baseService.getObjects(Relation.class," where usersByUsersId.usersId =" + user.getUsersId());
			List relationlist = baseService.getObjects(Relation.class," where usersByUsersId.usersId =" + usersId);
			String byusers = "";
			for (Relation relation : (List<Relation>) relationlist) {
				byusers += relation.getUsersByUsersByid().getUsersId() + ",";
			}
			byusers = "(" + byusers + usersId + ")";
			//System.out.println(byusers);
			//byusers = "(" + byusers + user.getUsersId() + ")";
			//messageses = baseService.getObjects(Messages.class,(" where users in " + byusers +" order by messagesTime desc limit 0"));
			//System.out.println(nowshow.size());
			//showMessages.setMessages(nowshow);
			List nowshow = baseService.getObjects(Messages.class,(" where users in " + byusers), fromPosition,20, "desc", "messagesTime");
			if (showMessages == null) {
				showMessages = new ShowMessages();
			}
			showMessages.setFrom(fromPosition);
			showMessages.setMessages(nowshow);
			showMessages.setHeadphotos(baseService.getObjects(Pictures.class," where users in " + byusers + " and picturesType='头像'"));
			String nowshowMessages = "";
			for (Messages m : (List<Messages>) nowshow) {
				nowshowMessages += m.getMessagesId() + ",";
				
			}
			if (nowshowMessages.isEmpty()) {
				nowshowMessages = "("+ nowshowMessages.substring(0,nowshowMessages.length() - 1) + ")";
				showMessages.setAgreeMessages(baseService.getObjects(Collections.class, " where messages in "+ nowshowMessages
								+ " and collectionsStatus = 2 and users in (" + usersId + ")"));
			}
			//user.getUsersId()
			showMessages.setAttentionsNum(baseService.getCount(Relation.class," where usersByUsersId =" + usersId));
			showMessages.setFansNum(baseService.getCount(Relation.class,
					" where usersByUsersByid =" + usersId));
			showMessages.setMyMessagesNum(baseService.getCount(Messages.class,
					" where users =" + usersId));
			List lms = baseService.getObjects(Messages.class,(" where users in " + byusers), 0, 1, "desc", "messagesTime");
			if (lms.size() > 0) {
				Messages lm = (Messages) lms.get(0);
				showMessages.setLastMessages(lm.getMessagesTime());
			}
			
		}
		if (showMessages != null){
			result = new ObjectResult("0","success",showMessages);
			return "iosQueryMessages";
		}else{
			result = new ObjectResult("100","false",showMessages);
			return "iosFail";
		}
	}
	public String queryMessages() {
		Users user = (Users) ActionContext.getContext().getSession().get("user");
		
		if (user != null) {
			
			List relationlist = baseService.getObjects(Relation.class," where usersByUsersId.usersId =" + user.getUsersId());
			//List relationlist = baseService.getObjects(Relation.class," where usersByUsersId =" + user.getUsersId());
			String byusers = "";
			for (Relation relation : (List<Relation>) relationlist) {
				byusers += relation.getUsersByUsersByid().getUsersId() + ",";
			}
			byusers = "(" + byusers + user.getUsersId() + ")";
			//System.out.println(byusers);
			//获取成功
			showMessages.setTotal(baseService.getCount(Messages.class,(" where users in " + byusers)));
			//System.out.println("total finish setting!");
			//System.out.println(""+showMessages.getSize());
			System.out.println(""+showMessages.getFrom());
			List nowshow = baseService.getObjects(Messages.class,(" where users in " + byusers), showMessages.getFrom(),showMessages.getSize(), "desc", "messagesTime");
			System.out.println("nowshow finish setting!");
			showMessages.setMessages(nowshow);
			showMessages.setHeadphotos(baseService.getObjects(Pictures.class," where users in " + byusers + " and picturesType='头像'"));
			//System.out.println("got pictures!");
			//获得头像
			String nowshowMessages = "";
			for (Messages m : (List<Messages>) nowshow) {
				nowshowMessages += m.getMessagesId() + ",";
			}
			//System.out.println(nowshowMessages);
			//获得nowshowMessages = "19,"
			if (nowshowMessages != "") {
				nowshowMessages = "("+ nowshowMessages.substring(0,nowshowMessages.length() - 1) + ")";
				showMessages.setAgreeMessages(baseService.getObjects(Collections.class, " where messages in "+ nowshowMessages
								+ " and collectionsStatus = 2 and users in (" + user.getUsersId() + ")"));
			}
			showMessages.setAttentionsNum(baseService.getCount(Relation.class,
					" where usersByUsersId =" + user.getUsersId()));
			showMessages.setFansNum(baseService.getCount(Relation.class,
					" where usersByUsersByid =" + user.getUsersId()));
			showMessages.setMyMessagesNum(baseService.getCount(Messages.class,
					" where users =" + user.getUsersId()));
			List lms = baseService.getObjects(Messages.class,(" where users in " + byusers), 0, 1, "desc", "messagesTime");
			if (lms.size() > 0) {
				Messages lm = (Messages) lms.get(0);
				showMessages.setLastMessages(lm.getMessagesTime());
			}
		}
		return "queryMessages";
	}
	
	public String queryNewMessages() {
		Users user = (Users) ActionContext.getContext().getSession().get("user");
		if (user != null) {
			List relationlist = baseService.getObjects(Relation.class,
					" where usersByUsersId.usersId=" + user.getUsersId());
			String byusers = "";
			for (Relation relation : (List<Relation>) relationlist) {
				byusers += relation.getUsersByUsersByid().getUsersId() + ",";
			}
			byusers = "(" + byusers + user.getUsersId() + ")";
			if (lastMessages != "") {
				
				Integer last_m = baseService.getCount(Messages.class,
						" where users in " + byusers + " and messagesTime=to_date('"
								+ lastMessages + "','yyyy-mm-dd hh24:mi:ss')");
						System.out.println(last_m.toString());
				messagesNum = baseService.getCount(Messages.class,
						" where users in " + byusers + " and messagesTime>to_date('"
								+ lastMessages + "','yyyy-mm-dd hh24:mi:ss')");
				System.out.println(messagesNum.toString());
				if (last_m == 0) {
					messagesNum = messagesNum - 1;
				}
			} else {
				messagesNum = 0;
			}
		}
		return "queryNewMessages";
	}
	
	public String queryComments() {
		Users user = (Users) ActionContext.getContext().getSession()
				.get("user");
		showComments = new ShowComments();
		if (user != null && messages != null) {
			showComments.setTotal(baseService.getCount(Comments.class,
					(" where messages.messagesId= " + messages.getMessagesId())));
			List commentshow = baseService.getObjects(Comments.class,
					(" where messages.messagesId= " + messages.getMessagesId()),
					showComments.getFrom(), showComments.getSize(), "desc","commentsTime");
			showComments.setComments(commentshow);
			String commentsusers = "";
			if (commentshow.size() > 0) {
				for (Comments comments : (List<Comments>) commentshow) {
					commentsusers += comments.getUsers().getUsersId() + ",";
				}
			}
			if (commentsusers != "") {
				commentsusers = "("
						+ commentsusers
								.substring(0, commentsusers.length() - 1) + ")";
				showComments.setHeadphotos(baseService.getObjects(
						Pictures.class, " where users in " + commentsusers
								+ " and picturesType='头像'"));
			}
		}

		return "queryComments";
	}
	public String deleteComments(){
		comments = (Comments) baseService.getObjectById(Comments.class,comments.getCommentsId());
		if(comments!=null){
			Messages m = comments.getMessages();
			m.setMessagesCommentnum(comments.getMessages().getMessagesCommentnum()-1);
			this.flag = baseService.deleteObjects(Comments.class, "("+comments.getCommentsId()+")");
			baseService.saveOrUpdateObject(m);
		}		
		return "delete";
	}
	public String queryMyselfMessages() {

		return "myselfmessages";
	}
}
