<%@page import="Board.*"%>
<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스트</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Serif+KR:wght@300&display=swap')
	;

body {
	font-family: 'Black Han Sans', sans-serif;
	font-family: 'Noto Serif KR', serif;
}

p {
	width: 250px;
	height: 330px;
	border: 1px solid green;
}
</style>
</head>
<body>

<h2>포스트 개별 페이지 입니다.</h2>
	<%
	int index = Integer.parseInt(request.getParameter("idx"));
	out.println("No. " + index);
	session.setAttribute("idx", index);//세션에 저장

	BoardDAO dao = BoardDAO.getInstance();
	BoardDTO Apost = dao.getPost(index);
	Apost.addCount();
	%>
	<Table border="1">
		<th colspan="4" style="text-align: center"><%=Apost.getTitle()%>
		</th>
		<tr>
			<td>작성자</td>
			<td><%=Apost.getWriter()%></td>
			<td>작성일시</td>
			<td><%=Apost.getDate()%></td>
		</tr>
		<tr>

			<td>조회수</td>
			<td><%=Apost.getCount()%></td>
			<td><button onclick="window.location.href='checkPw.jsp'">수정하기</button></td>
			<td><button onclick="window.location.href='MainBoard.jsp'">뒤로가기</button></td>
		</tr>

		<tr>
			<td>작성내용</td>
			<td colspan="3">
				<p>
					<%=Apost.getPostData()%>
				</p>
			</td>
		</tr>
	</Table>
	<br>
	<br>
	<%
	out.println(Apost.getReplyList().size());
	if (Apost.getReplyList().size() > 0) {
		for (int i = 0; i < Apost.getReplyList().size(); i++) {
			BoardReply temp = Apost.getReply(i);
	%>
	<table border="1">
		<tr>
		<tr>
			<td rowspan="2" width=50px style="text-align: center">댓글</td>
			<td>닉네임 : <%=temp.getNickname()%>
			<td><button type="button" onclick="window.location.href='deleteReply.jsp?num='+<%=i%>">삭제하기</button> 
				</td>
		</tr>
		<tr>
			<td colspan="3"><%=temp.getReplyInfo()%></td>
			<td></td>
		</tr>
		<%
		}
		%>
	</table>
	<%
	}
	%>

	<table border="1">
		<form method="post" action="postReplyPro.jsp">
			<tr>
				<td rowspan="2" width=50px style="text-align: center">댓글</td>
				<td>닉네임 : <input type="text" name="nickname"
					style="width: 70px">
				<td>비밀번호 <input type="password" name="pw" style="width: 50px"></td>
			</tr>
			<tr>
				<td colspan="3"><textarea cols="35" rows="3" name="replyData"
						placeholder="댓글을 입력해주세요 :)"></textarea></td>
				<td><input type="submit" value="등록"></td>
			</tr>
		</form>
	</table>
</body>
</html>