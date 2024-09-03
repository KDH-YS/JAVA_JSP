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
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

if(id.equalsIgnoreCase("KDH")&& pwd.equalsIgnoreCase("4451")){
	response.sendRedirect("ResponseWelcome.jsp");
	
} else{
    out.println("<script>");
    out.println("alert('로그인 실패');");
    out.println("location.href='ResponseMain.jsp';");
    out.println("</script>");
} %>




</body>
</html>