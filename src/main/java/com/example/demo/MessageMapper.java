package com.example.demo;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageMapper {

	Message getMessageById(Integer id);
	void insertMessage(Message message);
	List<Message> getMessagesLimit10();
}
