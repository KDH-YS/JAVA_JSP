package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;

	@GetMapping("/messages/{id}")
	@ResponseBody
	public String getMessage(@PathVariable("id") Integer id) {
		return messageService.getMessage(id);
	}
	
}
