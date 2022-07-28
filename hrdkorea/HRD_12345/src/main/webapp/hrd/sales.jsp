<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hrd.MemberBean, java.util.*" %>
<jsp:useBean id="mMgr" class="hrd.MemberMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page ="header.jsp"></jsp:include>
<section>
<h3 align="center">회원매출조회</h3>
<table align="center" border="1">
	<tr align="center">
		<td>회원목록</td>
		<td>회원성명</td>
		<td>고객등급</td>
		<td>매출</td>
	</tr>
	<%
		ArrayList<MemberBean> vlist = mMgr.getSalesInfo();
		for(int i =0; i<vlist.size(); i++){
			MemberBean bean = vlist.get(i);
			int custno= bean.getCustno();
			String custname = bean.getCustname();
			String grade = bean.getGrade();
			String graRe = "";
			if(grade.equals("A")){
				graRe = "VIP";
			}else if(grade.equals("B")){
				graRe = "일반";
			}else
				graRe = "직원";
			int total = bean.getPrice();
			%>
			<tr>
				<td><%=custno %></td>
				<td><%=custname %></td>
				<td><%=graRe %></td>
				<td><%=total %></td>
			</tr>
			<%
		}
	%>
	
</table>
</section>
<jsp:include page ="footer.jsp"></jsp:include>
</body>
</html>