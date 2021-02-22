<%@page import="Board.*"%>
<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스트 수정하기</title>
</head>
<body>
<%
int idx=(int)session.getAttribute("idx");
BoardDAO dao=BoardDAO.getInstance();
BoardDTO temp=dao.getPost(idx);
%>
<script>
function yesorno(){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="deletePost.jsp";
	}
	else{
		return;
	}
}
</script>
<h2>포스트 수정</h2>
<form method="post" action="postPageEditPro.jsp">
<table border="1">
<tr><td>작성자</td><td><input type="text" name="writer" value="<%=temp.getWriter()%>"></td></tr>
<tr><td>제목</td><td><input type="text" name="title" value="<%=temp.getTitle()%>"></td></tr>
<tr><td>이메일</td><td><input type="email" name="email" value="<%=temp.getEmail()%>"></td></tr>
<tr><td>내용</td><td><textarea name="postData" cols="22" rows="13"><%=temp.getPostData()%></textarea></td></tr>
<tr><td><input type="submit" value="등록하기"></td><td><input type="button" value="삭제하기" onclick="yesorno()"><input type="button" value="목록으로" onclick="window.location.href='postPage.jsp'">
</table>
</form>
</body>
</html>