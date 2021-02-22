<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글쓰기</title>
</head>
<body>
<h2>새 글 작성하기</h2>
<form method="post" action="writeBoardPro.jsp">
<table border="1">
<tr><td>작성자</td><td><input type="text" name="writer"></td></tr>
<tr><td>제목</td><td><input type="text" name="title"></td></tr>
<tr><td>이메일</td><td><input type="email" name="email"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pw"></td></tr>
<tr><td>내용</td><td><textarea name="postData" cols="22" rows="13"></textarea></td></tr>
<tr><td><input type="submit" value="등록하기"></td><td><input type="button" value="목록으로" onclick="window.location.href='MainBoard.jsp'">
</table>
</form>
</body>
</html>