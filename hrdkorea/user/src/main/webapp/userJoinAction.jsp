<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8"); //한글을 사용할 수 있는 형식으로 받는다
	String userID = null;
	String userPassword = null;
	if(request.getParameter("userID") != null){
		userID = (String)request.getParameter("userID");
	}
	if(request.getParameter("userPassword") != null){
		userPassword = (String)request.getParameter("userPassword");
	}
	if(userID == null || userPassword == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다');");
		script.println("history.back();"); //원래화면으로 돌려보냄
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO(); //userdao를 이용해 실제 데이터베이스와 연동될 수 있도록 해줌
	int result = userDAO.join(userID, userPassword);  //회원가입을 실행한 결과를 result에 담아줌
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>