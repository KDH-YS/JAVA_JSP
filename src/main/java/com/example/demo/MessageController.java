package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MessageController {
	@Autowired
     private MessageService MessageService; 

    @GetMapping("/messages/{ms}")
    @ResponseBody    
    public String getMessage(@PathVariable("ms") Integer ms) {
        return "<h1>"+MessageService.getMessage(ms)+"</h1>";  
    }
}

