<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html>
<head>
<title>��ǰ���</title>

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
	//Form ��ȿ�� ����
 	//var name = document.detailForm.prodName.value;
	//var detail = document.detailForm.prodDetail.value;
	//var manuDate = document.detailForm.manuDate.value;
	//var price = document.detailForm.price.value;
	
	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
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
			<h3 class=" text-info">��ǰ ��� </h3>
	</div>

<!-- <form name="detailForm" method="post" enctype="multipart/form-data"> -->
<form name="detailForm" class="form-horizontal" >

	<div class="form-group">
		 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="prodName" name="prodName"  placeholder="��ǰ��"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>
	
	<div class="form-group">
		 <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="prodDetail" name="prodDetail"  placeholder="��ǰ������"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div> 
	
	<div class="form-group">
		 <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="manuDate" name="manuDate"  placeholder="��������"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>

	<div class="form-group">
		 <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		   <div class="col-sm-4">
		    <input type="text" class="form-control" id="price" name="price"  placeholder="����"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>	
	
	<div class="form-group">
		 <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		   <div class="col-sm-4">
		    <input type="file" class="form-control" id="fileName" name="fileName"  placeholder="��ǰ�̹���"  >
			 <span id="helpBlock" class="help-block">
			</span>
		   </div>
	</div>

	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="submit" >���</button>
			  <button type="button" class="btn btn-primary" id="remove" >���</button>
		    </div>
	</div>


</form>
</div>
</body>

</html>