<%@page import="Board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글쓰기</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String writer=request.getParameter("writer");
String title=request.getParameter("title");
String email=request.getParameter("email");
String pw=request.getParameter("pw");
String postData=request.getParameter("postData");
BoardDAO.getInstance().addPostList(writer,title,email,pw,postData);
%>
<script>window.location.href="MainBoard.jsp"</script>
</body>
</html>