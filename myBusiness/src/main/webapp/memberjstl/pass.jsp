<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sql:setDataSource
	url="jdbc:mysql://127.0.0.1:3306/mybusiness?useUnicode=true&characterEncoding=UTF-8"
	driver="com.mysql.cj.jdbc.Driver" user="root" password="root" var="db"
	scope="application" />
    <%@ page import="member.SHA256"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="pw" value="${SHA256.encodeSha256(param.pwd)}" scope="session"/>

	   <sql:query var="lists" dataSource="${db}">
        select pwd from tblMember where id= ?
        <sql:param value="${param.id}"/>
       </sql:query>
	<br/> 
	
	<c:forEach var="i" items="${lists.rowsByIndex}">
	 <c:forEach var="columnValue" items="${i}">
	 <c:set var = "pass" value="${columnValue}" scope="page"/>
	
	 </c:forEach>
	 </c:forEach>
	 
<c:choose>
	<c:when test="${pw == pass}">
	비밀번호 변경됨	
	<sql:update var="lists" dataSource="${db}">
        update tblMember set pwd=? where id=?
        <sql:param value="${SHA256.encodeSha256(param.nwd)}"/>
        <sql:param value="${param.id }"/>
       </sql:update>
     
	</c:when>
	<c:otherwise> 
	<p>비밀번호 다름</p>
	
	</c:otherwise>
</c:choose>
</body>
</html>