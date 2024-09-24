<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page import="utils.BoardPage" %>
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
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int)Math.ceil((double)totalCount/pageSize);

int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals("")){
	pageNum = Integer.parseInt(pageTemp);
}

int start = (pageNum - 1) * pageSize +1;
int end = pageNum * pageSize;
param.put("start", start);
param.put("end",end);

List<BoardDTO> boardLists = dao.selectListPage(param);
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

    <h2>목록 보기 - 현재 페이지 : <%= pageNum %> (전체 : <%= totalPage %>)</h2>
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
    int countNum = 0;
    for (BoardDTO dto : boardLists) {
    	virtualNum = totalCount - (((pageNum-1)*pageSize)+ countNum++);
       
%>
        <tr>
            <td><%= virtualNum %></td>
            <td align="left"><a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a></td>
            <td><%= dto.getId() %></td>
            <td><%= dto.getVisitcount() %></td>
            <td><%= dto.getPostdate() %></td>
            <td><%= dto.getName() %></td>
        </tr>

<% 
    }
}
%>
    </table>

    <table>
        <tr align="center">
        	<td>
        		<%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>       
        	</td>
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기</button></td>
        </tr>
    </table>
</body>
</html>
