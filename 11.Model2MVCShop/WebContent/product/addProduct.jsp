<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%--<%@ page import="com.model2.mvc.service.domain.*" %>
    
 <%
	Product productVO = (Product)request.getAttribute("productVO");
	String menu = (String)request.getParameter("menu");
%>	--%>
<!DOCTYPE html>
<html>
<head>

<title>상품 등록 내역</title>

<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
	
	<script type="text/javascript">
	
	$(function() {
		 $( "td.ct_btn00:contains('확인')" ).on("click" , function() {
			 self.location = "/product/listProduct?menu=manage";
		});
		
		 $( "td.ct_btn01:contains('추가등록')" ).on("click" , function() {
				self.location = "/product/addProductView.jsp;"
			});
	});
	
	</script>
</head>
<body>

<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
<div class="container">


		<div class="page-header text-center">
			<h3 class=" text-info">상품 등록 내역</h3>
			<h5 class="text-muted">입력한  상품의 내용을<strong class="text-danger">꼼꼼히</strong>확인해 주세요.</h5>
	    </div>

	<form name="detailForm" method="post" class="form-horizontal">
	
	<div class="form-group">
		 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="prodName" name="prodName" value="${productVO.prodName}"  placeholder="상품명"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div> 
	
	<div class="form-group">
		 <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${productVO.prodDetail}" placeholder="상품상세정보"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div> 
			
	<div class="form-group">
		 <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="manuDate" name="manuDate" value="${productVO.manuDate}" placeholder="제조일자"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>	
			
	<div class="form-group">
		 <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="price" name="price" value="${productVO.price}" placeholder="가격"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>	
	
	<div class="form-group">
		 <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		   <div class="col-sm-4">
		    <!-- <input type="text" class="form-control" id="fileName" name="fileName"  placeholder="상품이미지"  >-->
			 <img src="/images/uploadFiles/${productVO.fileName.trim()}"/>
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>
			
			

	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >확 &nbsp;인</button>
			  <button type="button" class="btn btn-primary"  >추가등록</button>
		    </div>
	</div>

</form>
</div>
	<!--  화면구성 div end /////////////////////////////////////-->
</body>
</html>