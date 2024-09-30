package com.example.demo;

  

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ResponseBody;

  

  

@Controller

public class MainController {

@GetMapping("/")

@ResponseBody

public String main() {

return "<form action='/hello' method='get'><button>hello</button></form>"+

"<form id='messageForm' method='get'>" +

"<input type='text' id='messageId' name='ms' placeholder='메시지를 입력해주세요'>" +

"<button type='submit'>Submit</button>" +

"</form>" +

"<script>" +

"document.getElementById('messageForm').onsubmit = function(event) {" +

" event.preventDefault();" + // 기본 제출 이벤트를 방지

" var ms = document.getElementById('messageId').value;" + // 입력값 가져오기

" window.location.href = '/messages/' + ms; " + // URL로 리디렉션

"};" +

"</script>"

;

}

@GetMapping("/hello")

public String hello() {

return "hello";

}

  

}