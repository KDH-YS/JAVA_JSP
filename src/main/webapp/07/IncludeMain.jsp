<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String outerPath1 = "./inc/OuterPage1.jsp";
String outerPath2 = "./inc/OuterPage2.jsp";

pageContext.setAttribute("pageAttr", "동명왕");
request.setAttribute("requestAttr","온조왕");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>외부파일 </title>
</head>
<body>

<h2>지시어로 포함하기</h2>
<%@ include file="./inc/OuterPage1.jsp" %>
<p>고구려 세운 동명왕 <%=newVar1 %></p>

<h2>액션태그로 포함하기</h2>
<jsp:include page="./inc/OuterPage2.jsp"/>
<jsp:include page="<%=outerPath2 %>"/>
<p>백제 온조왕 :<%-- <%=newVar2 %> --%></p>

	

</body>
</html>