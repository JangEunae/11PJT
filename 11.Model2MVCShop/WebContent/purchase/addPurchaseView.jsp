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
<title>��ǰ �� ��ȸ</title>
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
			<h3 class=" text-info">��ǰ ���� </h3>
	</div>   	

<form name="detailForm" class="form-horizontal" >
	<input type="hidden" name="tranCode" value="0"/>
	<input type="hidden" name="prodNo" value="${productVO.prodNo}" />
	<input type="hidden" name="userId" value="${userVO.userId}" />
	
	
	<div class="form-group">
		 <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		   <div class="col-sm-4">${productVO.prodNo}</div>
	</div>
	
	<div class="form-group">
		 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		   <div class="col-sm-4">${productVO.prodName}</div>
	</div>
	
	<div class="form-group">
		 <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		   <div class="col-sm-4">${productVO.prodDetail}</div>
	</div>
	
	<div class="form-group">
		 <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		   <div class="col-sm-4">${productVO.manuDate}</div>
	</div>
	
	<div class="form-group">
		 <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		   <div class="col-sm-4">${productVO.price}</div>
	</div>
	
	<div class="form-group">
		 <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
		   <div class="col-sm-4">${productVO.regDate}</div>
	</div>
	
	<div class="form-group">
		 <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		   <div class="col-sm-4">${userVO.userId}</div>
	</div>
	
	<div class="form-group">
		 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		   <div class="col-sm-4">
		    <select name="paymentOption" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20">
		    	<option value="1" selected="selected">���ݱ���</option>
				<option value="2">�ſ뱸��</option>
			</select>
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>

	<div class="form-group">
		 <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="receiverName" name="receiverName" value="${userVO.userName}" placeholder="�������̸�"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>
	
	<div class="form-group">
		 <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${userVO.phone}" placeholder="�����ڿ���ó"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>
	
	<div class="form-group">
		 <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${userVO.addr}" placeholder="�������ּ�"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>
	
	<div class="form-group">
		 <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="divyRequest" name="divyRequest"  placeholder="���ſ�û����"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>
	
	<div class="form-group">
		 <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="divyDate" name="divyDate"  placeholder="����������" readonly="readonly" >
			 <img src="../images/ct_icon_date.gif" width="15" height="15" 
										onclick="show_calendar('document.detailForm.divyDate', document.detailForm.divyDate.value)"/>
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>
	
	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="buy" >����</button>
		      <button type="button" class="btn btn-primary" id="back" >���</button>
		    </div>
	</div>


	</form>
</div>
</body>
</html>