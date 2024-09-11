<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
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
JDBConnect jdbc = new JDBConnect();

//회원추가
String title = request.getParameter("title");
String content= request.getParameter("content");
String writer = request.getParameter("writer");
String year = request.getParameter("year");
String num = request.getParameter("num");

String sql = "INSERT INTO Book (title,content,writer,year) VALUES (?,?,?,?)";
PreparedStatement psmt = jdbc.con.prepareStatement(sql);
psmt.setString(1,title);
psmt.setString(2,content);
psmt.setString(3,writer);
psmt.setString(4,year);

int inResult = psmt.executeUpdate();


 response.sendRedirect("BookList.jsp");
    
   
    

jdbc.close(); 

%>


</body>
</html>