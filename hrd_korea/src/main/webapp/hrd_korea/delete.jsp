<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.DBCon, java.sql.*" %>
<%

	request.setCharacterEncoding("UTF-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	String id = request.getParameter("id");
	String msg = "삭제되지 않았습니다.";

try{
	con = DBCon.getConnection();
	String sql="delete from tbl_course where id=?" ;
	//String sql="delete from tbl_course where id=" + id ; 2가지 방법 사용가능
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	
	if(pstmt.executeUpdate() == 1)
	msg = "삭제가 완료되었습니다.";
	
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
location.href = "list.jsp";

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>