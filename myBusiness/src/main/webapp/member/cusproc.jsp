<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<%
	  request.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("idKey");
	  String pwd = request.getParameter("idsearch");
	  String url = "login.jsp";
	  String msg = "정보조회에 실패했어.";
	  
	  boolean result = mMgr.loginMember(id,pwd);
	  
	  if(result){
		url = "cus.jsp";
	    msg = "정보조회에 성공 했어";
	  }
%>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>