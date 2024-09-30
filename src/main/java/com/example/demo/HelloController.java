package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class HelloController {
	
	@GetMapping("/")
	@ResponseBody
	public String main() {
		return "<form action='/hello' method='get'><button>hello</button></form>";
	}	
			
	@GetMapping("/hello")
		public String hello() {
			return "hello";
		}	
	

}
