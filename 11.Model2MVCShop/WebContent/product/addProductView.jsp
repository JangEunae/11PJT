<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html>
<head>
<title>상품등록</title>

<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<script type="text/javascript" src="../javascript/calendar.js"></script>
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

	//document.detailForm.action='/product/addProduct';
	//document.detailForm.submit();
	
	$("form").attr("method" , "POST").attr("action" , "/product/addProduct").submit();
}

//function resetData(){
//	document.detailForm.reset();
//}
	$(function() {
			 $( "#submit" ).on("click" , function() {
				fncAddProduct();
			});
		});	

	$(function() {
			 $( "#remove" ).on("click" , function() {
					$("form")[0].reset();
			});
		});
</script>

</head>
<body>
		
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>

<div class="container">

	<div class="page-header text-center">
			<h3 class=" text-info">상품 등록 </h3>
	</div>

<!-- <form name="detailForm" method="post" enctype="multipart/form-data"> -->
<form name="detailForm" class="form-horizontal" >

	<div class="form-group">
		 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="prodName" name="prodName"  placeholder="상품명"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>
	
	<div class="form-group">
		 <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="prodDetail" name="prodDetail"  placeholder="상품상세정보"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div> 
	
	<div class="form-group">
		 <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="manuDate" name="manuDate"  placeholder="제조일자"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>

	<div class="form-group">
		 <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="price" name="price"  placeholder="가격"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>	
	
	<div class="form-group">
		 <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		   <div class="col-sm-4">
		    <input type="file" class="form-control" id="fileName" name="fileName"  placeholder="상품이미지"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>

	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="submit" >등록</button>
			  <button type="button" class="btn btn-primary" id="remove" >취소</button>
		    </div>
	</div>


</form>
</div>
</body>

</html>