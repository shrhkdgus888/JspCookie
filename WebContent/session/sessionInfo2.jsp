<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	//세션의 유효 시간 설정(초단위)
	//예를 들어, 10초로 설정해놓으면 10초뒤에 다시 새로운 세션이 생김 ex)은행어플
	//만약 숫자를 음수, 마이너스 값으로 설정해놓으면 유효시간 자체를 사용하지 않기 때문에 메모리에 계속 세션정보가 상주한다.
	session.setMaxInactiveInterval(10);

	//SimpleDateFormat클래스를 이용하여 형식지정
	SimpleDateFormat formatter = 
		new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	//session이 만들어진 날짜, 시간을 보기위해 Date객체 생성함.
	Date creationTime = new Date();
	//브라우저가 서버에 최초로 요청했을 때의 시간이 저장됌. 
	creationTime.setTime(session.getCreationTime()); //세션이 최초로 생성된 시간
	
	Date lastAccessedTime = new Date();
	lastAccessedTime.setTime(session.getLastAccessedTime()); //마지막 접근 시간
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 정보 확인</title>
</head>
<body>
<!-- 브라우저가 서버에 요청시, 자동으로 생성된 세션이고, 그 세션은 Id를 가지고있음. -->
세션ID: <%= session.getId() %><br>
<!-- formatter에다가 너가 가진 format으로 이 시간을 셋팅해서 보여달라. -->
최초 세션 생성 시간: <%= formatter.format(creationTime) %><br>
마지막 접근 시간 : <%= formatter.format(lastAccessedTime) %><br>
</body>
</html>