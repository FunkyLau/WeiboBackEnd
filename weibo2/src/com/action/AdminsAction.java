package com.action;

import com.domain.Admins;
import com.opensymphony.xwork2.ActionContext;
import com.service.AdminsService;
import com.utils.Pagination;

public class AdminsAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AdminsService adminsService;
	private Admins admins;
	private String code;
	public Admins getAdmins() {
		return admins;
	}
	public void setAdmins(Admins admins) {
		this.admins = admins;
	}
	public void setAdminsService(AdminsService adminsService) {
		this.adminsService = adminsService;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
	public String checkName(){
		this.flag = baseService.checkProperty(Admins.class, "adminsName", admins.getAdminsName(), admins.getAdminsId());
		return "check";
	}
	public String login(){
		if (admins == null) {
			this.flag = false;
			return "logout";
		}
		//标记是否验证成功
		boolean flg = adminsService.login(admins.getAdminsName(),admins.getAdminsPass());
		//取出随机验证码的值
		String randimg = (String)ActionContext.getContext().getSession().get("randimg");
		if (!randimg.equals(code) && randimg!=code) {
			this.flag = false;
			return "logout";
		}
		if (flg) {
			//用户名密码验证成功
			this.flag = true;
			//把用户名写入会话
			ActionContext.getContext().getSession().put("adminsName", admins.getAdminsName());
			return "login";
		}else{
			this.flag = false;
			return "logout";
		}
	}
	
	public String exit(){
		//退出时用户名移出会话
		ActionContext.getContext().getSession().remove("adminsName");
		return "logout";
	}
	public String checkCode(){
		String randimg = (String)ActionContext.getContext().getSession().get("randimg");
		if(!randimg.equals(code)&&randimg!=code){
			this.flag=false;
		}else{
			this.flag = true;
		}
		return "check";
	}
	
	public String query(){
		pagination = new Pagination(this.page,this.rows);
		String sql = spliceSql();
		pagination.setTotal(baseService.getCount(Admins.class, sql));
		pagination.setRows(baseService.getObjects(Admins.class, sql, pagination.getFrom(), pagination.getSize(), this.order, this.sort));
		return "query";
	}
	
	public String spliceSql(){
		String whereSql = " where 1=1 ";
		if (admins!=null) {
			//序号
			Integer id = admins.getAdminsId();
			if (!"".equals(id)&&(id!=null)) {
				whereSql += " and adminsId = '" + id + "'";
			}
			//用户名
			String name = admins.getAdminsName();
			if (!"".equals(name)&&(name!=null)) {
				whereSql += " and adminsName like '%" + name + "%'";
			}
			//管理员类型
			String type = admins.getAdminsType();
			if (!"".equals(type)&&(type!=null)) {
				whereSql += " and adminsType = '" + type + "'";
			}
		}
		return whereSql;
		
	}
	
	public String saveOrUpdateObject(){
		this.flag = baseService.saveOrUpdateObject(admins);
		return "saveorupdate";
		
	}
	
	public String deleteObject(){
		this.flag = baseService.deleteObjects(Admins.class, ids);
		return "delete";
	}
}
