<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <link href="carousel.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
     <script type="text/javascript">

			$(function() {
				 $( "#go01" ).on("click" , function() {
					 self.location = "/product/listProduct?menu=search";
				});
			});	
			
			$(function() {
				 $( "#go02" ).on("click" , function() {
					 self.location = "/product/listProduct?menu=search";
				});
			});
		</script>
	 	
	
</head>
	
<body>


	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   
   	<div class="container">
	
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
	      <!-- Indicators -->
	<ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="/images/234.JPG" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Model2 MVC Shop</h1>
              <p>모듈화된 프리미엄 최고급 온라인 샵, 차별화된 서비스를 만나세요.</p>
	          <p><button class="btn btn-lg btn-primary"  role="button" id="go01">상품보러가기</button></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="/images/3423.JPG" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>내가 만든 온라인 샵 </h1>
	            <p>지상 최대 온라인 샵, 그것은 장은애가 만든 쇼핑몰이지</p>
	            <p><button class="btn btn-lg btn-primary" role="button" id="go02">상품보러가기</button></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
	</div>
	
	
</div>
</body>

</html>