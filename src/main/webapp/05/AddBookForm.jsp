<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 입력 폼</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-container {
        background-color: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        width: 100%;
    }

    .form-container h2 {
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }

    .form-container input[type="text"] {
        width: calc(100% - 20px);
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .form-container input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .form-container input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="form-container">
        <h2>책 추가</h2>
        <form action="BookInput.jsp" method="post">
            <label>제목</label>
            <input type="text" name="title" placeholder="제목을 입력하세요" /> <br/>
            <label>내용</label>
            <input type="text" name="content" placeholder="내용을 입력하세요"/><br/>
            <label>작가</label>
            <input type="text" name="writer" placeholder="작가를 입력하세요"/><br/>
            <label>년도</label>
            <input type="text" name="year" placeholder="년도를 입력하세요"/><br/>
            <input type="submit" value="저장"/>
        </form>
    </div>
</body>
</html>
