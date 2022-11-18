<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.example.dao.MemberDAO, com.example.bean.MemberVO"%>
<%@ page import="com.example.dao.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Form</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>

<%
	MemberDAO memberDAO = new MemberDAO();
	String id=request.getParameter("sid");
	MemberVO u= memberDAO.getMember(Integer.parseInt(id));
	request.setAttribute("u", u);

%>

<h1>Edit Form</h1>
<form action="editmember.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="sid" value="<%=Integer.parseInt(id)%>"/>
<table>
	<tr><td>Name:</td><td><input type="text" name="name" value="<%=u.getName()%>"/></td></tr>
	<tr><td>Member Level:</td>
		<td><input type="radio" id="bronze" name="memberLevel" value="1" ${(u.getMemberLevel() == 1) ? "checked" : ""}/>Bronze</td>
		<td><input type="radio" id="silver" name="memberLevel" value="2" ${(u.getMemberLevel() == 2) ? "checked" : ""}/>Silver</td>
		<td><input type="radio" id="gold" name="memberLevel" value="3" ${(u.getMemberLevel() == 3) ? "checked" : ""}/>Gold</td>
		<td><input type="radio" id="platinum" name="memberLevel" value="4" ${(u.getMemberLevel() == 4) ? "checked" : ""}/>Platinum</td>
	</tr>
	<tr><td>ID:</td><td><input type="text" name="id" value="<%=u.getId()%>"/></td></tr>
	<tr><td>Password:</td><td><input type="text" name="password" value="<%=u.getPassword()%>"/></td></tr>
	<tr><td>Email:</td><td><input type="text" name="email" value="<%=u.getEmail()%>"/></td></tr>
	<tr><td>Phone Number:</td><td><input type="text" name="phoneNumber" value="<%=u.getPhoneNumber()%>"/></td></tr>
	<tr>
		<td>Image:</td>
		<td>
			<input type="file" name="photo" value="${u.getFilename()}"/>
			<c:if text="${u.getFilename() ne ''}">
				<br>
				<img src="${pageContext.request.contextPath}/upload/${u.getFilename()}" width="100" height="100" class="photo"/>
			</c:if>
		</td>
	</tr>
	<tr>
		<td><input type="button" value="Cancel" class="btn btn-warning" onclick="history.back()"/></td>
		<td><input type="submit" value="Edit Post" class="btn btn-success"/></td>
	</tr>
</table>
</form>

</body>
</html>