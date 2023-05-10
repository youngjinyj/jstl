<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br />
		<h2>투표프로그램</h2>
		<hr width="600" />
		<b>설문작성</b>
		<hr width="600" />
		<script type="text/javascript">
		function dateCheck(){
			const date1 = document.getElementsByName("sdate")[0].value;
			const date2 = document.getElementsByName("edate")[0].value;
			const sdate = new Date(date1);
			const edate = new Date(date2);
			if(sdate > edate){
			alert("날자 지대로 입력해라 ");
			return;
			}
			document.insertFrm.submit();
			
		}
		</script>
		<form method="post" action="pollInsertProc.jsp">
			<table border="1" width="500">
				<tr>
					<td><b>질문</b></td>
					<td colspan="2"><input name="question" size="30"></td>
				</tr>
				<tr>
					<td rowspan="10"><b>항목</b></td>
					<%
						for (int i = 1; i <= 4; i++) {
							out.println("<td>" + (i * 2 - 1)
									+ ": <input name='item'></td>");
							out.println("<td>" + (i * 2)
									+ ": <input name='item'></td>");
							out.println("</tr>");
							if (i == 9) {
								out.println("");
							} else {
								out.println("<tr>");
							}
						}//for end
					%>
				<tr>
					시작 <input type="date" name = "sdate" >
				</tr>
				<tr>
					종료 <input type="date" name = "edate">
				</tr>
				<tr>
					<td>복수투표</td>
					<td colspan=2>
						<input type="radio" name="type" value="1" checked>yes 
						<input type="radio" name="type" value="0">no
					</td>
				</tr>
				<tr>
					<td colspan=3>
						<input type="button" value="작성하기" onClick="dateCheck()"> 
						<input type="reset" value="다시쓰기"> 
						<input type="button" value="리스트" onClick="javascript:location.href='pollList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>