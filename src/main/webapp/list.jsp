<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.example.dao.MemberDAO, com.example.bean.MemberVO,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>free board</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
        #list {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        #list tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #list tr:hover {
            background-color: #ddd;
        }

        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #ff923c;
            color: white;
        }
    </style>
    <script>
        function delete_ok(sid) {
            var a = confirm("정말로 삭제하겠습니까?");
            if (a) location.href = 'deletemember.jsp?sid=' + sid;
        }
    </script>
</head>
<body>
<h1>멤버 목록</h1>
<%
    MemberDAO memberDAO = new MemberDAO();
    List<MemberVO> list = memberDAO.getMemberList();
    request.setAttribute("list", list);
%>
<table id="list" width="90%">
    <tr>
        <th>SID</th>
        <th>Image</th>
        <th>Name</th>
        <th>Member Level</th>
        <th>ID</th>
        <th>Password</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th>RegDate</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${list}" var="u">
        <c:set var="sid" value="${u.sid}"/>
        <c:set var="name" value="${u.name}"/>
        <c:choose>
            <c:when test="${u.memberLevel == 1}">
                <c:set var="memberLevel" value="Bronze"/>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${u.memberLevel == 2}">
                        <c:set var="memberLevel" value="Silver"/>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${u.memberLevel == 3}">
                                <c:set var="memberLevel" value="Gold"/>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${u.memberLevel == 4}">
                                        <c:set var="memberLevel" value="Platinum"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="memberLevel" value="Bronze"/>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
        <c:set var="id" value="${u.id}"/>
        <c:set var="password" value="${u.password}"/>
        <c:set var="email" value="${u.email}"/>
        <c:set var="phoneNumber" value="${u.phoneNumber}"/>
        <c:set var="regDate" value="${u.regDate}"/>
        <c:set var="filename" value="${u.filename}"/>

        <tr>
            <td>${sid}</td>
            <td><img src="${pageContext.request.contextPath}/upload/${filename}" width="100px"></td>
            <td>${name}</td>
            <td>${memberLevel}</td>
            <td>${id}</td>
            <td>${password}</td>
            <td>${email}</td>
            <td>${phoneNumber}</td>
            <td><fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd"/></td>
            <td><a href="editform.jsp?sid=${sid}" class="btn btn-success">Edit</a></td>
            <td><a href="javascript:delete_ok('${sid}')" class="btn btn-danger">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br/><a href="addmemberform.jsp" class="btn btn-primary">Add New Post</a>
</body>

</html>

