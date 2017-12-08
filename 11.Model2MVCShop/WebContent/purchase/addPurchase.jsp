<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%--<%@ page import="com.model2.mvc.service.domain.*" %>
    
 <%
	Product productVO = (Product)request.getAttribute("productVO");
 	User user = (User)session.getAttribute("user");
 	Purchase purchase = (Purchase)request.getAttribute("purchaseVO");
 	
 	
 	
%>	    
    --%>
<!DOCTYPE html>
<html>
<head>
<title>구매 내역 확인</title>

<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
<script type="text/javascript">
function fncAddPuerchase(){
	
	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=search").submit();
}


	$(function() {
		 $( "#ok" ).on("click" , function() {
			 fncAddPuerchase();
		});
	});


		</script>
	</head>
<body>


	<div class="navbar  navbar-default">
        <div class="container">
        	<jsp:include page="/layout/toolbar.jsp" />
   		</div>
   	</div>
   	
   	<div class="container">


		<div class="page-header text-center">
			<h3 class=" text-info">상품 구매 내역</h3>
			<h5 class="text-muted">구매한  상품의 내용을<strong class="text-danger">꼼꼼히</strong>확인해 주세요.</h5>
	    </div>
   	
	<form name="detailForm" method="post" class="form-horizontal">
	
	<div class="form-group">
		 <label for="purchaseProd" class="col-sm-offset-1 col-sm-3 control-label">물품번호</label>
		   <div class="col-sm-4">${purchaseVO.purchaseProd.prodNo}</div>
	</div>
	
	<div class="form-group">
		 <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		   <div class="col-sm-4">${user.userId}</div>
	</div> 
	
	<div class="form-group">
		 <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		   <div class="col-sm-4">
		   <c:if test="${ purchaseVO.paymentOption.trim()=='1'}">
			현금구매 
			</c:if>
			<c:if test="${ purchaseVO.paymentOption.trim()=='2'}">
			현금구매 
		</c:if>
		</div>
	</div> 
			
	<div class="form-group">
		 <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		   <div class="col-sm-4">${purchaseVO.receiverName}</div>
	</div>	
			
	<div class="form-group">
		 <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
		   <div class="col-sm-4">${purchaseVO.receiverPhone}</div>
	</div>
	
	<div class="form-group">
		 <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
		   <div class="col-sm-4">${purchaseVO.divyAddr}</div>
	</div>	
	
	<div class="form-group">
		 <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		   <div class="col-sm-4">${purchaseVO.divyRequest}</div>
	</div>	
	
	<div class="form-group">
		 <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		   <div class="col-sm-4">${purchaseVO.divyDate}</div>
	</div>
	
	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="ok" >확인</button>
		    </div>
	</div>
	</form>
</div>
</body>
</html>