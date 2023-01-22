<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/* 
	쿠키는 서버에서 생성하고, 브라우저에 응답하여 저장하도록 하는 데이터 조각
	브라우저는 저장된 쿠키를 해당 사이트에 자원 요청 시 항상 포함하여 전송함.
	브라우저가 사이트를 이용하면서 유지할 값이 있다면 사용함.
	
	1. 브라우저에서 서버로 자원을 요청
	2. 서버에서 쿠키 생성 및 응답에 포함
	3. 브라우저는 응답받은 쿠키를 저장소에 저장
	----------------------------------
	4. 해당 사이트로 요청 시 쿠키를 함께 전송
	5. 요청에서 쿠키 정보를 확인
	
	- 쿠키의 구성요소
		이름 : 쿠키 이름
		값 : 이름에 연결된 값
		유효시간 : 초단위 시간(설정하면 해당 시간동안 유지하도록하고 설정하지 않으면 세션이 유지되는 동안(브라우저가 열려있는동안)만 유지됌.)
		도메인 : 쿠키를 생성한 사이트
		경로 : 쿠키를 전송할 요청 URL(일반적으로 최상위경로가 잡혀있다.)
		→ 어떤 URL로 요청할 때, 쿠키를 사용할 것인가?(해당 URL 하위로 경로가 만들어진 모든 곳에는 해당 쿠키를 보내게 되어있다. ) 22:20
*/
	Cookie cookie1 = new Cookie("name", "NGH");
	Cookie cookie2 = new Cookie("age", "31");
	//cookie2는 최상위의 path1라는 경로로 요청할때, 사용해라.(경로=localhost8090/jspcookie/path1/makeCookie.jsp)
	//즉 path경로가 아니면 "name"이라는 쿠키만 전송하고, "age"는 전송하지않음.
	// - 개발자모드>Network>Headers>Response Header>Set-Cookie값에서 확인가능함.
		//쉽게말해서, 경로에 따라 주는 쿠키를 다르게 설정할 수 있다는 뜻인데,
		//	A쿠폰(cookie1="name")은 카페(localhost8090/jspcookie/cookie/-.jsp)에서만 사용 가능하도록하고
		//	B쿠폰(cookie2="age")은 식당(localhost8090/jspcookie/path1/-.jsp)에서만 사용 가능하도록 함.
	cookie2.setPath(request.getContextPath()+"/path1");
	System.out.println("name" + cookie1.getValue());
	System.out.println("age" + cookie2.getValue());
	
	//서버에서 응답하는 내용에 쿠키(cookie1,2)를 추가함.
	response.addCookie(cookie1);
	response.addCookie(cookie2);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 생성</title>
</head>
<body>
쿠키가 생성되었습니다.
</body>
</html>