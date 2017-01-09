package com.service.impl;

import com.dao.MessagesDao;
import com.service.MessagesService;

public class MessagesServiceImpl extends BaseServiceImpl implements
		MessagesService {
	private MessagesDao messagesDao;

	public void setMessagesDao(MessagesDao messagesDao) {
		this.messagesDao = messagesDao;
	}
	
}
