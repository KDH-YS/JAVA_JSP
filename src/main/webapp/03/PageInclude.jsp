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

<% int pInteger = (Integer)(pageContext.getAttribute("pageInteger"));
Person person2 = (Person)(pageContext.getAttribute("pagePerson"));
%>

<%

out.print("Integer객체:"+pInteger);
out.print("<br>String객체:"+pageContext.getAttribute("pageString"));
out.print("<br>이름:"+person2.getName()+", 나이:"+person2.getAge());



%>

</body>
</html>