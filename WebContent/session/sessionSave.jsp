<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//data파라미터를 요청하면
	String data = request.getParameter("data");
	//session에 담아두는 것(세션이 유효한동안 사용가능함.)
	session.setAttribute("saveData", data); //세션에 저장
	
	response.sendRedirect("sessionInfo.jsp");
%>
