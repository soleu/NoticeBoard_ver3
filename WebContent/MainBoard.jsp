<%@page import="Board.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Serif+KR:wght@300&display=swap');
body{
font-family: 'Black Han Sans', sans-serif;
font-family: 'Noto Serif KR', serif;
}
a{
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
	
	<table class="type10" border="1" style="margin: 0 auto">
		<th colspan="5" style="text-align: center">게시글 목록</th>
		<tr>
			<td colspan="5">
				<form method="post" action="editPostCount.jsp">
					한페이지에 보여줄 게시글 수
					 <select name="pagecount">
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
			<td colspan="5" style="text-align: right"><a href="writeBoard.jsp">새 글쓰기</a>
			</td>
		</tr>
		<%
		int pagestartNum=0;
		if(request.getParameter("pagestartNum")!=null){
			pagestartNum=Integer.parseInt(request.getParameter("pagestartNum"));
		}
		System.out.println("psn"+pagestartNum);
		
		%>
		<tr>
			<td name="pagestartNum" value="<%=pagestartNum%>">번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<%
		
		
		int pagecount=(int)session.getAttribute("pagecount");
		BoardDAO dao = BoardDAO.getInstance();
		int i=pagestartNum;
		int end=i+pagecount;
		for (; i < end; i++) {
			if(i==dao.getPostList().size()){break;}
			BoardDTO temp = dao.getPostList().get(i);
		
		%>
			<%--javascript:page_move('<%=i %>'); --%>
		<tr>
			<td><%=temp.getNo()%></td>
			<td><%=temp.getWriter()%></td>
			<td name=<%=i %>>
			
			<a href=postPage.jsp?idx=<%=i%>> <%=temp.getTitle()%></a>
			</td>
			
			<td><%=temp.getDate()%></td>
			<td><%=temp.getCount()%></td>
		</tr>
		<%}
%>
<tr>
<td><button type="button" onclick="request.setParameter("pagestartNum",10)">이전페이지</button></td>
<td><input type="button" value="다음 페이지" onclick="#"></td>
</tr>
	</table>
</body>
</html>