<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("pageInteger",1000);
pageContext.setAttribute("pageString","페이지 영역의 문자열");
pageContext.setAttribute("pagePerson", new Person("한석봉",99));
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%=pageContext.getAttribute("pageInteger")%><br>
<%=pageContext.getAttribute("pageString") %><br>
<%
Person person = (Person)pageContext.getAttribute("pagePerson");
out.print("이름:" + person.getName() + ",나이:"+person.getAge()); %>
<br>


<%@ include file="PageInclude.jsp" %>

<a href="PageLocation.jsp">PageLocation바로가기</a>


</body>
</html>