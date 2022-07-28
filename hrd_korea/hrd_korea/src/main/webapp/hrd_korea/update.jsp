<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DBPKG.DBCon, java.sql.*"%>
    <%
    request.setCharacterEncoding("UTF-8");
    String userid = request.getParameter("id");
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
	String date=null;
    try{
    	con = DBCon.getConnection();
    	String sql = "select * from tbl_course where id=?";
    	pstmt = con.prepareStatement(sql);
    	pstmt.setString(1,userid);
    	rs = pstmt.executeQuery();
    	
    	String name = rs.getString("name");
    	int credit = rs.getInt("credit");
    	int lecturer = rs.getInt("lecuturer");
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
    	
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{display:flex; justify-content:center; align-items:center;}
table, th, td{border:1px solid black; border-collapse:collapse; width:500px;}
</style>
</head>
<body>
<header>
<jsp:include page="header.jsp"/>
</header>
<section>
	<article>
		<h3>교과목 수정</h3>
		<form action="" method="post" name="">
		
		<table>
			<tr>
				<th>과목코드</th>
				<td><input type="text" value="<%=userid%>"></td>
			</tr>
			<tr>
				<th>과목명</th>
				<td><input type="text" value="<%=name%>"></td>
			</tr>
			<tr>
				<th>학점</th>
				<td><input type="text" value="<%=credit%>"></td>
			</tr>
			<tr>
				<th>담당강사</th>
				<td><select>
					<option>담당강사선택</option>
					<option value="1">김교수</option>
					<option value="2">이교수</option>
					<option value="3">박교수</option>
					<option value="4">우교수</option>
					<option value="5">최교수</option>
					<option value="6">임교수</option>
				</select></td>
			</tr>
			<tr>
				<th>요일</th>
				<td>
				<input type="radio" id="mon" name="date">월
				<input type="radio" id="tue" name="date">화
				<input type="radio" id="wed" name="date">수
				<input type="radio" id="thu" name="date">목
				<input type="radio" id="fri" name="date">금				
				</td>
			</tr>
			<tr>
				<th>시작시간</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>종료시간</th>
				<td><input type="text"></td>
			</tr>
<%
    }catch(Exception e){
    	
    }
%>
			<tr style="text-align:center">
				<td colspan="2"><button>수정</button>&emsp;<button>취소</button></td>
			</tr>
		</table>
		</form>
	</article>
</section>
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</body>
</html>