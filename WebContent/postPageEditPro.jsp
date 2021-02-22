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
<% 
int idx=(int)session.getAttribute("idx");
request.setCharacterEncoding("utf-8");
String writer=request.getParameter("writer");
String title=request.getParameter("title");
String email=request.getParameter("email");
String postData=request.getParameter("postData");
BoardDAO.getInstance().editPost(idx,writer,title,email,postData);
%>
<script>
window.location.href="MainBoard.jsp";
</script>
</body>
</html>