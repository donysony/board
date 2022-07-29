<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.DBCon, java.sql.*" %>
<%

	request.setCharacterEncoding("UTF-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	String id = request.getParameter("id");
	String msg = "교과목 수정이 완료되지 않았습니다.";

try{
	con = DBCon.getConnection();
	String sql="update tbl_course set name=?, credit=?, lecturer=?, week=?, start_hour=?, end_hour=? where id=?" ;
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("name"));
	pstmt.setString(2, request.getParameter("credit"));
	pstmt.setString(3, request.getParameter("lecturer"));
	pstmt.setString(4, request.getParameter("week"));
	pstmt.setString(5, request.getParameter("start_hour"));
	pstmt.setString(6, request.getParameter("end_hour"));
	pstmt.setString(7, id);
	//pstmt.excuteUpdate();   결과값은 1,0 -->1이면 true, 0이면 false
	if(pstmt.executeUpdate() == 1)
	msg = "교과목 수정이 완료되었습니다.";
	
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
location.href = "modify.jsp?id=<%=id%>";

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>