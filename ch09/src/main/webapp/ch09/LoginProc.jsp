<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="ch09.MemberMgr"/> <!-- 이클래스를 사용하겠다 -->
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String msg = "로그인에 실패 하였습니다.";
	String url = "Login.jsp";
	
	boolean result = mMgr.loginMember(id, pwd);//사용자로 부터 받은 id와 pwd가 맞는지 있으면 true, 다르면 false
	if(result){
		session.setAttribute("idKey", id);
		msg = "로그인에 성공 하였습니다";
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