package com.example.demo;

<<<<<<< HEAD
  
=======


import java.util.List;
>>>>>>> a0a00a4

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
<<<<<<< HEAD

import org.springframework.web.bind.annotation.ResponseBody;

  

@Controller

public class MessageController {

@Autowired

private MessageService messageService;

  

@GetMapping("/messages/{ms}")

@ResponseBody

public String getMessage(@PathVariable("ms") String ms) {

return "<h1>"+messageService.getMessage(ms)+"</h1>";

=======
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/messages")
public class MessageController {
	@Autowired
	private MessageService messageService;
	
	@GetMapping("/{id}")
	@ResponseBody
	public Message getMessage(@PathVariable("id") Integer id) {
		// Integer id = 1;
		return messageService.getMessage(id);
	}
	
	@GetMapping("/create")
	public String create() {
		return "create-message";
	}

	@PostMapping
	@ResponseBody
	public void createMessage(@RequestBody Message message) {
		messageService.createMessage(message);
	}
	
	@GetMapping()
	public String getMessages() {
		return "messages";
	}
	
	@GetMapping("/api")
	@ResponseBody
	public List<Message> getMessagesLimit10() {
		return messageService.getMessagesLimit10();
	}
>>>>>>> a0a00a4
}

}