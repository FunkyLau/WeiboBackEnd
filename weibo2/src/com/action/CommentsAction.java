package com.action;

import java.util.List;

import com.domain.Comments;
import com.domain.Messages;
import com.domain.Users;
import com.service.CommentsService;
import com.utils.ComboBoxBean;
import com.utils.Pagination;

public class CommentsAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CommentsService commentsService;
	private Comments comments;
	public CommentsService getCommentsService() {
		return commentsService;
	}
	public void setCommentsService(CommentsService commentsService) {
		this.commentsService = commentsService;
	}
	public void setComments(Comments comments) {
		this.comments = comments;
	}
	
	public String query(){
		//构造分页工具
		pagination = new Pagination(this.page,this.rows);
		String sql = spliceSql();
		pagination.setTotal(baseService.getCount(Comments.class, sql));
		pagination.setRows(baseService.getObjects(Comments.class, sql, pagination.getFrom(), pagination.getSize(), this.order, this.sort));
		return "query";
	}
	public String spliceSql(){
		String whereSql = "as tt where 1=1";
		if (comments!=null) {
			//内容
			String info = comments.getCommentsInfo();
			if (!"".equals(info)&&info!=null) {
				whereSql += " and tt.commentsInfo like '%"+info+"%'";
			}
			//微博内容
			if (comments.getMessages()!=null) {
				String minfo = comments.getMessages().getMessagesInfo();
				whereSql += " and tt.messages.messagesInfo like '%"+minfo+"%'"; 
			}
			//用户邮箱
			if (comments.getUsers()!=null) {
				String email = comments.getUsers().getUsersEmail();
				whereSql += " and tt.users.usersEmail like '%"+email+"%'";
			}
			
		}
		return whereSql;
	}
	
	public String getAllUsers(){
		List<Users> lists = this.baseService.getAllObjects(Users.class);
		for (Users user : lists) {
			this.list.add(new ComboBoxBean(user.getUsersId(),user.getUsersEmail(),false));
		}
		return "queryall";
	}
	
	public String getAllMessages(){
		List<Messages> lists = this.baseService.getAllObjects(Messages.class);
		for (Messages messages : lists) {
			this.list.add(new ComboBoxBean(messages.getMessagesId(),messages.getMessagesInfo(),false));
		}
		return "queryall";
	}
	public String saveOrUpdateObject(){
		System.out.println(comments.getMessages()+"......"+comments.getUsers());
		this.flag = baseService.saveOrUpdateObject(comments);
		return "saveorupdate";
	}
	public String deleteObject(){
		this.flag = baseService.deleteObjects(Comments.class, ids);
		return "delete";
	}
}
