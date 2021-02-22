<%@page import="Board.*"%>
<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 삭제</title>
</head>
<body>
<%
//세션으로 인덱스 받기
int idx=(int)session.getAttribute("idx");
BoardDAO.getInstance().removePost(idx);
%>
<script>
alert("삭제되었습니다.");
window.location.href="MainBoard.jsp";
</script>
</body>
</html>