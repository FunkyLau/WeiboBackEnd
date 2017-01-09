package com.action;

import java.util.List;

import com.domain.Relation;
import com.domain.Users;
import com.service.RelationService;
import com.utils.ComboBoxBean;
import com.utils.Pagination;

public class RelationAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private RelationService relationService;
	private Relation relation;
	private Users tusers;//关注的用户
	private Users byusers;//被关注用户
	private String bedate;//关注前
	private String afdate;//关注后
	public RelationService getRelationService() {
		return relationService;
	}
	public void setRelationService(RelationService relationService) {
		this.relationService = relationService;
	}
	public Relation getRelation() {
		return relation;
	}
	public void setRelation(Relation relation) {
		this.relation = relation;
	}
	public Users getTusers() {
		return tusers;
	}
	public void setTusers(Users tusers) {
		this.tusers = tusers;
	}
	public Users getByusers() {
		return byusers;
	}
	public void setByusers(Users byusers) {
		this.byusers = byusers;
	}
	public String getBedate() {
		return bedate;
	}
	public void setBedate(String bedate) {
		this.bedate = bedate;
	}
	public String getAfdate() {
		return afdate;
	}
	public void setAfdate(String afdate) {
		this.afdate = afdate;
	}
	
	public String query(){
		pagination = new Pagination(this.page,this.rows);
		String sql = spliceSql();
		pagination.setTotal(baseService.getCount(Relation.class, sql));
		pagination.setRows(baseService.getObjects(Relation.class, sql,pagination.getFrom(),pagination.getSize(),this.order,this.sort));
		return "query";
	}
	
	public String spliceSql(){
	/**
	 * private Users tusers;private Users byusers;private String bedate;private String afdate;
	 */
		String whereSql = " as tt where 1=1 ";
		if (relation != null) {
			//序号
			Integer id = relation.getRelationId();
			if (!"".equals(id) && (id!=null)) {
				whereSql += " and tt.relationId = '" + id + "'";
			}
			
		}
		if (tusers != null) {
			Integer tid = tusers.getUsersId();
			if (!"".equals(tid) && tid!=null) {
				whereSql += " and tt.usersByUsersId.usersId = '" + tid + "'"; 
			}
		}
		
		if (byusers != null) {
			Integer byid = byusers.getUsersId();
			if (!"".equals(byid) && (byid != null)) {
				whereSql += " and tt.usersByUsersByid.usersId = '" + byid + "'";
			}
			
		}
		// to_date('2010-10-14 14:00:00','yyyy-mm-dd hh24:mi:ss')
		if (bedate != null && !"".equals(bedate) && afdate != null && !"".equals(afdate)) {
			whereSql += " and tt.relationTime >= to_date('" +bedate + "','yyyy-mm-dd hh24:mi:ss') and tt.relationTime <= to_date('" + afdate + "','yyyy-mm-dd hh24:mi:ss')";
			
		}else{
			if (bedate != null) {
				String time = bedate;
				if (!"".equals(time)&&(time!=null)) {
					whereSql += " and tt.relationTime >= to_date('" + time + "','yyyy-mm-dd hh24:mi:ss')";
				}
			}
			if (afdate != null) {
				String time = afdate;
				if (!"".equals(time) && (time!=null)) {
					whereSql += " and tt.relationTime <= to_date('" + time +"','yyyy-mm-dd hh24:mi:ss')";
				}
			}
		}
		return whereSql;
	}
	
	public String getAllByusers(){
		List<Users> users = baseService.getAllObjects(Users.class);
		for (Users user : users) {
			list.add(new ComboBoxBean(user.getUsersId(),user.getUsersEmail(),false));
			
		}
		return "queryall";
	}
	
	public String getAllTusers(){
		List<Users> users = baseService.getAllObjects(Users.class);
		for (Users user : users) {
			list.add(new ComboBoxBean(user.getUsersId(),user.getUsersEmail(),false));
		}
		return "queryall";
	}
	
	public String saveOrUpdateObject(){
		System.out.println(relation.getRelationId() + "....."
	+ relation.getRelationGroupname() + ".." +relation.getRelationNote() + ".." + relation.getUsersByUsersId().getUsersId() + ".." + relation.getRelationTime() +".." + relation.getUsersByUsersByid());
		this.flag = baseService.saveOrUpdateObject(relation);
		return "saveorupdate";
	}
	
	public String deleteObject(){
		this.flag = baseService.deleteObjects(Relation.class, ids);
		return "delete";
	}
}
