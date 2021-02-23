<%@page import="Board.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Serif+KR:wght@300&display=swap')
	;

body {
	font-family: 'Black Han Sans', sans-serif;
	font-family: 'Noto Serif KR', serif;
}

a {
	color: #e28b21;
}

table.type10 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	margin: 20px 10px;
}

table.type10 thead th {
	width: 200px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: #e7708d;
	margin: 20px 10px;
}

table.type10 tbody th {
	width: 200px;
	padding: 10px;
}

table.type10 td {
	width: 400px;
	padding: 10px;
	vertical-align: top;
}

table.type10 .even {
	background: #e28b21;
}
</style>
<meta charset="UTF-8">
<title>메인 게시판</title>
</head>
<body style="text-align: center">
	<h2>게시글 목록</h2>
	<script>
	function page_move(index){
		var f=document.paging; //폼 name
		f.index.value = index; //POST방식으로 넘기고 싶은 값
		f.action="postPage.jsp";//이동할 페이지
		f.method="post";//POST방식
		f.submit();
		window.alert("출력");
		}
	</script>
	<form method="post" action="paging">
		<input type="hidden" name="s_index">
	</form>
	<%
	String center = "center.jsp?pageNum=0";
	if (request.getParameter("center") != null) {
		center = request.getParameter("center");
	}
	%>
	<table class="type10" border="1" style="margin: 0 auto; width: 800px">
		<th colspan="5" style="text-align: center">게시글 목록</th>
		<tr>
			<td colspan="5">
				<form method="post" action="editPostCount.jsp">
					한페이지에 보여줄 게시글 수 <select name="pagecount">
						<option value="5">5개씩</option>
						<option value="10">10개씩</option>
						<option value="15">15개씩</option>
						<option value="20">20개씩</option>
						<option value="30">30개씩</option>
						<option value="50">50개씩</option>
					</select> <input type="submit" value="수정하기">
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="5"><a href="mainPage.jsp">메인으로</a></td>
		</tr>
		<tr>
			<td colspan="5"><a href="addDummyData.jsp">dummy 10개 추가하기</a></td>
		</tr>
		<tr>
			<td colspan="5"><a href="clearBoard.jsp">전체 게시글 삭제</a></td>
		</tr>
		<tr>
			<td colspan="5" style="text-align: right"><a
				href="writeBoard.jsp">새 글쓰기</a></td>
		</tr>
		<section>
			<jsp:include page="<%=center%>"></jsp:include>
		</section>
		<br>
		<tr>
			<%
			int pageNum = (int) session.getAttribute("pageNum");
			System.out.println("pageNum:" + pageNum);
			int prepageNum = pageNum - 1;
			int nextPN = pageNum + 1;
			if (prepageNum == -1) {
				prepageNum = 0;
			}
			System.out.println("nextpageNum:" + nextPN);
			%>
			<td><button type="button"
					onclick="window.location.href='MainBoard.jsp?center=center.jsp?pageNum='+<%=prepageNum%>">이전
					페이지</button>&nbsp;&nbsp;</td>
			<td><button type="button"
					onclick="window.location.href='MainBoard.jsp?center=center.jsp?pageNum='+<%=nextPN%>">다음
					페이지</button></td>
		</tr>
	</table>
</body>
</html>