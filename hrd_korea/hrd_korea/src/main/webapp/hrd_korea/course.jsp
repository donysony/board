<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.DBCon, java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String date=null;
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;

	try{
		con = DBCon.getConnection();
		String sql = "select * from tbl_course order by id";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		
		
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{display:flex; justify-content:center; align-items:center;}
h3{text-align:center;}
table, th, td{border:1px solid black; border-collapse:collapse}
table{text-align:center;}
section table a{text-decoration:underline;}
</style>
</head>
<body>
<header>
<jsp:include page="header.jsp"></jsp:include>
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
				String id = rs.getString("id");
				String name = rs.getString("name");
				int credit = rs.getInt("credit");
				int lecturer = rs.getInt("lecturer");
				int week = rs.getInt("week");
				switch(week){
				case 1:
					date = "월요일";
					break;
				case 2: 
					date = "화요일";
					break;
				case 3: 
					date = "수요일";
					break;
				case 4:
					date ="목요일";
					break;
				case 5:
					date ="금요일";
					break;
				}
				
				String sql2 = "select name from tbl_lecturer where idx=?";
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setInt(1, lecturer);
				rs2 = pstmt2.executeQuery();
				
				String tname="";
				if(rs2.next()){
					tname = rs2.getString("name");
				}
				int start_hour = rs.getInt("start_hour");
				int end_hour = rs.getInt("end_hour");
				String starthour="";
				String endhour="";
				if(start_hour<1000){
					starthour="0"+start_hour;
				}else
					starthour=Integer.toString(start_hour);
				
				if(end_hour<1000){
					endhour="0"+end_hour;
				}else
					endhour=Integer.toString(end_hour);
				

			%>
			<td><a href="update.jsp?id=<%=id %>"><%=id %></a></td>
			<td><%=name %></td>
			<td><%=credit %></td>
			<td><%=tname %></td>
			<td><%=date %></td>
			<td><%=starthour.substring(0,2)+"시"+starthour.substring(2,4)+"분" %></td>
			<td><%=endhour.substring(0,2)+"시"+endhour.substring(2,4)+"분" %></td>
			<td><a href="">삭제</a></td>
			</tr>

<%
			}

	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(pstmt != null){
				pstmt.close();
			}if(con != null){
				pstmt.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
%>
	</table>
	</article>
</section>
<footer>
<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>