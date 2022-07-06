<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hrd.MemberBean" %>
<jsp:useBean id="mMgr" class="hrd.MemberMgr"/>
<%
	request.setCharacterEncoding("UTF-8");
	int custno = Integer.parseInt(request.getParameter("custno"));
	MemberBean bean = mMgr.getMember(custno);
	String name = bean.getCustname();
	String tel = bean.getPhone();
	String addr = bean.getAddress();
	String date = bean.getJoindate().substring(0,10);
	String grade = bean.getGrade();
	String city = bean.getCity();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script.js" charset="UTF-8"></script>

</head>
<body>
<jsp:include page ="header.jsp"></jsp:include>
<section>
<h3 align="center">홈쇼핑 회원 등록</h3>
<form method="post" name="regFrm" action="updateProc.jsp">

<table align="center" width="550px" border=2>
	<tr>
		<td>회원번호(자동발생)</td>
		<td><input name="custno" readonly value="<%=custno %>"></td> <!-- 사용자가 값을 입력하지 않도록/ 현재 가장 큰 값인 num값에서 +1한값 -->
	</tr>
	<tr>
		<td>회원성명</td>
		<td><input name="custname" value="<%=name%>"></td>
	</tr>
	<tr>
		<td>회원전화</td>
		<td><input name="phone" value="<%=tel %>"></td>
	</tr>
	<tr>
		<td>회원주소</td>
		<td><input name="address" value="<%=addr%>"></td>
	</tr>
	<tr>
		<td>가입일자</td>
		<td><input name="joindate" placeholder="20220705" value="<%=date%>"></td>
	</tr>
	<tr>
		<td>고객등급[A:VIP, B:일반, C:직원]</td>
		<td><input name="grade" value="<%=grade %>"></td>
	</tr>
	<tr>
		<td>도시코드</td>
		<td><input name="city" value="<%=city %>"></td>
	</tr>
	<tr>
	<td colspan="2">
		<input type="submit" value="수정" > &emsp;
		<input type="button" value="조회" onClick="location.href='read.jsp'">
	</td>
	</tr>

</table>


</form>
</section>
<jsp:include page ="footer.jsp"></jsp:include>
</body>
</html>