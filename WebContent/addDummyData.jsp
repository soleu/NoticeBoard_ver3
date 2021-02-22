<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>더미 파일 생성</title>
</head>
<body>



<%
BoardDAO.getInstance().addDummyData();
%>
<script>
window.location.href="MainBoard.jsp";
</script>
</body>
</html>