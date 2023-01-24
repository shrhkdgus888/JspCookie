<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
<!-- 어떤계정으로 로그인 성공되었는지 보여줌. -->
<%=session.getAttribute("loginId") %> 계정로그인 성공!
<a href="logout.jsp"><button>로그아웃</button></a>
</body>
</html>