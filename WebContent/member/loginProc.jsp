<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//1.요청에서 파라미터 가져오기
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	String remember = request.getParameter("remember");
	System.out.println("userid: " + userid);
	System.out.println("userpw: " + userpw);
	System.out.println("remember: " + remember);
	//2.아이디와 비밀번호가 같으면 로그인 성공으로 처리 
		// - 아이디 기억하기 여부에 따라 쿠키를 생성하여 응답을 만들어줌.(1시간 동안만 아이디 기억유지)
	if(userid.equals(userpw)){
		System.out.println("로그인 성공!");
		//아이디 기억하기 존재함.
		if(remember !=null){
			//remember에 userid정보를 넣어줌.
			Cookie rememberCookie = new Cookie("remember", userid);
			//쿠키를 1시간동안 유지함.
			rememberCookie.setMaxAge(60*60);
			response.addCookie(rememberCookie);
			System.out.println("아이디 쿠키 저장");
			//아이디 기억하기 존재하지않음.	
		}else{
			//remember에 userid정보를 넣어줌.
			Cookie rememberCookie = new Cookie("remember", userid);
			//브라우저에서 쿠키가 사라짐.
			rememberCookie.setMaxAge(0);
			response.addCookie(rememberCookie);
			System.out.println("아이디 쿠키 삭제");
		}
		response.sendRedirect("loginSuccess.jsp");
	//3.아이디와 비밀번호가 같지 않으면 다시 로그인 페이지로 감.
	}else{
		System.out.println("로그인 실패!");
		response.sendRedirect("loginForm.jsp");
	}
	
	//로그인 페이지에서 remember쿠키가 존재하면 checkbox를 체크상태로 보여지도록 loginForm.jsp를 수정
	//(쿠키 상태에 따라서 체크박스가 체크된 상태인지 아닌지)
		//기억된 아이디가 userid텍스트 상자에 표시 되어야함.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 여부</title> 
</head>
<body>
</body>
</html>