<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*,member.*"%>
    <jsp:useBean id="member" class="member.MemberMgr" />
    
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function zipSearch() {
	url = "zipSearch.jsp?search=n";
	window.open(url, "ZipCodeSearch",
				"width=500,height=300,scrollbars=yes");
}
function ch(){
 var pw = prompt("회원 탈퇴 하시려면 비밀번호를 입력해주세요.").type=password;
 alert(pw);
}
</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String idsearch = request.getParameter("idsearch");
String id = (String)session.getAttribute("idKey");
MemberBean userBean = member.getMember(id);
String jobname = member.getJobname(id);
String car[]={"운동","놀이","주사","망나니","그라운드"};

String hobby[] = userBean.getHobby();
String hubbyOut = "";

for(int i=0; i<hobby.length; i++){
	if(hobby[i].equals("1")){
		hubbyOut += "/" + car[i];
	}
			
}

%>
<%=idsearch%>


<p>아이디:<%=userBean.getId() %></p>
<p>이름:<%=userBean.getName() %></p>
<p><%=userBean.getGender() %></p>
<p>생일:<%=userBean.getBirthday() %></p>
<p>취미:<%=hubbyOut %></p>
<p>직업:<%=userBean.getJob() %></p>
<p>직업:<%=jobname %></p>
<p>국가:<%=userBean.getFrom() %></p>
<form name="regFrm" method="post" action="newpw.jsp">
	<input type="password" name="pwd" placeholder="현재비밀번호">
	<input type="password"name="newpwd" placeholder="지금 비밀번호">
	<input type="submit" value="비밀번호 변경"><br/>
	우편번호
	<input name="zipcode" size="5" value="<%=userBean.getZipcode() %>" readonly> 
	<input type="button" value="우편번호찾기" onClick="zipSearch()">
	주소
	<input name="address" value="<%=userBean.getAddress() %>"size="45">
	주소를 적어 주세요.
	우편번호를 검색하세요.<br/>
	이메일:<input type="email" name="email" value="<%=userBean.getEmail() %>">
	<button type="button" onclick="ch()">회원 탈퇴</button>
</form>
</body>
</html>















