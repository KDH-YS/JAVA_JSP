<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);

Map<String, Object> param = new HashMap<String, Object>(); 
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
    param.put("searchField", searchField);
    param.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(param);
List<BoardDTO> boardLists = dao.selectList(param);
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<link href="./gallery.css" rel="stylesheet" type="text/css">
<style>
    table {
        width: 90%;
        border-collapse: collapse;
        border: 1px solid black;
    }
    th, td {
        border: 1px solid black;
        text-align: center;
    }
</style>
</head>
<body>
    <jsp:include page="../Common/Link.jsp" />

    <h2>목록 보기(List)</h2>
    <form method="get">
    <table>
        <tr>
            <td align="center">
                <select name="searchField">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" name="searchWord" />
                <input type="submit" value="검색하기" />
            </td>
        </tr>
    </table>
    </form>

    <table>
        <tr>
            <th width="7%">번호</th>
            <th width="50%">제목</th>
            <th width="10%">작성자</th>
            <th width="10%">조회수</th>
            <th width="10%">작성일</th>
            <th width="20%">닉네임</th>
        </tr>
<%
if (boardLists.isEmpty()) {
%>
        <tr>
            <td colspan="5" align="center">등록된 게시물이 없습니다</td>
        </tr>
<%
} else {
    int virtualNum = totalCount;
    for (BoardDTO dto : boardLists) {
       
%>
        <tr>
            <td><%= virtualNum %></td>
            <td align="left"><a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a></td>
            <td><%= dto.getId() %></td>
            <td><%= dto.getVisitcount() %></td>
            <td><%= dto.getPostdate() %></td>
            <td><%= dto.getName() %></td>
        </tr>

<% virtualNum--;
    }
}
%>
    </table>

    <table>
        <tr align="right">
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기</button></td>
        </tr>
    </table>
</body>
</html>
