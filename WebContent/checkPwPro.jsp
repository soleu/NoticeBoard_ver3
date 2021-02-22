<%@page import="Board.*"%>
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
//세션으로 해당 글 비밀번호 가져오기
int idx=(int)session.getAttribute("idx");
BoardDAO dao=BoardDAO.getInstance();
BoardDTO Apost = dao.getPost(idx);//일단 제일 앞거 가져옴
		String pw2=Apost.getPw();
boolean check;


String pw=request.getParameter("pw");
check=dao.checkPw(pw, pw2);
%>
<%
if(check==true){
	%>
	<script>
	alert("수정페이지로 넘어갑니다.");
 	window.location.href="postPageEdit.jsp";	
	</script>
	<%
	
}
else{%>
	<script>
	alert("비밀번호가 일치하지않습니다.");
	window.location.href="checkPw.jsp";
	</script>
	<%
}
%>
</body>
</html>