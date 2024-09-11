<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String pValue="불법체류자";
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="person" class="common.Person" scope="request"/>
<jsp:setProperty property="name" name="person" value="마이콜"/>
<jsp:setProperty property="age" name="person" value="33"/>

<jsp:forward page="ParamForward.jsp?param1=둘리">
	<jsp:param value="도봉구 쌍문동" name="param2"/>
	<jsp:param value="<%=pValue %>" name="param3"/>
</jsp:forward>

</body>
</html>