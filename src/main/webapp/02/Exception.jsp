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
int status = response.getStatus();

if(status == 404){
	out.print("404에러<br>");
	out.print("파일경로확인");
} else if (status == 405){
	out.print("405에러<br>");
	out.print("요청방식확인");
} else if (status == 500){
	out.print("500에러");
	out.print("소스코드확인");
}
%>



</body>
</html>