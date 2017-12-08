<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page import="com.model2.mvc.service.domain.*" %>

<%
	Product productVO=(Product)request.getAttribute("productVO");
	System.out.println("view의 vo : "+productVO);
%>
--%>
<!DOCTYPE html>
<html>
<head>
	<title>회원정보수정</title>
		<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="../javascript/calendar.js"></script>
	<script type="text/javascript">

function fncAddProduct(){
	//Form 유효성 검증
 	//var name = document.detailForm.prodName.value;
	//var detail = document.detailForm.prodDetail.value;
	//var manuDate = document.detailForm.manuDate.value;
	//var price = document.detailForm.price.value;
	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
		
	//document.detailForm.action='/product/updateProduct';
	//document.detailForm.submit();
	
	$("form").attr("method" , "POST").attr("enctype" , "multipart/form-data").attr("action" , "/product/updateProduct").submit();
}

$(function() {
	 $( "#rewrite" ).on("click" , function() {
		 fncAddProduct();
	});
});	

$(function() {
	 $( "#back" ).on("click" , function() {
		 history.go(-1)
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
		       <h3 class=" text-info">상품정보수정</h3>
		       <h5 class="text-muted">상품 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
		</div>

	<form name="detailForm" class="form-horizontal">
	
		<input type="hidden" name="prodNo" value="${productVO.prodNo}"/>
		
		
		<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${productVO.prodName}" placeholder="변경상품명">
		    </div>
		 </div>
		 
		 
		 <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${productVO.prodDetail}" placeholder="변경상품정보">
		    </div>
		 </div>
		 
		 <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" value="${productVO.manuDate}" placeholder="상품제조일자" readonly="readonly">
		      <img 	src="../images/ct_icon_date.gif" width="15" height="15" 
									onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" />
		    </div>
		 </div>
		 
		 <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" value="${productVO.price}" placeholder="상품가격" >
		    </div>
		 </div>
		 
		 <div class="form-group">
		    <label for="multi" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="multi" name="multi" value="${productVO.fileName}" placeholder="상품이미지" >
		    </div>
		 </div>

		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
				<c:if test = "${purchaseVO.tranCode==null}">	
					<button type="button" class="btn btn-primary" id="rewrite">수정</button>
				</c:if>		
					<button type="button" class="btn btn-primary" id="back" >취소</button>
					  </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>