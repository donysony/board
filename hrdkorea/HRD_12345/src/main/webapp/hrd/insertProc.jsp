<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mMgr" class="hrd.MemberMgr"/>
<jsp:useBean id="bean" class="hrd.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	boolean result = mMgr.insertMember(bean);
	String msg = "회원가입에 실패 하였습니다";
	String url = "insert.jsp";
	if(result)
		msg = "회원가입에 성공하였습니다";
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>