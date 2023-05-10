<%@ page contentType="text/html; charset=UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="pMgr" class="survey.PollMgr"/>
<jsp:useBean id="plBean" class="survey.PollListBean"/>
<jsp:setProperty property="*" name="plBean"/>
<jsp:useBean id="piBean" class="survey.PollItemBean"/>
<jsp:setProperty property="*" name="piBean"/>
<%@ page import="java.time.LocalDate" %>
<%		
		String edateY = request.getParameter("edateY");
		int edatem = Integer.parseInt(request.getParameter("edateM"));
		int edated = Integer.parseInt(request.getParameter("edateD"));
		String edateM = request.getParameter("edateM");
		String edateD = request.getParameter("edateD");
		if(edatem < 10){
			edateM = "0"+edateM;
		}
		if(edated <10){
			edateD = "0"+edateD;
		}
		String nedate = edateY+"-"+edateM+"-"+edateD;
		LocalDate today =LocalDate.now();
		LocalDate date = LocalDate.parse(nedate);
		if(today.isAfter(date)){
			response.sendRedirect("pollInsert.jsp");
			return;
		}
		String sdate = request.getParameter("sdateY")+"-"+
							   request.getParameter("sdateM")+"-"+
								request.getParameter("sdateD");
		String edate = request.getParameter("edateY")+"-"+
								request.getParameter("edateM")+"-"+
								request.getParameter("edateD");
		plBean.setSdate(sdate);
		plBean.setEdate(edate);
		boolean flag = pMgr.insertPoll(plBean,piBean);
		String msg = "설문 추가에 실패 하였습니다.";
		String url = "pollInsert.jsp";
		if(flag){
			msg = "설문이 추가 되었습니다.";
			url = "pollList.jsp";
		}
%>
<script>
   alert("<%=msg%>");
   location.href="<%=url%>";
</script>