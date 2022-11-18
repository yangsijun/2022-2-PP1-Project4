<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.MemberDAO, com.example.bean.MemberVO"%>
<%@ page import="com.example.dao.MemberDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.example.common.FileUpload" %>
<%
	String sid = request.getParameter("sid");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		MemberDAO memberDAO = new MemberDAO();

		String filename = memberDAO.getPhotoFilename(id);
		if (filename != null)
			FileUpload.deleteFile(request, filename);

		memberDAO.deleteMember(id);
	}
	response.sendRedirect("list.jsp");
%>