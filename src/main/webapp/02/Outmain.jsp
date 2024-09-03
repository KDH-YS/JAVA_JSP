<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="1kb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.print("출력되지 않는 텍스트");
out.clearBuffer();
out.print("출력되는 텍스트<br>");
out.print("출력버퍼:"+out.getBufferSize());

out.print("<br/>남은버퍼:"+out.getRemaining());
%>

</body>
</html>