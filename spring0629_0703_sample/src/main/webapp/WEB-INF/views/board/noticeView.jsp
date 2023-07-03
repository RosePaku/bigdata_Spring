<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<title> JARDIN SHOP </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 날짜 포맷함수 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/top_navi.js"></script>
<script type="text/javascript" src="../js/left_navi.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>

</head>

<body>

<div id="allwrap">
<div id="wrap">

	<!-- top.jsp -->
	<%@ include file="../top.jsp" %>

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">CUSTOMER</a></li>
				<li class="last">NOTICE</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">CUSTOMER<span>고객센터</span></div>
				<ul>	
					<li><a href="#" id="leftNavi1">NOTICE</a></li>
					<li><a href="#" id="leftNavi2">1:1문의</a></li>
					<li><a href="#" id="leftNavi3">FAQ</span></a></li>
					<li class="last"><a href="#" id="leftNavi4">이용안내</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(1,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>NOTICE</strong><span>쟈뎅샵 소식을 전해드립니다.</span></h2>
					
					<div class="viewDivMt">
						<div class="viewHead">
							<div class="subject">
								<ul>
									<li>${bdto.btitle}</li>
								</ul>
							</div>
							<div class="day">
								<p class="txt">작성자<span>${bdto.id}</span></p>
								<p class="txt">작성일<span>
								 <fmt:formatDate value="${bdto.bdate}" pattern="yyyy-MM-dd"  /> 
								</span></p>
								<p class="txt">조회수<span>${bdto.bhit}</span></p>
							</div>
						</div>

						<div class="viewContents">
						    <div>
						    ${bdto.bcontent }
						    </div>
						    <br>
							<img src="../images/${bdto.bfile }" style="width:100%;" alt="" />
						</div>
					</div>


					<!-- 이전다음글 -->
					<div class="pnDiv web">
						<table summary="이전다음글을 선택하여 보실 수 있습니다." class="preNext" border="1" cellspacing="0">
							<caption>이전다음글</caption>
							<colgroup>
							<col width="100px" />
							<col width="*" />
							<col width="100px" />
							</colgroup>
							<tbody>
								<tr>
									<th class="pre">PREV</th>
									<td><a href="#">상품 재입고는 언제 되나요?</a></td>
									<td>&nbsp;</td>
								</tr>

								<tr>
									<th class="next">NEXT</th>
									<td>다음 글이 없습니다.</td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //이전다음글 -->

                    <script>
                      //1댓글저장
                      function commentBtn(){
                    	  if("${sessionId}"==""){
                    		  alert("로그인을 하셔야 댓글입력이 가능합니다.");
                    		  location.href="/member/login?nowpage=noticeView";
                    		  return false;
                    	  }
                    	  
                    	  if($(".replyType").val().length<3){
                    		  alert("2글자 이상 입력하셔야 등록가능합니다.");
                    		  return false;
                    	  }
                    	  
                    	  alert("댓글 저장합니다.");
                    	  
                    	  //ajax구문
                    	  $.ajax({
                    		  url:"/board/commentInsert",
                    		  type:"post",
                    		  data:{"id":"${sessionId}", //${sessionId}를 사용함.
                    			    "bno":"${bdto.bno}",
                    			    "ccontent":$(".replyType").val(),
                    			    "cpw":$(".replynum").val()  
                    		  },
                    		  success:function(data){
                    			  var dataHtml="";
                    			  alert("댓글 저장 성공");
                    			  //하단댓글 1개 가져오기
                    			  console.log(data);
                    			  //하단에 댓글추가코드
                    			  dataHtml += "<ul id='"+ data.cno +"'>";
                    			  dataHtml += "<li class='name'>"+ data.id +"<span>&nbsp&nbsp[ "+ moment(data.cdate).format("YYYY-MM-DD HH:mm:ss") +" ]</span></li>";
                    			  dataHtml += "<li class='txt'>"+ data.ccontent +"</li>";
                    			  dataHtml += "<li class='btn'>";
                    			  /* dataHtml += "<a href='#' class='rebtn'>수정</a>&nbsp"; */
                    			  dataHtml += "<a onclick=updateBtn("+data.cno+"','"+data.id+"','"+data.cdate+"','"+data.ccontent+"') class='rebtn'>수정</a>"; 
                    			  dataHtml += "<a onclick=deleteBtn("+data.cno+") class='rebtn'>삭제</a>";
                    			  dataHtml += "</li>";
                    			  dataHtml += "</ul>";
                    			  
                    			  $(".replyBox").prepend(dataHtml);  //prepend(위),append(아래),html(모두삭제후 추가)
                    			  
                    			  //글자삭제
                    			  $(".replyType").val("");
                    			  $(".replynum").val("");
                    			  
                    			  //총개수 수정
		                    	  var cnum = Number($("#cnum").text())+1;
		                    	  $("#cnum").text(cnum);
                    			  
                    			  
                    		  },
                    		  error:function(){
                    			  alert("실패");
                    		  }
                    	  });//ajax
                    	  
                      }// 댓글저장 끝-->
                      
                      // <-- 2삭제버튼
                      function deleteBtn(cno){
                    	  if(confirm("댓글을 삭제하시겠습니까?")){
	                    	  $.ajax({
	                    		  url:"/board/commentDelete",
	                    		  type:"post",
	                    		  data:{"cno":cno }, // 댓글번호
	                    		  success:function(data){
	                    			  alert(cno+"번 댓글이 삭제되었습니다.");
	                    			  $("#"+cno).remove();  // 삭제
	                    			  //총개수 수정
			                    	  var cnum = Number($("#cnum").text())-1;
			                    	  $("#cnum").text(cnum);
	                    		  },
	                    		  error:function(){
	                    			  alert("실패");
	                    		  }
	                    	  });//ajax
                    	  }//if
                    	  
                    	  
                      }//삭제버튼 -->
                      
                      
                      //3댓글수정저장
                      function updateSave(cno){
                    	  //alert(cno);
                    	  //alert($("#updateTxt").val());
                    	  //alert($("#updatePw").val());
                    	  
                    	  if(confirm("댓글수정을 저장하시겠습니까?")){
                    		  $.ajax({
                        		  url:"/board/commentUpdateSave",
                        		  type:"post",
                        		  data:{ "cno":cno,
                        			     "cpw":$("#updatePw").val(),
                        			     "ccontent":$("#updateTxt").val() }, 
                        		  success:function(data){
                        			  alert(cno+"번 댓글수정 저장되었습니다.");
                        			  
                        			  var dataHtml="";
                        			  
                        			  //댓글화면 변경
	                    			  dataHtml += "<li class='name'>"+ data.id +"<span>&nbsp&nbsp[ "+ moment(data.cdate).format("YYYY-MM-DD HH:mm:ss") +" ]</span></li>";
	                    			  dataHtml += "<li class='txt'>"+ data.ccontent +"</li>";
	                    			  dataHtml += "<li class='btn'>";
	                    			  dataHtml += "<a href='#' class='rebtn'>수정</a>&nbsp";
	                    			  dataHtml += "<a onclick=deleteBtn("+data.cno+") class='rebtn'>삭제</a>";
	                    			  dataHtml += "</li>";
                        			  
                        			  $("#"+cno).html(dataHtml);
                        			  
                        		  },
                        		  error:function(){
                        			  alert("실패");
                        		  }
                        	  });//ajax
                    	  }//if
                    	  
                    	  
                      }//댓글수정저장
                      
                      // 4댓글수정 폼
                      function updateBtn(cno,id,cdate,ccontent){
                    	  if(confirm("댓글을 수정하시겠습니까?")){
                    		  
                    		 let dataHtml="";
                    		 
                    		 dataHtml += "<li class='name'>"+id+"&nbsp;<span>["+cdate+"]</span>";
                    		 dataHtml += "&nbsp;&nbsp;&nbsp;&nbsp;비밀번호&nbsp;&nbsp;<input type='password' class='replynum' id='updatePw' />";
                    		 dataHtml += "</li>";
                    		 dataHtml += "<li class='txt'>";
                    		 dataHtml += "<textarea class='replyType' id='updateTxt'>"+ccontent+"</textarea>";
                    		 dataHtml += "</li>";
                    		 dataHtml += "<li class='btn'>";
                    		 dataHtml += "<a onclick=updateSave("+cno+")' class='rebtn'>저장</a>&nbsp;";
                    		 dataHtml += "<a onclick=cancelBtn("+cno+"','"+id+"','"+cdate+"','"+ccontent+"')' class='rebtn'>취소</a>";
                    		 dataHtml += "</li>";
  							
                    		 $("#"+cno).html(dataHtml); 
                    		 
                    	  }//if
                      }// 업데이트 -->
                      
                      function cancleBtn(cno){
                    	  alert("댓글 수정 취소하셨습니다.")
                      }
                      
                                           
                      
                    </script>

					<!-- 댓글-->
					<div class="replyWrite">
						<ul>
							<li class="in">
								<p class="txt">총 <span class="orange" id="cnum">${comList.size()}</span> 개의 댓글이 달려있습니다.</p>
								<p class="password">비밀번호&nbsp;&nbsp;<input type="password" class="replynum" /></p>
								<textarea class="replyType"></textarea>
							</li>
							<li class="btn"><a onclick="commentBtn()" class="replyBtn">등록</a></li>
						</ul>
						<p class="ntic">※ 비밀번호를 입력하시면 댓글이 비밀글로 등록 됩니다.</p>
					</div>

					<div class="replyBox">
					    <c:forEach var="comDto" items="${comList }" >
					    <ul id="${comDto.cno}">
							<li class="name">${comDto.id} <span>[ ${comDto.cdate} ]</span></li>
							<%--비밀글 노출 --%>
							<c:if test="${sessionId != comDto.id && comDto.cpw !=null }">
							  <li class="txt">
								<span class="orange">※ 비밀글입니다.</span>
							  </li>
							</c:if>
							<c:if test="${!(sessionId != comDto.id && comDto.cpw !=null) }">
							  <li class="txt">${comDto.ccontent }</li>
							</c:if>
							
							<%-- 자신의 댓글이 아닌경우 버튼노출 안됨 --%>
							<c:if test="${sessionId == comDto.id }">
								<li class="btn">
									<a onclick="updateBtn(${comDto.cno},'${comDto.id }','${comDto.cdate}','${comDto.ccontent}')" class="rebtn">수정</a>
									<a onclick="deleteBtn(${comDto.cno})" class="rebtn">삭제</a>
								</li>
							</c:if>
						</ul>
					    </c:forEach>
					   
					   
					   
					</div>
					<!-- //댓글 -->


					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bRight">
							<ul>
								<li><a href="/board/notice" class="sbtnMini mw">목록</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
					
				</div>
			</div>
			<!-- //contents -->


<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){
	
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 540;
	}else{
		var layerCheck = 320;
	}

	$(".passwordBtn").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : layerCheck,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			});
		}
	});


});
</script>

		</div>
	</div>
	<!-- //container -->

    <!-- //footer.jsp -->
    <%@ include file="../footer.jsp" %>


	



</div>
</div>
</body>
</html>