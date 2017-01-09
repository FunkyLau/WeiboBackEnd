package com.utils;

import java.util.Date;
import java.util.List;

public class ShowComments {
	private Integer nowpage;
	private Integer total;
	private List comments;
	private Integer from;
	private final Integer size = 6;
	private List headphotos;
	private Date nowtime = new Date();

	
	public Date getNowtime() {
		return nowtime;
	}
	public Integer getNowpage() {
		return nowpage;
	}
	public void setNowpage(Integer nowpage) {
		this.nowpage = nowpage;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List getComments() {
		return comments;
	}
	public void setComments(List comments) {
		this.comments = comments;
	}
	public Integer getFrom() {
		if(nowpage==null){
			nowpage = 1;
		}
		return (nowpage-1)*size;
	}
	public void setFrom(Integer from) {
		this.from = from;
	}
	public List getHeadphotos() {
		return headphotos;
	}
	public void setHeadphotos(List headphotos) {
		this.headphotos = headphotos;
	}
	public Integer getSize() {
		return size;
	}
}
