<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("idKey");

String url ="";
String msg ="";

if(id != null){
	
	url = "post.jsp";
    msg = "비속어, 성적음란물, 등을 올리시면 제제 대상이 되십니다.";
  }
else{
	 url = "list.jsp";
	 msg = "회원가입후 이용하실수있는 기능입니다.";
	 
}

%>

<script>
	
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>

	
