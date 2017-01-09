package com.action;

import java.util.Iterator;
import java.util.List;

import com.domain.Privateletter;
import com.domain.Users;
import com.service.PrivateletterService;
import com.utils.ComboBoxBean;
import com.utils.Pagination;

public class PrivateletterAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PrivateletterService privateletterService;
	private Privateletter privateletter;
	public Privateletter getPrivateletter() {
		return privateletter;
	}
	public void setPrivateletter(Privateletter privateletter) {
		this.privateletter = privateletter;
	}
	public void setPrivateletterService(PrivateletterService privateletterService) {
		this.privateletterService = privateletterService;
	}
	
	public String query(){
		pagination = new Pagination(this.page, this.rows);
		String sql = spliceSql();
		pagination.setTotal(baseService.getCount(Privateletter.class, sql));
		pagination.setRows(baseService.getObjects(Privateletter.class, sql, pagination.getFrom(), pagination.getSize(), this.order, this.sort));
		return "query";
	}
	
	public String spliceSql(){
		String whereSql = " as tt where 1=1";
		if (privateletter!=null) {
			Integer infostatus = privateletter.getPrivateletterInfostatus();
			if (infostatus!=null) {
				whereSql += " and tt.privateletterInfostatus = " + infostatus + " ";
			}
			String info = privateletter.getPrivateletterInfo();
			if (!"".equals(info) && (info!=null)) {
				whereSql += " and tt.privateletterInfo like '%" + info +"%'";
			}
			
			Users susers = privateletter.getUsersByUsersSid();
			if (susers!=null) {
				String email = susers.getUsersEmail();
				if (!"".equals(email) && email!=null) {
					whereSql += " and tt.susers.usersEmail like '%" + email +"%'";
				}
			}
			
			Users reusers = privateletter.getUsersByUsersReid();
			if (reusers!=null) {
				String email = reusers.getUsersEmail();
				if (!"".equals(email) && email!=null) {
					whereSql += " and tt.reusers.usersEmail like '%" + email + "%'";
				}
			}
			
		}
		return whereSql;
	}
	
	public String saveOrUpdateObject(){
		this.flag =  baseService.saveOrUpdateObject(privateletter);
		return "saveorupdate";
	}
	
	public String deleteObject(){
		this.flag = baseService.deleteObjects(Privateletter.class,ids);
		return "delete";
	}
	
	public String getAllSusers(){
		List<Users> lists = this.baseService.getAllObjects(Users.class);
		for (Users user : lists) {
			this.list.add(new ComboBoxBean(user.getUsersId(),user.getUsersEmail(),false));
		}
		return "queryall";
	}
	
	public String getAllReusers(){
		List <Users> lists = this.baseService.getAllObjects(Users.class);
		for (Users user : lists) {
			this.list.add(new ComboBoxBean(user.getUsersId(),user.getUsersEmail(),false));
		}
		return "queryall";
	}
}
