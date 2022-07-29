<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.DBCon, java.sql.*" %>
<%

	request.setCharacterEncoding("UTF-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	String msg = "교과목 추가에 실패했습니다!";

try{
	con = DBCon.getConnection();
	String sql="insert into tbl_course values(?,?,?,?,?,?,?)" ;
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("id"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("credit"));
	pstmt.setString(4, request.getParameter("lecturer"));
	pstmt.setString(5, request.getParameter("week"));
	pstmt.setString(6, request.getParameter("start_hour"));
	pstmt.setString(7, request.getParameter("end_hour"));

	if(pstmt.executeUpdate() == 1)
	msg = "교과목 추가가 정상적으로 등록되었습니다.";
	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
		

%>
<!DOCTYPE html>
<html>
<head>
<script>
alert("<%=msg%>");
location.href = "index.jsp";

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>