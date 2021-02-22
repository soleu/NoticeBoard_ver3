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
request.setCharacterEncoding("utf-8");
String nickname=request.getParameter("nickname");
String pw=request.getParameter("pw");
String replyData=request.getParameter("replyData");
int idx=(int)session.getAttribute("idx");
BoardDAO.getInstance().addReplyList(idx, nickname, pw, replyData);
%>
<script>
alert("댓글을 등록했습니다.");
window.location.href="postPage.jsp?idx="+<%=idx%>;
</script>
</body>
</html>