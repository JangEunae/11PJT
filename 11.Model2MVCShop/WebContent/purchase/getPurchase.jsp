<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%--
<%@ page import="com.model2.mvc.service.domain.*" %>
    
<%

	Purchase purchase = (Purchase)request.getAttribute("purchaseVO");
	System.out.println(purchase);
	
%>--%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="EUC-KR">
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
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<style>
	 		body {
	            padding-top : 50px;
	        }
	     </style>
	     
	<script type="text/javascript">
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( "#rewrite" ).on("click" , function() {
	
			 self.location = "/purchase/updatePurchase?tranNo=${purchaseVO.tranNo }";
		 });
		
		 $( "#back" ).on("click" , function() {
			 self.location =  "/purchase/listPurchase";
			});
	});
	
	
	</script>
<title>���Ż���ȸ</title>
</head>

<body>
		<jsp:include page="/layout/toolbar.jsp" />
		
		<div class="container">
	
		<div class="page-header">
		       <h3 class=" text-info">��ǰ������</h3>
		</div>
		
			<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${purchaseVO.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ھ��̵� </strong></div>
			<div class="col-xs-8 col-md-4">${purchaseVO.buyer.userId}</div>
		</div>
		
		<hr/>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���Ź��</strong></div>
			<div class="col-xs-8 col-md-4">
				<c:if test="${ purchaseVO.paymentOption.trim()=='1'}">
					���ݱ��� 
				</c:if>
				<c:if test="${ purchaseVO.paymentOption.trim()=='2'}">
					�ſ뱸�� 
				</c:if>
			</div>
		</div>
		
		<hr/>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������̸�</strong></div>
			<div class="col-xs-8 col-md-4">${purchaseVO.receiverName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ڿ���ó</strong></div>
			<div class="col-xs-8 col-md-4">${purchaseVO.receiverPhone}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${purchaseVO.divyAddr}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���ſ�û����</strong></div>
			<div class="col-xs-8 col-md-4">${purchaseVO.divyRequest}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${purchaseVO.divyDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�ֹ���</strong></div>
			<div class="col-xs-8 col-md-4">${purchaseVO.orderDate}</div>
		</div>

	<div class="row">
	  		<div class="col-md-12 text-center ">
					<button type="button" class="btn btn-primary" id="rewrite">����</button>
					<button type="button" class="btn btn-primary" id="back">Ȯ��</button>
			</div>
	</div>
		</td>
	</tr>
</table>

</body>
</html>