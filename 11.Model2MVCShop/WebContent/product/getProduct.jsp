<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%--<%@ page import="com.model2.mvc.service.domain.*" %>
    
 <%
	Product productVO = (Product)request.getAttribute("productVO");
 	User user = (User)session.getAttribute("user");
 	System.out.println(user);
 
%>	 --%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	<meta property="og:url"           content="/product/getProduct?prodNo=${productVO.prodNo}&menu=search" />
 	<meta property="og:type"          content="article" />
  	<meta property="og:title"         content="Model2 MVC Shop" />
  	<meta property="og:description"   content="모듈화된 프리미엄 최고급 온라인 샵, 차별화된 서비스를 만나세요." />
  	<meta property="og:image"         content="/images/uploadFiles/${productVO.fileName.trim()}" />
  	<meta property="fb:app_id" content="157517288201485"/>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
     
	<script type="text/javascript">
		
		//==> 추가된부분 : "수정" "확인"  Event 연결 및 처리
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "#buy" ).on("click" , function() {

				 self.location = "/purchase/addPurchase?prodNo=${productVO.prodNo}&userId=${user.userId}";
			 });
			
			 $( "#back" ).on("click" , function() {
				 history.go(-1);
			});
			 
			 $( "#ok" ).on("click" , function() {
				 self.location = "/product/listProduct?menu=manage";
			});
		});
		
		(function(d, s, id) {
			  var js, fjs = d.getElementsByTagName(s)[0];
			  if (d.getElementById(id)) return;
			  js = d.createElement(s); js.id = id;
			  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.11&appId=157517288201485';
			  fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
		
		
		
	</script>
<title>상품 상세 정보</title>


</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />


	<div class="container">
	
		<div class="page-header">
		       <h3 class=" text-info">상품상세정보</h3>
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4">${productVO.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${productVO.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>사진</strong></div>
			<div class="col-xs-8 col-md-4"><img src="/images/uploadFiles/${productVO.fileName.trim()}"/></div>
		</div>
		
		<hr/>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${productVO.prodDetail}</div>
		</div>
		
		<hr/>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${productVO.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${productVO.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${productVO.regDate}</div>
		</div>
		
		<hr/>
		
		<div id="fb-root"></div>
		
		<div class="fb-share-button" data-href="/product/getProduct?prodNo=${productVO.prodNo}&menu=search" data-layout="button" data-size="large" data-mobile-iframe="true">
			<a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse">공유하기</a>
		</div>

	<div class="row">
	  		<div class="col-md-12 text-center ">
				<c:if test = "${param.menu=='manage'}">						
					<button type="button" class="btn btn-primary" id="ok">확인</button>
				</c:if>
				
				<c:if test = "${param.menu=='search'}">	
					<button type="button" class="btn btn-primary" id="buy">구매</button>
				</c:if>
					<button type="button" class="btn btn-primary" id="back">이전</button>
			</div>
	</div>
</div>	

</body>
</html>