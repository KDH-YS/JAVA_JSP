package com.example.demo;

public class MessageService {

	public String getMessage(Integer id) {
		return messageMapper.getMessageById(id);
	
	}
	
}
