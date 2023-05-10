<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardBean"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<!DOCTYPE html>
<% 
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));
//String pw = request.getParameter("pw");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="pwproc">
<input name="pw">
<input type="submit">
</form>
</body>
</html>