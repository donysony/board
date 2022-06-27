<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body bgcolor="#f0f4c3">
<form method="post" action="boardPost" name = "postFrm" enctype="multipart/form-data">
<table align="center">
<tr><td colspan="2" bgcolor="#bdc192" text-align="center"><h4>글쓰기</h4></td></tr>

<!-- name에 들어가는 명이 bean에 들어가는 명과 동일해야함 -->
<tr>
	<td width="15%">성명</td>
	<td widht="85%"><input name ="name"></td>
</tr>
<tr>
	<td>제목 </td>
	<td><input name = "subject" ></td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea name="content" cols="50" rows="10"></textarea></td>
</tr>
<tr>
	<td>비밀번호 </td>
	<td><input type="password" name="pass"></td>
</tr>
<tr>
	<td>파일찾기 </td>
	<td><input type="file" name ="filename"></td>
</tr>

<tr>
	<td colspan="2"><hr/></td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit"  value="등록"> &nbsp;
		<input type="reset" value="다시쓰기"> &nbsp;
		<input type="button" value="리스트" onClick="location.href='list.jsp'"> &nbsp;
	</td>
</tr>

</table>

<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">

</form>








</body>
</html>