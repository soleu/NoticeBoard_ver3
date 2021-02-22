<%@page import="Board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	전체 게시글 삭제
	<script>
if(confirm("정말 삭제하시겠습니까?")==true){		
<%BoardDAO.getInstance().clearAll();%>
window.location.href="MainBoard.jsp";
}
else{
	window.location.href="MainBoard.jsp";

}
</script>
</body>
</html>