<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 쿠키를 수정함 = 동일한 이름의 쿠키값을 변경해줌.
   → 동일한 이름으로 여러개의 쿠키가 저장될 수 없다. -->
<%
	//request하여, 쿠키를 받음.
	Cookie[] cookies = request.getCookies();
	//실제 쿠키가 존재한다면,
	if(cookies != null && cookies.length > 0){
		//쿠키의 길이만큼 쿠키를 하나씩 꺼냄.
		for(int i = 0; i< cookies.length; i++){
			//cookies의 i번째의 이름이 name(과 같은 속성의 쿠키를 찾아서) 같다면,
			if(cookies[i].getName().equals("name")){
				//"name"이라는 똑같은 이름의 값만 다른 쿠키를 생성하고, 
				Cookie cookie = new Cookie("name", "KKA");
				//해당하는 쿠키(같은이름의 값만 다른 "name")를 add쿠키로 넣어 브라우저에 응답함.
				response.addCookie(cookie);
			}
		
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 수정</title>
</head>
<body>
쿠키가 수정되었습니다.
</body>
</html>