<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판</title>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/notice_list.css">
</head>
<body>
<section>
    <h1>NOTICE</h1>
    <script>
	    /* $(function(){
	        $("#s_word").on("keyup",function(event){
		        if(key.keyCode==13) {
		        	//event.preventDefault();
		            alert("엔터키 이벤트가 실행되었습니다.");
		        }
		    });
	    }); */
 
      
      function searchBtn(){
    	    if($("#s_word").val().length<2){
    		   alert("2글자 이상 입력하셔야 합니다.");
    		   $("#s_word").focus();  // s_word에 커서를 조정시켜줌
    		   return false;
    	   }
    	    search.submit();  // 서버로 폼을 제출함 (검색요청이 이루어지는)
       }
    </script>
    <div class="wrapper">
      
      <!-- 검색 기능 -->
      <form action="/board/boardList" name="search" method="post">
        <select name="category" id="category">
        
        <!-- 카테고리 정렬  -->
          <option value="all">전체</option>
          <option value="btitle">제목</option>
          <option value="bcontent">내용</option>
        </select>
		
		<!-- 검색할 내용 -->
        <div class="title">
          <input type="text" style="display: none">
          <input type="text" name="s_word" id="s_word" value="${s_word}" size="16">
        </div>  	
  		<!-- 클릭 버튼 -->
  		<!-- 클래스명 = 아이콘 이미지 -->
        <button type="button" onclick="searchBtn()" ><i class="fas fa-search"></i></button>
      </form>
    </div>

    <table>
      <colgroup>
        <col width="15%">
        <col width="40%">
        <col width="15%">
        <col width="15%">
        <col width="15%">
      </colgroup>
      <!-- 제목부분 -->
      <tr>
        <th>No.</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
      
      <!-- 게시판 형태 -->
      <c:forEach var="board" items="${list}"> <!-- 리스트에 저장된 데이터 목록을 반복함 -->
      <tr>
        <td><span class="table-notice">${board.bno}</span></td>
        <td class="table-title">
        <!-- 내용 // 답글 다는 부분 구현 덜 됨 -->
        <c:forEach begin="1" end="${board.bindent}" step="1" > <!-- 시작,끝이 있는 포문 -->
           <img src="/images/icon_reply.png"> 
        </c:forEach>
        <!-- 내용 - 하이퍼 링크  -->
           <a href="boardView?bno=${board.bno}&page=${page}&category=${category}&s_word=${s_word}">${board.btitle}</a>
        </td>
        <!-- 작성자 -->
        <td>${board.id}</td>
        <!-- 작성일 -->
        <td>
          <fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd"/>
        </td>
        <td>${board.bhit}</td>
      </tr>
      </c:forEach>
      
    </table>

    <ul class="page-num">

<!-- 페이지 위치에 따라 링크가 없는걸 구현해야 함 ->if문으로 하이퍼링크 있고 없고 구현 -->    
    
      <!-- 첫페이지 이동 -->
      <c:if test="${page != 1 }">
	      <a href="/board/boardList?page=1&category=${category}&s_word=${s_word}"><li class="first"></li></a>
      </c:if>
      <c:if test="${page == 1 }">
	      <li class="first"></li>
      </c:if>
      <!-- 이전페이지 이동 -->
      <c:if test="${page>1}">
      <a href="/board/boardList?page=${page-1}&category=${category}&s_word=${s_word}"><li class="prev"></li></a>
      </c:if>
      <c:if test="${page==1}">
         <li class="prev"></li>
      </c:if>
      <!-- 페이지리스트 -->
      <c:forEach begin="${startPage}" end="${endPage}" step="1" var="num">
        <c:if test="${num != page }">
	        <a href="/board/boardList?page=${num}&category=${category}&s_word=${s_word}">
	           <li class="num"><div>${num}</div></li>
	        </a>
        </c:if>
        <c:if test="${num == page }">
            <li class="num on"><div>${num}</div></li>
        </c:if>
      </c:forEach>
      <!-- 다음페이지 이동 -->
      <c:if test="${page<maxPage}">
        <a href="/board/boardList?page=${page+1}&category=${category}&s_word=${s_word}"><li class="next"></li></a>
      </c:if>
      <c:if test="${page==maxPage }">
        <li class="next"></li>
      </c:if>
      <!-- 끝페이지 이동 -->
      <c:if test="${page != maxPage }">
	      <a href="/board/boardList?page=${maxPage}&category=${category}&s_word=${s_word}">
	        <li class="last"></li>
	      </a>
      </c:if>
      <c:if test="${page == maxPage }">
	      <li class="last"></li>
      </c:if>
    </ul>

    <a href="/board/boardWrite"><div class="write">쓰기</div></a>
  </section>

</body>
</html>