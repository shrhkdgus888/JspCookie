<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//request하여, 쿠키를 받음.
	Cookie[] cookies = request.getCookies();
	//실제쿠키가 존재한다면,
	if(cookies != null && cookies.length > 0){
		//쿠키의 길이만큼 쿠키를 하나씩 꺼냄.
		for(int i = 0; i< cookies.length; i++){
			//cookies의 i번째의 이름이 name(과 같은 속성의 쿠키를 찾아서) 같다면,
			if(cookies[i].getName().equals("name")){
				//"name"이라는 똑같은 이름의 값이 없는 다른 쿠키를 생성하고, 
				Cookie cookie = new Cookie("name", "");
				//유효시간을 0으로 만든다.
				cookie.setMaxAge(0);
				//해당하는 유효시간 0인 쿠키(같은이름의 값만 없는, 삭제된 "name")를 add쿠키로 넣어 브라우저에 응답함.
				response.addCookie(cookie);
			}
		}
	}
	//실제쿠키가 존재한다면,
/* 	if(cookies != null && cookies.length > 0){
		//쿠키의 길이만큼 쿠키를 하나씩 꺼냄.
		for(int i = 0; i< cookies.length; i++){
			//cookies의 i번째의 이름이 age(과 같은 속성의 쿠키를 찾아서) 같다면,
			if(cookies[i].getName().equals("age")){
				//"age"이라는 똑같은 이름의 값이 없는 다른 쿠키를 생성하고, 
				Cookie cookie = new Cookie("age", "");
				//유효시간을 0으로 만든다.
				cookie.setMaxAge(0);
				//해당하는 유효시간 0인 쿠키(같은이름의 값만 없는, 삭제된 "age")를 add쿠키로 넣어 브라우저에 응답함.
				response.addCookie(cookie);
			}
		}
	} */
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 삭제</title>
</head>
<body>
쿠키가 삭제되었습니다.
</body>
</html>