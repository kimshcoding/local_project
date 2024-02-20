<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
</head>
<body>
    <h1>비밀번호 찾기</h1>
    <form action="passwordReset.jsp" method="post">
        이메일 주소: <input type="text" name="email" required><br>
        <input type="submit" value="비밀번호 찾기">
    </form>
</body>
</html>