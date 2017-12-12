<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%--    
<%@ page import="com.model2.mvc.service.domain.*" %>
    
<%

	Purchase purchase = (Purchase)request.getAttribute("purchaseVO");
	
	
%> --%>
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
		<script type="text/javascript" src="../javascript/calendar.js"></script>
		
		<script type="text/javascript">

			function fncUpdatePuerchase(){
				
				$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase?tranNo=${purchaseVO.tranNo}").submit();
			}
			
			$(function() {
				 $( "#rewrite" ).on("click" , function() {
					 fncUpdatePuerchase();
				});
			});	
			
			$(function() {
				 $( "#back" ).on("click" , function() {
					 history.go(-1)
				});
			});
		</script>
	<title>구매정보 수정</title>

</head>

<body>

	<div class="navbar  navbar-default">
        <div class="container">
        	<jsp:include page="/layout/toolbar.jsp" />
   		</div>
   	</div>
   	
   	<div class="container">
	
		<div class="page-header text-center">
		       <h3 class=" text-info">구매정보수정</h3>
		       <h5 class="text-muted">구매 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
		</div>
   	
		<form name="updatePurchase" class="form-horizontal" >
			<input type="hidden" name="buyerId" value="${purchaseVO.buyer.userId}">
			
		<div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">${purchaseVO.buyer.userId}</div>
		 </div>
		 
		 
		 <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">
		    <select name="paymentOption" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20">
			    <c:if test="${ purchaseVO.paymentOption.trim()=='1'}">
					<option value="1" selected="selected">현금구매</option>
					<option value="2">신용구매</option>
				</c:if>
				<c:if test="${ purchaseVO.paymentOption.trim()=='2'}">
					<option value="1" >현금구매</option>
					<option value="2"selected="selected">신용구매</option>
				</c:if>
			</select>
		    </div>
		 </div>
		 
		<div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchaseVO.receiverName}" placeholder="구매자이름">
		    </div>
		 </div>
		 
		 <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchaseVO.receiverPhone}" placeholder="구매자 연락처">
		    </div>
		 </div>
		 
		 <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자 주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchaseVO.divyAddr}" placeholder="구매자 주소">
		    </div>
		 </div>
		 
		 <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매자 구매요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" value="${purchaseVO.divyRequest}" placeholder="구매자 구매요청사항">
		    </div>
		 </div>
		 
		 <div class="form-group">
		 <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="divyDate" name="divyDate"  placeholder="배송희망일자" readonly="readonly" >
			 <img src="../images/ct_icon_date.gif" width="15" height="15" 
										onclick="show_calendar('document.updatePurchase.divyDate', document.updatePurchase.divyDate.value)"/>
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
		</div>
		 
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary" id="rewrite">수정</button>
					<button type="button" class="btn btn-primary" id="back" >취소</button>
					  </div>
		  </div> 
		</form>
	</div>
</body>
</html>