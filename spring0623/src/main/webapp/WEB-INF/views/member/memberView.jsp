<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>view</title>
	</head>
	<body>
	  <h2>view</h2>
	  <h3>아이디 :${member.id } </h3>
	  <h3>패스워드 :${member.pw } </h3>
	  <h3>이름 : ${member.name }</h3>
	  <h3>전화번호 : ${member.phone }</h3>
	  <h3>성별 : ${member.gender }</h3>
	  <h3>취미 : ${member.hobby }</h3>
	  <button><a href="/member/memberList">회원목록</a></button>
	
	</body>
</html>