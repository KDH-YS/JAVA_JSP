<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setAttribute("requestString", "request 영역의 문자열");
request.setAttribute("requestPerson", new Person("안중근",31));
request.setAttribute("requestInt", 1009);
%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>request 역역의 속성값 삭제하기 및 읽기</h2>
<%
    request.removeAttribute("requestString");
	Person person = (Person)request.getAttribute("requestPerson");
	String rString = (String)request.getAttribute("requestString");
	Integer rInt = (Integer)request.getAttribute("requestInt");
	request.removeAttribute("requestInt");
	Integer rInt2 = (Integer)request.getAttribute("requestInt");

	out.print("<br>rString:"+((rString==null)? "삭제됨":rString));
	out.print("<br>rInt:"+((rInt==null)? "삭제됨":rInt));
	out.print("<br>rInt:"+((rInt2==null)? "삭제됨":rInt2));
	out.print("<br>이름:"+person.getName()+", 나이:"+person.getAge());
%>

<h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
<%
request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English").forward(request, response);
		
		
%>



</body>
</html>