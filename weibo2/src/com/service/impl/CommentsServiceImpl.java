package com.service.impl;

import com.dao.CommentsDao;
import com.service.CommentsService;

public class CommentsServiceImpl extends BaseServiceImpl implements
		CommentsService {
	private CommentsDao commentsDao;

	public void setCommentsDao(CommentsDao commentsDao) {
		this.commentsDao = commentsDao;
	}
	
}
