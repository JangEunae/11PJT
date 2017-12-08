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
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
		
		//==> �߰��Ⱥκ� : "����" "Ȯ��"  Event ���� �� ó��
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
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
		
	</script>
<title>��ǰ �� ����</title>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />


	<div class="container">
	
		<div class="page-header">
		       <h3 class=" text-info">��ǰ������</h3>
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${productVO.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${productVO.prodName}</div>
		</div>
		
		<hr/>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${productVO.prodDetail}</div>
		</div>
		
		<hr/>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${productVO.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${productVO.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${productVO.regDate}</div>
		</div>
		
		<hr/>

	<div class="row">
	  		<div class="col-md-12 text-center ">
				<c:if test = "${param.menu=='manage'}">						
					<button type="button" class="btn btn-primary" id="ok">Ȯ��</button>
				</c:if>
				
				<c:if test = "${param.menu=='search'}">	
					<button type="button" class="btn btn-primary" id="buy">����</button>
				</c:if>
					<button type="button" class="btn btn-primary" id="back">����</button>
			</div>
	</div>
</div>	

</body>
</html>