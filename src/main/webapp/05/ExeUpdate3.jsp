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
String num = request.getParameter("user_num");
String title= request.getParameter("user_title");
String content = request.getParameter("user_content");
String id = request.getParameter("user_id"); 
/*String postdate = request.getParameter("user_postdate"); */
//;
String sql = "INSERT INTO board (num,title,content,id) VALUES (?,?,?,?)";
PreparedStatement psmt = jdbc.con.prepareStatement(sql);
psmt.setString(1,num);
psmt.setString(2,title);
psmt.setString(3,content);
psmt.setString(4,id);


int inResult = psmt.executeUpdate();

jdbc.close(); 

if (inResult > 0) {
    out.print("<script>alert('" + inResult + " 행이 입력되었습니다.');</script>");
}

    request.getRequestDispatcher("ExeQuery.jsp").forward(request, response);

%>

</body>
</html>