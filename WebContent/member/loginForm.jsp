<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//로그인 아이디 값이 있는지 확인한다
	//Why? 로그인 성공한 상태에서 loginForm.jsp페이지로 넘어가면 다시 로그인 화면 폼이 뜨는것을 방지하기 위함.
			//형변환 필요(getAttribute는 이름(String name)을 가지고 연결된 객체(Object)를 반환한다.)
			
	//※ 세션 확인방법
 		//1. loginForm.jsp에서 로그인 성공을 시켜, loginSuccess.jsp로 이동
		//2. loginSuccess.jsp에서 다시 loginForm.jsp로 이동하면 이미 로그인되어있는 상태이기 때문에
		//   로그인 폼 화면이 나오지 않음.
 
	String loginId = (String)session.getAttribute("loginId");
	if(loginId != null){
		System.out.println("로그인 되어 있는 상태");
		response.sendRedirect("loginSuccess.jsp");
	}else
		//loginId값이 null값이면(로그인된 상태라면) 아래 로그인 폼을 보여준다.
	{
		
	
	String checked = "";
	String userid = "";
	//request하여, 쿠키를 받음.
	Cookie[] cookies = request.getCookies();
	//실제 쿠키가 존재한다면,
	if(cookies !=null && cookies.length>0){
		//쿠키의 길이만큼 쿠키를 하나씩 꺼냄.
		for(int i = 0; i< cookies.length; i++){
			//cookies의 i번째의 이름이 remember(와 같은 속성의 쿠키를 찾아서) 같다면,
			//즉, remember이라는 쿠키가 존재한다면(=로그인 성공했다면)
			if(cookies[i].getName().equals("remember")){
				//remember값이 있다면 checked 문자열을 넣어준다.
				//즉, remember이라는 쿠키값이 있다면 체크박스에 체크가 표시 되도록 함
				checked = "checked";
				//cookies의 i번째의 getValue값을 가져오면 userid를 아래 넣어준다.
				//(loginProc.jsp에서 로그인 성공시 remember 값을 userid에 넣어주기 때문에)
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
<% } %>