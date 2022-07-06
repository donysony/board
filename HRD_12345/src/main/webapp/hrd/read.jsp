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
<h3 align="center">회원목록조회/수정</h3>
<table border="2">
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주지역</th>
	</tr>
	<%
		ArrayList<MemberBean> vlist = mMgr.getAllList();
		for(int i=0; i<vlist.size(); i++){
			MemberBean bean = vlist.get(i);
			int num = bean.getCustno();
			String name = bean.getCustname();
			String tel = bean.getPhone();
			String addr = bean.getAddress();
			String date = bean.getJoindate().substring(0,10);  //2022-07-06 10:22:11인 것 중에 9번째 위치까지만 가져오시오
			String grade = bean.getGrade();
			String city = bean.getCity();
	%>
	<tr>
		<td><a href = "update.jsp?custno=<%=num %>"><%=num %></a></td>
		<td><%=name %></td>
		<td><%=tel %></td>
		<td><%=addr %></td>
		<td><%=date %></td>
		<td><%=grade %></td>
		<td><%=city %></td>
	</tr>
<%
		}
%>		
</table>
</section>
<jsp:include page ="footer.jsp"></jsp:include>
</body>
</html>