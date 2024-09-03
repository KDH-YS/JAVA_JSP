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

<% 
Integer pInteger = (Integer)pageContext.getAttribute("pageInteger");
String pString = (String)pageContext.getAttribute("pageString");
Person person3 = (Person)(pageContext.getAttribute("pagePerson"));

%>

<%

out.print("Integer객체:"+ (( pInteger == null) ? "값 없음" : pInteger));


%>

</body>
</html>