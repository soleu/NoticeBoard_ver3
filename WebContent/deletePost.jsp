<%@page import="Board.*"%>
<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ����</title>
</head>
<body>
<%
//�������� �ε��� �ޱ�
int idx=(int)session.getAttribute("idx");
BoardDAO.getInstance().removePost(idx);
%>
<script>
alert("�����Ǿ����ϴ�.");
window.location.href="MainBoard.jsp";
</script>
</body>
</html>