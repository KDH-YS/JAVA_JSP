<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>

<%@ include file="./IsLoggedIn.jsp" %>
<!DOCTYPE html>
<html>

<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO(application);
	BoardDTO dto = dao.selectView(num);
	String sessionId = session.getAttribute("UserId").toString();
	if(!sessionId.equals(dto.getId())){
		JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
		return;
	}
	
	dao.close();
	
%>

<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<link href="./gallery.css" rel="stylesheet" type="text/css">
</head>
<script>
function validateForm(cont){
	if(cont.title.value ==""){
		alert("제목을 입력하세요");
		cont.title.focus();
		return false;
	}
	if(cont.content.value ==""){
		alert("내용을 입력하세요");
		cont.content.focus();
		return false;
	}
	
	
}
</script>


<body>
<jsp:include page="../Common/Link.jsp" />
 <form name="writeFrm" method="post" action="EditProcess.jsp" onsubmit="return validateForm(this)">
 	<input type="hidden" name="num" value="<%= dto.getNum() %>">
  <table border="1" width="90%	">
  <h2>글 수정하기</h2>
	<tr>
		<td>제목</td>
		<td>
			<input type="text" name = "title" style="width:90%; "
			value="<%= dto.getTitle() %>"			 >
		</td>		
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea name = "content" style="width: 90%; height:100px;"><%=dto.getContent() %>
			</textarea>
			
		</td>		
	</tr>
	<tr>	
		<td colspan="2" align="center">
			<button type="submit">작성완료</button>
			<button type="reset">다시 입력</button>
			<button type="button" onclick="location.href='List.jsp'">목록보기</button>
		</td>
	</tr>	
 </table>
</form>

</body>
</html>