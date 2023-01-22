<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 목록</title>
</head>
<body>
<!-- 쿠키는 서버에서 만들고 브라우저에 저장해놓고 서버에 요청할때(서버가 브라우저에 줄 때) 포함하여 보내게 되어있다. -->
<h2>쿠키 목록</h2>
<!-- 브라우저가 가진 쿠키배열(여러개, 복수)을 서버에서 확인하는 방법 -->
	<!-- request를 통해 확인할 수 있다. 서버에 요청할때 포함되어있기 때문에 -->
<%
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies){
%>
		<!-- 값 출력 -->
		<%= cookie.getName()%> : <%=cookie.getValue() %><br>
<% } %>

</body>
</html>