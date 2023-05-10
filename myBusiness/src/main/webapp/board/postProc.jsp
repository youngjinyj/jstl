<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("idKey");
String pwd = request.getParameter("pwd");
String url ="";
String msg ="";
boolean result = mMgr.loginMember(id,pwd);
if(result){
	url = "list.jsp";
    msg = "비밀번호가 맞습니다.";
  }
else if (!result){
	 url = "postProc.jsp";
	 msg = "비밀번호가 다릅니다.";
}

%>

<html>
<head>
<script>
	if(<%=result%>){
	alert("<%=msg%>");	
	location.href="<%=url%>";
	}
	
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
글쓰기를 원하신다면 비밀번호를 입력해주세요.
<form method="post"action="postProc.jsp">
<input type="password" name="pwd">
<input type="submit">
</form>
</body>
</html>