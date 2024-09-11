<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Books</title>
</head>
<body>
<%
    JDBConnect jdbc = new JDBConnect();
    Connection con = jdbc.con;
    
        // Get the list of books to delete
        String[] Delete = request.getParameterValues("bookDelete");
        
        if (Delete != null) {
            String sql = "DELETE FROM BOOK WHERE num = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);

            for (String bookNum : Delete) {
                pstmt.setString(1, bookNum);
                pstmt.executeUpdate();
            }           
            response.sendRedirect("BookList.jsp");          
        } else {
            out.println("삭제할 책이 선택되지 않았습니다.");
        }

        jdbc.close();
   
%>
<a href="BookList.jsp">뒤로 가기</a>
</body>
</html>
