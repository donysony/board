<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="Mgr" class="ch09.MemberMgr"/>
<jsp:useBean id="bean" class="ch09.MemberBean"/>
<jsp:setProperty property = "*" name = "bean"/>
<%
	boolean result = Mgr.insertMember(bean);
	String msg = "회원가입에 실패 하였습니다";
	String url = "member2.jsp";//실패시 member페이지로
	if(result){
		msg = "회원가입을 하였습니다";
		url = "login.jsp"; //성공시 login페이지로
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
</head>
<body>

</body>
</html>