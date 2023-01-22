<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String checked = "";
	String userid = "";
	//request하여, 쿠키를 받음.
	Cookie[] cookies = request.getCookies();
	//실제 쿠키가 존재한다면,
	if(cookies !=null && cookies.length>0){
		//쿠키의 길이만큼 쿠키를 하나씩 꺼냄.
		for(int i = 0; i< cookies.length; i++){
			//cookies의 i번째의 이름이 remember(와 같은 속성의 쿠키를 찾아서) 같다면,
			//즉, remember이라는 쿠키가 존재한다면
			if(cookies[i].getName().equals("remember")){
				//remember값이 있다면 checked 문자열을 넣어준다.
				//즉, remember이라는 쿠키값이 있다면 체크박스에 체크가 표시 되도록 함
				checked = "checked";
				/* cookies의 i번째의 getValue값을 가져오면 userid를 아래 넣어준다. */
				userid = cookies[i].getValue();
			}
		}
	}

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<!-- submit 전송할 위치 "loginProc.jsp" -->
<form action="loginProc.jsp" method="post">
	<input type="text" name="userid" placeholder="아이디" value="<%=userid%>"><br>
	<input type="password" name="userpw" placeholder="비밀번호"><br>
																   <%-- <%=checked %>값의 여부 --%>	
	아이디 기억하기<input type="checkbox" name="remember" placeholder="chk" <%=checked %>><br>
	<input type="submit" value="로그인"><br>
</form>

</body>
</html>