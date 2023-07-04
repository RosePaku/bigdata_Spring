<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	  <h2>게시글등록</h2>
	  <h3>제목 : ${bdto.btitle}</h3>
	  <!-- 파일전체 1개이름  1.jpg,2.jpg,3.jpg,4.jpg,5.jpg -->
	  <h3>파일명 : ${bdto.bfile}</h3>
	  <h3>이미지</h3>
	  <c:forEach var="name" items="${bdto.bfiles }">
	     <h3>${name}</h3>
	  </c:forEach>
	  
	
	</body>
</html>