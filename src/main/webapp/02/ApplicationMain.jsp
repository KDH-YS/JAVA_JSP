<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Implicit Object Example</title>
</head>
<body>

<!-- application 객체에서 초기화 파라미터 "JAVA" 값 출력 -->
<%= application.getInitParameter("JAVA") %>
<br/>

<!-- /02 경로의 실제 파일 시스템 경로 출력 -->
<%= application.getRealPath("/02") %>

<!-- 메서드를 정의하여 특정 경로의 실제 경로 반환 -->
<%! 
    public String useImplicitObject() {
        return this.getServletContext().getRealPath("/02");
    }
%>

<br>
<!-- 메서드를 호출하여 출력 -->
<%= useImplicitObject() %>
<br>

</body>
</html>
