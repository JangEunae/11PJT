<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="">
    <meta name="author" content="">
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <link href="carousel.css" rel="stylesheet">
   <link href="cover.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
    
    
        body {
            color: #fff;
  			text-align: center;
  			text-shadow: 0 1px 3px rgba(0,0,0,.5);
       		 }
   	
   		html, body {
   			height: 100%;
    		background-image: url("/images/shutter.jpg");
    		background-size: cover;
    		}
    			
    	.site-wrapper {
			display: table;
			width: 100%;
			height: 100%; /* For at least Firefox */
			min-height: 100%;
			-webkit-box-shadow: inset 0 0 100px rgba(0,0,0,.5);
			box-shadow: inset 0 0 100px rgba(0,0,0,.5);
			}
		.site-wrapper-inner {
			display: table-cell;
			vertical-align: top;
			}
   		
   		.cover-container {
			margin-right: auto;
			margin-left: auto;
			}

			/* Padding for spacing */
		.inner {
			padding: 30px;
			}
		.cover {
		 	 padding: 0 20px;
			}
		.cover .btn-lg {
			  padding: 10px 20px;
			  font-weight: bold;
			}
		@media (min-width: 768px) {
		  /* Pull out the header and footer */
		  .masthead {
			    position: fixed;
			    top: 0;
			  }
		  .mastfoot {
			    position: fixed;
			    bottom: 0;
			  }
			  /* Start the vertical centering */
		  .site-wrapper-inner {
			    vertical-align: middle;
			  }
		  /* Handle the widths */
		  .masthead,
		  .mastfoot,
		  .cover-container {
			    width: 100%; /* Must be percentage or pixels for horizontal alignment */
			  }
			}
		
		@media (min-width: 992px) {
		  .masthead,
		  .mastfoot,
		  .cover-container {
			    width: 700px;
			  }
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
   
   	<!-- <div class="container">
	
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
	     
	<ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="/images/234.JPG" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
             <h1><b>Model2 MVC Shop</b></h1>
              <p><b>모듈화된 프리미엄 최고급 온라인 샵, 차별화된 서비스를 만나세요.</b></p>
	          <p><button class="btn btn-lg btn-primary"  role="button" id="go01">상품보러가기</button></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="/images/3423.JPG" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1><b>내가 만든 온라인 샵 </b></h1>
	            <p><b>지상 최대 온라인 샵, 그것은 장은애가 만든 쇼핑몰이지</b></p>
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
	
	
</div>-->



<div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="inner cover">
            <h1 class="cover-heading"><b>Model2 MVC Shop</b></h1>
            <p class="lead"><b>모듈화된 프리미엄 최고급 온라인 샵, 차별화된 서비스를 만나세요.</b></p>
              <p><button class="btn btn-lg btn-default"  role="button" id="go01">상품보러가기</button></p>
          </div>

          <div class="mastfoot">
            <div class="inner">
              <p>Cover template for <a href="http://getbootstrap.com">JangEunae</a>, by <a href="https://twitter.com/mdo">@eunae</a>.</p>
            </div>
          </div>

        </div>

      </div>

    </div>


</body>

</html>