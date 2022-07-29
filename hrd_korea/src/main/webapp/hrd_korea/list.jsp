<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DBPKG.DBCon, java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		con = DBCon.getConnection();
		String sql="select id, C.name, credit, L.name, week, start_hour, end_hour from tbl_course C, tbl_lecturer L where C.lecturer = L.idx order by id";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		

		%>
		
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
section table a{text-decoration:underline;}
section{display:flex; justify-content:center; align-items:center;}
h3{text-align:center;}
table, th, td{border:1px solid black; border-collapse:collapse}
table{text-align:center;}
</style>
<title>Insert title here</title>
</head>
<body>
<header>
<jsp:include page="header.jsp"/>
</header>
<section>
	<article>
	<h3>교과목조회</h3>
	<table>
		<tr>
			<th>과목코드</th>
			<th>과목명</th>
			<th>학점</th>
			<th>담당강사</th>
			<th>요일</th>
			<th>시작시간</th>
			<th>종료시간</th>
			<th>삭제</th>
		</tr>
		<tr>
	<%
				while(rs.next()){
					int week = rs.getInt(5);
					String day = null;
					
					if(week==1)
						day="월요일";
					else if(week==2)
						day="화요일";
					else if(week==3)
						day="수요일";
					else if(week==4)
						day="목요일";
					else if(week==5)
						day="금요일";
					
					String start_hour = rs.getString(6);
					if(start_hour.length()<4)
						start_hour = "0"+rs.getString(6).substring(0,1)+"시"+rs.getString(6).substring(1)+"분";
					else
						start_hour = rs.getString(6).substring(0,2)+"시"+rs.getString(6).substring(2)+"분"; //substring(2):index 2번에서부터 끝까지
					String end_hour = rs.getString(7).substring(0,2)+"시"+rs.getString(7).substring(2)+"분";
				%>
				
					<td><a href="modify.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td> <!-- getString(1): 첫번째 컬럼 -->
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=day %></td>
					<td><%=start_hour %></td>
					<td><%=end_hour %></td>
					<td><a href="delete.jsp?id=<%=rs.getString(1) %>">삭제</a></td>
				</tr>
				<%
				}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();
			if(rs !=null)
				rs.close();
			}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	%>
		</table>
	</article>
</section>
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</body>
</html>