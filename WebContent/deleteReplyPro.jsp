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
int repIdx=Integer.parseInt(request.getParameter("num"));
String repPw=BoardDAO.getInstance().getPost(repIdx).getPw();
String pw=request.getParameter("pw");
if(repPw.equals(pw)){
	BoardDAO.getInstance().removePostReply(idx, repIdx);	
%>
<script>
window.location.href="postPage.jsp?idx="+<%=idx%>;
</script>
<%}else{
%>
<script>
alert("비밀번호가 일치하지 않습니다.");
window.location.href="deleteReply.jsp";
</script>
<% 
}

%>

%>
</body>
</html>