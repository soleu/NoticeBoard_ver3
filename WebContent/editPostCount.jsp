<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 게시글 수 바꾸기</title>
</head>
<body>
<%
int pagecount=Integer.parseInt(request.getParameter("pagecount"));
System.out.println(pagecount);
session.setAttribute("pagecount", pagecount);
%>
<script>
window.location.href="MainBoard.jsp"</script>
</body>
</html>