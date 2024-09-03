<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>포워드로 전달된 페이지</h2>
<h4>RequestMain 파일의 리퀘스트 영역 읽기</h4>
<%
Person fPerson = (Person)request.getAttribute("requestPerson");

%>
<ul>
<li>String 객체 : <%= request.getAttribute("requestString") %></li>

<li>Person 객체 : <%= fPerson.getName() %></li>

</ul>

</body>
</html>