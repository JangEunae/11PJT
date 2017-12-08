<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%--<%@ page import="java.util.*"  %> 
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>
<%@ page import="com.model2.mvc.service.domain.*" %>
    
<%
List<Purchase> list= (List<Purchase>)request.getAttribute("list");
List<User> list02= (List<User>)request.getAttribute("list02");
Page resultPage=(Page)request.getAttribute("resultPage");
//System.out.println("jsp"+list02);
Search searchVO = (Search)request.getAttribute("search");
//==> null 을 ""(nullString)으로 변경
String searchCondition = CommonUtil.null2str(searchVO.getSearchCondition());
String searchKeyword = CommonUtil.null2str(searchVO.getSearchKeyword());
//User user = (User)session.getAttribute("userVO");
//Product productVO = (Product)request.getAttribute("productVO");
//User user = (User)session.getAttribute("user");


%>--%> 
	
<!DOCTYPE html>
<html>
<head>
<title>구매 목록조회</title>

<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
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
		   	$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
		}
		
		$(function() {
			
			$( "td:nth-child(1)" ).on("click" , function() {
					
					self.location = "/purchase/getPurchase?tranNo="+$($('input:hidden[name="tranNo"]')[$("td:nth-child(1)").index(this)]).val()
			});
			
			$( "td:nth-child(2)" ).on("click" , function() {
				
				self.location = "/user/getUser?userId="+$($('input:hidden[name="userId"]')[$("td:nth-child(2)").index(this)]).val()
			});
			
			$( "td.ct_condition:contains('물건도착')" ).on("click" , function() {
				 self.location = "/purchase/updateTranCode?tranNo="+$($('input:hidden[name="tranNo"]')[$("td:nth-child(6)").index(this)]).val()+"&tranCode="+
				 +$($('input:hidden[name="tranCode"]')[$("td:nth-child(6)").index(this)]).val();
			});
			
		});

	</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
		<div class="page-header text-info">	
			<h3>구매 목록조회</h3>
		</div>
		
	<div class="row">
 
	 	<div class="col-md-6 text-left">
			  <p class="text-primary">
			    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
			  </p>
		</div>	
		
		<div class="col-md-6 text-right">

			<form name="detailForm" class="form-inline">
			
			</form>
	</div>
</div>	
		
<table class="table table-hover table-striped" >
      
		        <thead>
			<tr>
			 		<th align="center">No</th>
		            <th align="left" >회원ID</th>
		            <th align="left">회원명</th>
		            <th align="left">전화번호</th>
		            <th align="left">배송현황</th>
		            <th align="left">정보수정</th>
			</tr>
			</thead>
				
		
		
<tbody>	
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">	
		<c:set var="i" value="${ i+1 }" />
	<tr class="ct_list_pop">
		<td align="center">
		<input type="hidden" name="tranNo" value="${purchase.tranNo}">
			<!-- <a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${ i }</a>-->
			<ins>${ i }</ins>
		</td>
		<td align="left">
		<input type="hidden" name="userId" value="${purchase.buyer.userId}">
			<!-- <a href="/user/getUser?userId=${purchase.buyer.userId }">${purchase.buyer.userId }</a>-->
			<ins>${purchase.buyer.userId }</ins>
		</td>
		<td align="left">${purchase.receiverName}</td>
		<td align="left">${purchase.receiverPhone}</td>
		<td align="left"><c:if test = "${purchase.tranCode==null}">
		<input type="hidden" name="tranCode" value="${purchase.tranCode}">
				판매중
			</c:if>
			<c:if test = "${purchase.tranCode=='0  '}">
				구매완료
				<a href="/purchase/updatePurchase?tranNo=${purchase.tranNo}">배송정보수정</a>
				
				<a href="/purchase/deletePurchase?tranNo=${purchase.tranNo}">환불하기</a>
			</c:if>
			<c:if test = "${purchase.tranCode=='1  '}">
				배송중
			</c:if>
			<c:if test = "${purchase.tranCode=='2  '}">
				배송완료  (배송지 : ${purchase.divyAddr})
			</c:if></td>
		<td align="left" class="ct_condition">
		<c:if test = "${purchase.tranCode=='1  '}">
			배송중 (정보수정,환불불가)
		</c:if>
		<c:if test = "${purchase.tranCode=='2  '}">
			배송완료 (정보수정,환불불가)
		</c:if>
		<c:if test = "${purchase.tranCode=='1  '}">
		<!-- <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=${purchase.tranCode}">물건도착</a>		 -->
			<ins>물건도착</ins>
		</c:if>
		</td>
	</tr>
	</c:forEach>
	<%--<%} %>--%>
		</tbody>
	</table>
</div>

			<jsp:include page="../common/pageNavigator_new.jsp"/>

</body>
</html>