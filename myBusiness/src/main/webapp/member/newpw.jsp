<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<%
	  request.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("idKey");
	  String pwd = request.getParameter("pwd");
	  String newpwd = request.getParameter("newpwd");
	  String url = "cus.jsp";
	  String msg = "비밀번호 변경 실패";
	  
	  boolean result = mMgr.loginMember(id,pwd);
	  
	  if(result){
		mMgr.newPw(id,newpwd);
		url = "login.jsp";
	    msg = "비밀번호 변경 성공";
	  }
%>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>