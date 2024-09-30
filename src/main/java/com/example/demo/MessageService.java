package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
	@Autowired
	private MessageMapper messageMapper;
	// 데이터베이스에서 값을 가져오는 것
	public String getMessage(Integer id) {
		Message message = messageMapper.getMessageById(id);
		
		return message.getName()+" "+message.getJob();
		//return "Hello World";
	}
}