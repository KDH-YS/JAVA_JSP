<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="person" class="common.Person" scope="request"/>

<p><jsp:getProperty property="name" name="person"/></p>
<p>나이<jsp:getProperty property="age" name="person"/></p>
<p>이름: <%= request.getParameter("param1") %></p>
<p>주소: <%= request.getParameter("param2") %></p>
<p>직업: <%= request.getParameter("param3") %></p>

<jsp:include page="inc/ParamInclude.jsp">
	<jsp:param value="도우너" name="loc1"/>
	<jsp:param value="광대" name="loc2"/>
</jsp:include>

</body>
</html>