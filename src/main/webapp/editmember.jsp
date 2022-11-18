<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.MemberDAO"%>
<%@ page import="com.example.dao.MemberDAO" %>
<%@ page import="com.example.common.FileUpload" %>
<%@ page import="com.example.bean.MemberVO" %>

<% request.setCharacterEncoding("utf-8"); %>

<%--<jsp:setProperty property="*" name="u"/>--%>

<%
	request.setCharacterEncoding("utf-8");
	MemberDAO memberDAO = new MemberDAO();
	FileUpload upload = new FileUpload();
	MemberVO u = upload.uploadPhoto(request);

	int i= memberDAO.updateMember(u);

	response.sendRedirect("list.jsp");
%>