<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import="DBPKG.DBCon, java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{display:flex; justify-content:center; align-items:center;}
table, th, td{border:1px solid black; border-collapse:collapse; width:500px;}
</style>
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<header>
<jsp:include page="header.jsp"/>
</header>
<section>
<article>
<h3>교과목 수정</h3>
		<form action="modifyProc.jsp" method="post" name="frm">
		<table>
			<%
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try{
				con = DBCon.getConnection();
				String sql="select * from tbl_course where id=" + id;
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					String start_hour = rs.getString(6);
					if(start_hour.length()<4){
						start_hour = "0" + start_hour;
					}

				%>
				<tr>
					<th>과목코드</th>
					<td><input name="id" value="<%=rs.getString(1) %>"></td>  <!-- id라고만 적어도 됨 -->
				</tr>
				<tr>
					<th>과목명</th>
					<td><input name="name" value="<%=rs.getString(2)%>"></td>
				</tr>
				<tr>
					<th>학점</th>
					<td><input name="credit" value="<%=rs.getString(3)%>"></td>
				</tr>
				<tr>
					<th>담당강사</th>
					<td>
					<select>
						<option value="1"<%if(rs.getString(4).equals("1")) out.print("selected"); %>>김교수</option><!-- if문이 참이면 <selected:선택된채로 보여줘>를 프린트, rs.getInt(4)==1로 숫자형으로 사용가능 -->
						<option value="2"<%if(rs.getString(4).equals("2")) out.print("selected"); %>>이교수</option>
						<option value="3"<%if(rs.getString(4).equals("3")) out.print("selected"); %>>박교수</option>
						<option value="4"<%if(rs.getString(4).equals("4")) out.print("selected"); %>>우교수</option>
						<option value="5"<%if(rs.getString(4).equals("5")) out.print("selected"); %>>최교수</option>
						<option value="6"<%if(rs.getString(4).equals("6")) out.print("selected"); %>>임교수</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>요일</th>
					<td>
						<input type="radio" name="week" value="1" <%if(rs.getInt(5)==1) out.print("checked"); %>>월 &ensp;
						<input type="radio" name="week" value="2" <%if(rs.getInt(5)==2) out.print("checked"); %>>화 &ensp;
						<input type="radio" name="week" value="3" <%if(rs.getInt(5)==3) out.print("checked"); %>>수 &ensp;
						<input type="radio" name="week" value="4" <%if(rs.getInt(5)==4) out.print("checked"); %>>목 &ensp;
						<input type="radio" name="week" value="5" <%if(rs.getInt(5)==5) out.print("checked"); %>>금				
					</td>
				</tr>
				<tr>
					<th>시작시간</th>
					<td><input name="start_hour" value="<%=start_hour %>"></td>
				</tr>
				<tr>
					<th>종료시간</th>
					<td><input name="end_hour" value="<%=rs.getString(7)%>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정">
						<!-- <input type="reset" value="취소"> -->
						<input type="button" value="취소" onClick="fun_reset()">
					</td>
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
					if(rs != null)
						rs.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
				%>	
		
		</table>
		</form>
</article>
</section>
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</body>
</html>