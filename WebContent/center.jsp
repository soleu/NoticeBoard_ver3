<%@page import="Board.BoardDTO"%>
<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cneter</title>
<style>
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
</head>
<body>
<table class="type10" border="1" style="margin: 0 auto; width:800px">
	<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<%
		int pagecount=(int)session.getAttribute("pagecount");
		BoardDAO dao = BoardDAO.getInstance();
		int pageNum=0;
		if(request.getParameter("pageNum")==null){
			pageNum=0;}
		else{
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
			session.setAttribute("pageNum",pageNum);
		}
		int i=pageNum*pagecount;
		System.out.println("i:"+i+"pageNum:"+pageNum+"pagecount:"+pagecount);
		int end=i+pagecount;
		for (; i < end; i++) {
			if(i==dao.getPostList().size()){break;}
			BoardDTO temp = dao.getPostList().get(i);
		%>
	
		<%

		
		%>
			<%--javascript:page_move('<%=i %>'); --%>
		<tr>
			<td><%=temp.getNo()%></td>
			<td><%=temp.getWriter()%></td>
			
			<td><a href=postPage.jsp?idx=<%=i%>> <%=temp.getTitle()%></a>
			</td>
			
			<td><%=temp.getDate()%></td>
			<td><%=temp.getCount()%></td>
		</tr>
		<%}
%>
</table>
</body>
</html>