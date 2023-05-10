<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="survey.*,java.util.Vector"%>
<%@ page errorPage ="../member/login.jsp" %>
<%@ page import="java.time.LocalDate" %>
<% 
		String id = (String)session.getAttribute("idKey");
		if(id.equals(""))
			response.sendRedirect("../member/login.jsp");
		
%>

<jsp:useBean id="pMgr" class="survey.PollMgr" />
<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br/>
		<h2>투표프로그램</h2>
		<hr width="600"/>
		<b>설문폼</b>
		<!--폴 리스트 폼 자리-->
		<jsp:include page="pollForm.jsp" />
		<hr width="600"/>
		<b>설문리스트</b>
		<!--폴 리스트 테이블 자리-->
		<table>
			<tr>
				<td>
					<table width="500" border="1">
						<tr>
							<td align="center"><b>설문여부</b></td>
							<td align="center"><b>번호</b></td>
							<td><b>제목</b></td>
							<td><b>시작일~종료일</b></td>
							<td><b>결과</b></td>
						</tr>
						<%
							LocalDate today =LocalDate.now();
							  Vector<PollListBean> vlist = pMgr.getAllList();
							
							  int count = vlist.size();
							  for (int i = 0; i < vlist.size(); i++) {
								PollListBean plBean = vlist.get(i);
								int num = plBean.getNum();
								String question = plBean.getQuestion();
								String sdate = plBean.getSdate();
								String edate = plBean.getEdate();
								LocalDate date = LocalDate.parse(edate);
								if(today.isAfter(date)){
									out.print("<tr><td>[종료]</td>");
								}
								else{
									out.print("<tr><td>[진행]</td>");
								}
								out.println("	<td align='center'>" + count + "</td>");
								if(today.isAfter(date)){
								out.println("<td><span" + num + "'>"
										+ question + "</span]></td>");
								}
								else{
								out.println("<td><a href='pollList.jsp?num=" + num + "'>"
										+ question + "</a></td>");
								}
								out.println("<td>" + sdate +" ~ "+ edate + "</td>");
								%>
									<td>
									<input type="button" value="결과" 
									onclick="javascript:window.open('pollView.jsp?num=<%=num%>',
									               'PollView','width=500, height=350')">
									</td>
								</tr>
								<% 
								count = count - 1;
							}
						%>
					</table>
				</td>
			</tr>
			<tr>
				<td><a href="pollInsert.jsp">설문 작성하기</a></td>
			</tr>
		</table>
	</div>
</body>
</html>
