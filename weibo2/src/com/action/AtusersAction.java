package com.action;

import java.util.List;

import com.domain.Atusers;
import com.domain.Messages;
import com.domain.Users;
import com.service.AtusersService;
import com.utils.ComboBoxBean;
import com.utils.Pagination;

public class AtusersAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AtusersService atusersService;
	private Atusers atusers;
	public Atusers getAtusers() {
		return atusers;
	}
	public void setAtusers(Atusers atusers) {
		this.atusers = atusers;
	}
	public void setAtusersService(AtusersService atusersService) {
		this.atusersService = atusersService;
	}
	
	public String query(){
		pagination = new Pagination(this.page,this.rows);
		String sql = spliceSql();
		pagination.setTotal(baseService.getCount(Atusers.class, sql));
		pagination.setRows(baseService.getObjects(Atusers.class, sql,pagination.getFrom(), pagination.getSize(), this.order, this.sort));
		return "query";
	}
	public String spliceSql(){
		String whereSql = "as tt where 1=1";
		if (atusers != null) {
			//微博内容
			if (atusers.getMessages() != null) {
				String minfo = atusers.getMessages().getMessagesInfo();
				whereSql += "and tt.messages.messagesInfo like '%" + minfo + "%'";
			}
			//用户邮箱
			if(atusers.getUsers()!=null){
				String email = atusers.getUsers().getUsersEmail();
				whereSql += " and tt.users.usersEmail like '%" + email +"%'";
			}
		}
		return whereSql;
	}
	
	public String getAllUsers(){
		List<Users> lists = this.baseService.getAllObjects(Users.class);
		for(Users user : lists){
			this.list.add(new ComboBoxBean(user.getUsersId(),user.getUsersEmail(),false));
		}
		return "queryall";
	}
	
	public String getAllMessages(){
		List<Messages> lists = this.baseService.getAllObjects(Messages.class);
		for(Messages message : lists){
			this.list.add(new ComboBoxBean(message.getMessagesId(),message.getMessagesInfo(),false));
		}
		return "queryall";
	}
	public String saveOrUpdateObject(){
		this.flag = baseService.saveOrUpdateObject(atusers);
		return "saveorupadte";
	}
	public String deleteObject(){
		this.flag = baseService.deleteObjects(Atusers.class,ids);
		return "delete";
	}
}
