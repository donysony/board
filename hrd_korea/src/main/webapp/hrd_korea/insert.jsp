<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

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
		<form action="insertProc.jsp" method="post" name="frm">
		<table>
				<tr>
					<th>과목코드</th>
					<td><input name="id"></td> 
				</tr>
				<tr>
					<th>과목명</th>
					<td><input name="name"></td>
				</tr>
				<tr>
					<th>학점</th>
					<td><input name="credit" ></td>
				</tr>
				<tr>
					<th>담당강사</th>
					<td>
					<select name="lecturer">
						<option value="">담당강사선택</option>
						<option value="1">김교수</option>
						<option value="2">이교수</option>
						<option value="3">박교수</option>
						<option value="4">우교수</option>
						<option value="5">최교수</option>
						<option value="6">임교수</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>요일</th>
					<td>
						<input type="radio" name="week" value="1" >월 &ensp;
						<input type="radio" name="week" value="2" >화 &ensp;
						<input type="radio" name="week" value="3" >수 &ensp;
						<input type="radio" name="week" value="4" >목 &ensp;
						<input type="radio" name="week" value="5" >금				
					</td>
				</tr>
				<tr>
					<th>시작시간</th>
					<td><input name="start_hour"></td>
				</tr>
				<tr>
					<th>종료시간</th>
					<td><input name="end_hour"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="추가" onClick="check()">
						<input type="button" value="목록" onClick="location.href='list.jsp'">
					</td>
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