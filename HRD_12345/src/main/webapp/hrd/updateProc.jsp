<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hrd.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mMgr" class="hrd.MemberMgr" />    
<jsp:useBean id="bean" class="hrd.MemberBean" />
<jsp:setProperty property="*" name="bean"/>
<%
	int custno = Integer.parseInt(request.getParameter("custno"));
	boolean result = mMgr.updateMember(bean);
	String msg = "수정에 실패하였습니다";
	String url = "update.jsp?custno=" + custno;
	if(result){
		msg = "수정되었습니다";
	}

%>    
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
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