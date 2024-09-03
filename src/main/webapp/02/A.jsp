<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method ="post" action = "B.jsp">
<input type="text" name="id"/>
<input type="text" name="pwd"/>
<input type="submit" value="전송"/>
<br/>
요일
<input type="radio" name="week" value="월"/>월
<input type="radio" name="week" value="화"/>화
<input type="radio" name="week" value="수"/>수
<input type="radio" name="week" value="목"/>목
<input type="radio" name="week" value="금"/>금
<input type="radio" name="week" value="토"/>토
<input type="radio" name="week" value="일"/>일
</form>

</body>
</html>