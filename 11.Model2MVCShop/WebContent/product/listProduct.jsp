<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<c:set var="menu" value="${menu}" scope="request"/>
${menu}
<%@ page import="java.util.*"  %> 
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>
<%@ page import="com.model2.mvc.service.domain.*" %>

<%
List<Product> list= (List<Product>)request.getAttribute("list");
Page resultPage=(Page)request.getAttribute("resultPage");

Search searchVO = (Search)request.getAttribute("search");
//==> null �� ""(nullString)���� ����
String searchCondition = CommonUtil.null2str(searchVO.getSearchCondition());
String searchKeyword = CommonUtil.null2str(searchVO.getSearchKeyword());

%>

<%
	String menu = (String)request.getParameter("menu");
%>
--%>    
<!DOCTYPE html>
<html>
<head>
<title>��ǰ �����ȸ</title>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link href="/css/animate.min.css" rel="stylesheet">
  	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
  	 
  	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<style>
	  body {
            padding-top : 50px;
        }
    </style>

<script type="text/javascript">

function fncGetList(currentPage) {
	//document.getElementById("currentPage").value = currentPage;
   	//document.detailForm.submit();
   	$("#currentPage").val(currentPage);
   	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}&searchOption=${search.searchOption}").submit();
}

$(function() {
	 
	 	$( "button.btn.btn-default" ).on("click" , function() {
			fncGetList(1);
		});
		 
		
		 $( "td:nth-child(2)" ).on("click" , function() {
				if(${param.menu=='manage'}){
					self.location = "/product/updateProduct?prodNo="+$($('input:hidden[name="prodNo"]')[$("td:nth-child(2)").index(this)]).val()+"&menu=${param.menu}";
				}
				else if(${param.menu=='search'}){
					if($($('input[name="proTranCode"]')[$("td:nth-child(2)").index(this)]).val()==''){
						self.location = "/product/getProduct?prodNo="+$($('input:hidden[name="prodNo"]')[$("td:nth-child(2)").index(this)]).val()+"&menu=${param.menu}";
						}else {
					}
				}
				
			});
		 
		$( "td.ct_condition:contains('����ϱ�')" ).on("click" , function() {
			 self.location = "/purchase/updateTranCodeByProd?prodNo="+$($('input:hidden[name="prodNo"]')[$("td:nth-child(4)").index(this)]).val()+
					 "&proTranCode="+$($('input:hidden[name="proTranCode"]')[$("td:nth-child(4)").index(this)]).val();
		});
		
		$( "td.ct_condition:contains('��ۿϷ�Ȯ��')" ).on("click" , function() {
			 self.location = "/purchase/updateTranCodeByProd?prodNo="+$($('input:hidden[name="prodNo"]')[$("td:nth-child(4)").index(this)]).val()+"&proTranCode="
					 +$($('input:hidden[name="proTranCode"]')[$("td:nth-child(4)").index(this)]).val();
			 
		});
		
		
		$( "td:nth-child(1)" ).on("click" , function() {
		 if(${param.menu=='search'}){
						
					var prodNo = $($('input:hidden[name="prodNo"]')[$("td:nth-child(1)").index(this)]).val();
					$.ajax( 
							{
								url : "/product/json/getProduct/"+prodNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									//Debug...
									alert(status);
									//Debug...
									alert("JSONData : \n"+JSONData);
									
									var displayValue = "<h3>"
																+"��ǰ�� : "+JSONData.prodName+"<br/>"
																+"�̹��� : <img src=/images/uploadFiles/"+JSONData.fileName+"/><br/>"
																+"��������  : "+JSONData.manuDate+"<br/>"
																+"</h3>";
									//Debug...									
									//alert(displayValue);
									$("h3").remove();
									$( "#"+prodNo+"" ).html(displayValue);
								}
					});
		 		}
		 	});
		
		
			/*$( "td.ct_pre" ).hover(
				  function() {
				    $( this ).append(  "<img src=/images/uploadFiles/"+$($('input:hidden[name="fileName"]')[$(".ct_list_pop td:nth-child(9)").index(this)]).val()+"/><br/>" );
				  }, function() {
				    $( this ).find( "img" ).remove();
				  }
				);
				 
				$( "td.ct_pre.fade" ).hover(function() {
				  $( this ).fadeOut( 100 );
				  $( this ).fadeIn( 500 );
				  
			});  */
			
			
		 $( "td:nth-child(5)" ).hover(function() { 
			var prodNo = $($('input:hidden[name="prodNo"]')[$("td:nth-child(5)").index(this)]).val();
			var fileName = $($('input:hidden[name="fileName"]')[$("td:nth-child(5)").index(this)]).val();
				  $.ajax( 
						{
							url : "/product/json/getProduct/"+prodNo ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								var displayValue = "<img class=hover src=/images/uploadFiles/"+JSONData.fileName+"/>";
							
								if(fileName!=null){
									$("."+prodNo+"").append("<p id='append'>"+displayValue+"</p>");
								}else{
									$("."+prodNo+"").append("<p id='append'>�̹��� ����</p>");
								}
							}
					});
	
		}, function() {
			$(".hover").remove();
			$("#append").remove();
			
		  }
		 );	
			
		 /* $( ".ct_list_pop td:nth-child(9).fade" ).hover(function() {
			  $( this ).fadeOut( 100 );
			  $( this ).fadeIn( 500 );
		}); */
			
				
});
	 
		</script>
	</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
<!-- <form name="detailForm" action="/product/listProduct?menu=${param.menu}&searchOption=${search.searchOption}" method="post" > -->
<div class="container">
	
	<div class="page-header text-info">	
			<%--	<% 
				System.out.println("list�� menu : "+menu);
				if(menu.equals("manage")) {%>
					<td width="93%" class="ct_ttl01">
							��ǰ ����
					</td>
					<%} else{ %>
						<td width="93%" class="ct_ttl01">
							��ǰ �����ȸ
					</td>
					<%} %>--%> 
			<c:if test = "${param.menu=='manage'}">
				<h3>��ǰ ����</h3>
			</c:if>
			<c:if test = "${param.menu=='search'}">
				<h3>��ǰ �����ȸ</h3>
			</c:if>
					
	</div>

 <div class="row">
 
 	<div class="col-md-6 text-left">
		  <p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		  </p>
	</div>
	
	<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
 
	<div class="form-group">
		<select class="form-control" name="searchCondition" id="searchCondition">
			<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ü</option>
			<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
			<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
		</select>
	</div>
		<%-- <%
		if(searchVO.getSearchCondition() != null) {
		%>
		
		
			<%
				if(searchVO.getSearchCondition().equals("0")){
			%>
				<option value="0" selected>��ǰ��ȣ</option>
				<option value="1">��ǰ��</option>
				<option value="2">��ǰ����</option>
			<%
				}else if(searchVO.getSearchCondition().equals("1")) {
			%>
				<option value="0">��ǰ��ȣ</option>
				<option value="1" selected>��ǰ��</option>
				<option value="2">��ǰ����</option>
			<%
				}else if(searchVO.getSearchCondition().equals("2")) {
			%>
				<option value="0">��ǰ��ȣ</option>
				<option value="1">��ǰ��</option>
				<option value="2" selected>��ǰ����</option>
				
			<%
				}
			%>--%>
	<div class="form-group">
		<label class="sr-only" for="searchKeyword">�˻���</label>
		 <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
	</div>
	
	<%--	<%
		}else{
		%>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0">��ǰ��ȣ</option>
				<option value="1">��ǰ��</option>
				<option value="2">��ǰ����</option>
			</select>
			<input type="text" name="searchKeyword" class="ct_input_g" style="width:200px; height:19px" />
		</td>
		
		<%
		}
		%>--%>
			
		<button type="button" class="btn btn-default">�˻�</button>
	<p>	
	<div class="form-group">
		<a href="/product/listProduct?menu=${param.menu}&searchOption=0&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}">���� ���ݼ��� </a>
		<a href="/product/listProduct?menu=${param.menu}&searchOption=1&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}">���� ���ݼ��� </a>
	</div>
	</p>
	 	<input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
		</form>
	
	</div>

</div>



<table class="table table-hover table-striped" >
      
        <thead>
	<tr>
	 		<th align="center">No</th>
            <th align="left" >��ǰ��</th>
            <th align="left">����</th>
            <th align="left">�������</th>
            <th align="left">��������</th>
	</tr>
	</thead>
<%--	<%
	for(int i=0; i<list.size(); i++) {
		Product vo = (Product)list.get(i);
	
	%>
	<tr class="ct_list_pop">
		<td align="center"><%= i + 1 %></td>
		<td></td>
				<% if(menu.equals("manage")) {%>
				<td align="left"><a href="/updateProductView.do?prodNo=<%=vo.getProdNo() %>"><%=vo.getProdName() %></a></td>
				<%} else{ %>
				<td align="left"><a href="/getProduct.do?prodNo=<%=vo.getProdNo() %>"><%=vo.getProdName() %></a></td>
				<%} %>
		<td></td>
		<td align="left"><%=vo.getPrice() %></td>
		<td></td>
		<td align="left"><%=vo.getRegDate() %></td>
		<td></td>
		<td align="left"><%=vo.getProTranCode() %></td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	<% } %>		--%>
<tbody>	
<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">	
		<c:set var="i" value="${ i+1 }" />
		<tr>
			<td align="center">
			<input type="hidden" name="prodNo" value="${product.prodNo}">
			<input type="hidden" name="proTranCode" value="${product.proTranCode}">
			<input type="hidden" name="fileName" value="${product.fileName}">
			${ i }</td>
				<c:if test = "${param.menu=='manage'}">					
					<td align="left">
					<!--<a href="/product/updateProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>-->
					<ins>${product.prodName}</ins>
					</td>		
				</c:if>
				<c:if test = "${param.menu=='search'}">
					<c:if test = "${product.proTranCode==null}">
				<td align="left">
				<!--<input type="hidden" name="prodNo" value="${product.prodNo}">-->
				<!--<input type="hidden" name="proTranCode" value="${product.proTranCode}">-->
				<!--<a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>-->
				<ins>${product.prodName}</ins>
				</td>
				</c:if>
				<c:if test = "${product.proTranCode=='0  '||product.proTranCode=='1  '||product.proTranCode=='2  '}">
				<td align="left">
				<font color="gray">${product.prodName}</font>
				<!--<input type="hidden" name="proTranCode" value="${product.proTranCode}">-->
				<!--<input type="hidden" name="prodNo" value="${product.prodNo}">-->
				</td>
				</c:if>
				</c:if>
			<td align="left">${product.price}</td>
			<td align="left" class="ct_condition">
			<!-- <input type="hidden" name="prodNo" value="${product.prodNo}">
			<input type="hidden" name="proTranCode" value="${product.proTranCode}"> -->
			<c:if test = "${product.proTranCode==null}">
				�Ǹ���
			</c:if>
			<c:if test = "${product.proTranCode=='0  '}">
				<c:if test = "${param.menu=='manage'}">
				���ſϷ�
					<!-- <a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&proTranCode=${product.proTranCode}">����ϱ�</a> -->
					<ins>����ϱ� </ins>
				</c:if>	
				<c:if test = "${param.menu=='search'}">
				������
				</c:if>
			</c:if>
			<c:if test = "${product.proTranCode=='1  '}">
				�����
				<c:if test = "${param.menu=='manage'}">
					<!--<a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&proTranCode=${product.proTranCode}">��ۿϷ�Ȯ��</a> -->
					<ins>��ۿϷ�Ȯ��</ins>
				</c:if>
			</c:if>
			<c:if test = "${product.proTranCode=='2  '}">
				��ۿϷ�
			</c:if>
			</td>
			<td align="left" class="${product.prodNo}">${product.fileName}</td>		
		</tr>
		<!--<td colspan="11" bgcolor="D6D7D6" height="1"></td>-->
		<input type="hidden" value="${product.prodNo}" id="${product.prodNo}">
				</input>
				</input>
			</c:forEach>
		</tbody>

	</table>
</div>

<jsp:include page="../common/pageNavigator_new.jsp"/>

<!--  ������ Navigator �� -->


</body>
</html>
