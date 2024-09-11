<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book List</title>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    table, th, td {
        border: 1px solid black;
    }
    th, td {
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    input[type="submit"] {
        text-align: center;
        width: 90%;
        padding: 10px;
        background-color: #007bff;
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .form_area {
        text-align: center;
        margin-top: 20px;
    }
</style>
</head>
<body>
<%
JDBConnect jdbc = new JDBConnect();
String sql = "SELECT num, title, content, writer, year FROM BOOK";
Statement stmt = jdbc.con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>

<!-- Start HTML table -->
<form action="DeleteBooks.jsp" method="post">
    <table>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>내용</th>
            <th>작가</th>
            <th>년도</th>
            <th>삭제</th>
        </tr>
        <%
        while (rs.next()) {
            String num = rs.getString("num");
            String title = rs.getString("title");
            String content = rs.getString("content");
            String writer = rs.getString("writer");
            String year = rs.getString("year");
            out.println(String.format(
                "<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td>" +
                "<td><input type='checkbox' name='bookDelete' value='%s'/></td></tr>",
                num, title, content, writer, year, num
            ));
        }
        %>
    </table>
    <input type="submit" value="삭제"/>
</form>

<!-- Close connection -->
<%
jdbc.close();
%>

<div class="form_area">
    <form action="AddBookForm.jsp" method="post">
        <input type="submit" value="뒤로"/>
    </form>
</div>
</body>
</html>
