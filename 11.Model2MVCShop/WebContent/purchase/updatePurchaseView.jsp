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
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	<title>�������� ����</title>

</head>

<body>

	<div class="navbar  navbar-default">
        <div class="container">
        	<jsp:include page="/layout/toolbar.jsp" />
   		</div>
   	</div>
   	
   	<div class="container">
	
		<div class="page-header text-center">
		       <h3 class=" text-info">������������</h3>
		       <h5 class="text-muted">���� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
		</div>
   	
		<form name="updatePurchase" class="form-horizontal" >
			<input type="hidden" name="buyerId" value="${purchaseVO.buyer.userId}">
			
		<div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		    <div class="col-sm-4">${purchaseVO.buyer.userId}</div>
		 </div>
		 
		 
		 <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    <div class="col-sm-4">
		    <select name="paymentOption" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20">
			    <c:if test="${ purchaseVO.paymentOption.trim()=='1'}">
					<option value="1" selected="selected">���ݱ���</option>
					<option value="2">�ſ뱸��</option>
				</c:if>
				<c:if test="${ purchaseVO.paymentOption.trim()=='2'}">
					<option value="1" >���ݱ���</option>
					<option value="2"selected="selected">�ſ뱸��</option>
				</c:if>
			</select>
		    </div>
		 </div>
		 
		<div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchaseVO.receiverName}" placeholder="�������̸�">
		    </div>
		 </div>
		 
		 <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">������ ����ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchaseVO.receiverPhone}" placeholder="������ ����ó">
		    </div>
		 </div>
		 
		 <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">������ �ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchaseVO.divyAddr}" placeholder="������ �ּ�">
		    </div>
		 </div>
		 
		 <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">������ ���ſ�û����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" value="${purchaseVO.divyRequest}" placeholder="������ ���ſ�û����">
		    </div>
		 </div>
		 
		 <div class="form-group">
		 <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="divyDate" name="divyDate"  placeholder="����������" readonly="readonly" >
			 <img src="../images/ct_icon_date.gif" width="15" height="15" 
										onclick="show_calendar('document.updatePurchase.divyDate', document.updatePurchase.divyDate.value)"/>
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
		</div>
		 
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary" id="rewrite">����</button>
					<button type="button" class="btn btn-primary" id="back" >���</button>
					  </div>
		  </div> 
		</form>
	</div>
</body>
</html>