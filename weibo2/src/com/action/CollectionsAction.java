package com.action;

import java.util.List;

import com.domain.Collections;
import com.domain.Messages;
import com.domain.Users;
import com.service.CollectionsService;
import com.utils.ComboBoxBean;
import com.utils.Pagination;

public class CollectionsAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CollectionsService collectionsService;
	private Collections collections;
	public Collections getCollections() {
		return collections;
	}
	public void setCollections(Collections collections) {
		this.collections = collections;
	}
	public void setCollectionsService(CollectionsService collectionsService) {
		this.collectionsService = collectionsService;
	}
	
	public String query(){
		//返回sql语句
		pagination = new Pagination(this.page,this.rows);
		String sql = spliceSql();
		pagination.setTotal(baseService.getCount(collections.getClass(), sql));
		pagination.setRows(baseService.getObjects(collections.getClass(), sql, pagination.getFrom(), pagination.getSize(), this.order, this.sort));
		return "query";
	} 
	
	public String spliceSql(){
		String whereSql = " as tt where 1=1 ";
		if (collections!=null) {
			Integer status = collections.getCollectionsStatus();
			System.out.println("=========="+status);
			if (status!=null) {
				whereSql += "and tt.collectionsStatus = "+ status + " ";
				System.out.println(whereSql);
			}
			Users users = collections.getUsers();
			if (users!=null) {
				String email = users.getUsersEmail();
				if (!"".equals(email)&&(email!=null)) {
					whereSql += " and tt.users.usersEmail like '%" + email + "%'";
				}
			}
			Messages messages = collections.getMessages();
			if (messages!=null) {
				String info = messages.getMessagesInfo();
				if (!"".equals(info)&&(info!=null)) {
					whereSql += " and tt.messages.messagesInfo like'%" + info + "%'";
				}
			}
		}
		return whereSql;
	}
	
	public String saveOrUpdateObject(){
		this.flag = baseService.saveOrUpdateObject(collections);
		return "saveorupdate";
	}
	public String deleteObject(){
		this.flag = baseService.deleteObjects(collections.getClass(), ids);
		return "delete";
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
		for (Messages messages : lists) {
			this.list.add(new ComboBoxBean(messages.getMessagesId(),messages.getMessagesInfo(),false));
		}
		return "queryall";
	}
}
