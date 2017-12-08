<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%--    
<%@page import="com.model2.mvc.service.domain.*" %>

<%
	Product productVO = (Product)request.getAttribute("productVO");
	Purchase purchase = (Purchase)request.getAttribute("purchaseVO");
%>

<%
	User userVO = (User)request.getAttribute("userVO");

%> --%>
<!DOCTYPE html>
<html  lang="ko">
<head>
<title>상품 상세 조회</title>
<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
<script type="text/javascript">

function fncAddPurchase() {
	//document.addPurchase.submit();
	$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
}

$(function() {
	 $( "#buy" ).on("click" , function() {
		 fncAddPurchase();
	});
});	

$(function() {
	 $( "#back" ).on("click" , function() {
		 javascript:history.go(-1);
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
			<h3 class=" text-info">상품 구매 </h3>
	</div>   	

<form name="detailForm" class="form-horizontal" >
	<input type="hidden" name="tranCode" value="0"/>
	<input type="hidden" name="prodNo" value="${productVO.prodNo}" />
	<input type="hidden" name="userId" value="${userVO.userId}" />
	
	
	<div class="form-group">
		 <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">물품번호</label>
		   <div class="col-sm-4">${productVO.prodNo}</div>
	</div>
	
	<div class="form-group">
		 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">물품명</label>
		   <div class="col-sm-4">${productVO.prodName}</div>
	</div>
	
	<div class="form-group">
		 <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		   <div class="col-sm-4">${productVO.prodDetail}</div>
	</div>
	
	<div class="form-group">
		 <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		   <div class="col-sm-4">${productVO.manuDate}</div>
	</div>
	
	<div class="form-group">
		 <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		   <div class="col-sm-4">${productVO.price}</div>
	</div>
	
	<div class="form-group">
		 <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
		   <div class="col-sm-4">${productVO.regDate}</div>
	</div>
	
	<div class="form-group">
		 <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		   <div class="col-sm-4">${userVO.userId}</div>
	</div>
	
	<div class="form-group">
		 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		   <div class="col-sm-4">
		    <select name="paymentOption" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20">
		    	<option value="1" selected="selected">현금구매</option>
				<option value="2">신용구매</option>
			</select>
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>

	<div class="form-group">
		 <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="receiverName" name="receiverName" value="${userVO.userName}" placeholder="구매자이름"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>
	
	<div class="form-group">
		 <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${userVO.phone}" placeholder="구매자연락처"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>
	
	<div class="form-group">
		 <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${userVO.addr}" placeholder="구매자주소"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>
	
	<div class="form-group">
		 <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="divyRequest" name="divyRequest"  placeholder="구매요청사항"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>
	
	<div class="form-group">
		 <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="divyDate" name="divyDate"  placeholder="배송희망일자" readonly="readonly" >
			 <img src="../images/ct_icon_date.gif" width="15" height="15" 
										onclick="show_calendar('document.detailForm.divyDate', document.detailForm.divyDate.value)"/>
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>
	
	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="buy" >구매</button>
		      <button type="button" class="btn btn-primary" id="back" >취소</button>
		    </div>
	</div>


	</form>
</div>
</body>
</html>