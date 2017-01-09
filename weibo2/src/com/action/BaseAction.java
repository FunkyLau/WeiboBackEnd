package com.action;

import java.util.ArrayList;
import java.util.List;

import com.domain.ObjectResult;
import com.opensymphony.xwork2.ActionSupport;
import com.service.BaseService;
import com.utils.ComboBoxBean;
import com.utils.Pagination;

public class BaseAction extends ActionSupport {

	/**
	 * 
	 */
	//private static final long serialVersionUID = 1L;
	//封装jQuery easyui中的rows和total
	protected Pagination pagination;
	protected ObjectResult result;
	public Pagination getPagination() {
		return pagination;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public void setList(List<ComboBoxBean> list) {
		this.list = list;
	}
	public void setBaseService(BaseService baseService) {
		this.baseService = baseService;
	}
	//封装jQuery easyui中当前页
	protected Integer page;
	//封装jQuery easyui中排序字段和排序方式
	protected String sort;
	protected String order;
	
	//封装每页显示的记录数
	protected Integer rows;
	
	//操作信息标识是的字符串
	protected boolean flag;
	//批量删除的ids
	protected String ids;
	protected List<ComboBoxBean> list = new ArrayList<ComboBoxBean>();
	//BaseService
	protected BaseService baseService;
	public ObjectResult getResult() {
		return result;
	}

	public void setResult(ObjectResult result) {
		this.result = result;
	}
}
