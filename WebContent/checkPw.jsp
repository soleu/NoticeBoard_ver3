<%@page import="Board.*"%>
<%@page import="Board.BoardDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>비밀번호 확인</h2>
<form method="post" action="checkPwPro.jsp">
비밀번호 입력 :<input type="text" name="pw">
<input type="submit" value="확인">
<button type="button" onclick="window.location.href='postPage.jsp'">뒤로가기</button>
</form>
</body>
</html>