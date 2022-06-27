<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="loginScript.js"></script>
</head>
<body bgcolor="#b2dfdb">
<%if(id != null){%>	
	<h3><%=id %>님 반갑습니다.</h3>
	<h4>즐거운 쇼핑시간 보내세요</h4>
	<h4><a href="logout.jsp">로그아웃</a></h4>
<% } else { %>
		<form action="LoginProc.jsp" method="post" name="loginFrm">
		<table align="center">
		<tr>
			<td align="center" colspan="2"><h3>로그인</h3></td>
		</tr>
		<tr>
			<td>아 이 디</td>
			<td><input name="id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td> <input type="password" name="pwd" style="width:150px;"></td>
		</tr>
		<tr>
			<td colspan="2">
				<div align="right">
				<input type="button" value="로그인" onclick="loginCheck()">&ensp;
				<input type="button" value="회원가입" onclick="location.href='member2.jsp'">
				</div>
			</td>
		</tr>
		
		</table>
		
		</form>
<%} %>
</body>
</html>