<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function fncGetUserList(currentPage) {
   	
   	$("#currentPage").val(currentPage);
   	$("form").attr("method", "POST").attr("action", "/purchase/listPurchase").submit();
   	
	}
	
	 $(function() {
		 
			
			$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
				
					var tranNo = $(this).prev().prev().text().trim();
					$.ajax( 
							{
								url : "/purchase/json/getPurchase/"+tranNo,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									
									var displayValue = "<h3>"
																+"물품 번호 : "+JSONData.purchaseProd.prodNo+"<br/>"
																+"상품 상세 : "+JSONData.purchaseProd.prodDetail+"<br/>"
																+"가격 : "+JSONData.purchaseProd.price+"<br/>"
																+"구매자 이름 : "+JSONData.receiverName+"<br/>"
																+"구매자 연락처 : "+JSONData.receiverPhone+"<br/>"
																+"구매자 주소 : "+JSONData.divyAddr+"<br/><h3>";
																
																
									$("h3").remove();
									$("#"+tranNo+"").html(displayValue); 
									
								}
							
							
						});
						
					
			});
			
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			$(".ct_list_pop:nth-child( 3n)" ).css("background-color" , "whitesmoke");
		});	

	
	
	
	
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" >

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11" >전체 ${resultPage.totalCount }건수, 현재 ${resultPage.currentPage}페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">상태변경</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0"/>
	<c:forEach var="puvo" items="${list}">

	
	<tr class="ct_list_pop">
		<td align="center">
	<c:choose>
		<c:when test="${empty puvo.tranCode || fn:contains(puvo.tranCode, '1')}">
			<a href="/purchase/getPurchase?tranNo=${puvo.tranNo}">${puvo.tranNo}</a>
		</c:when>
		<c:otherwise>
		${puvo.tranNo }
		</c:otherwise>
	</c:choose>
		</td>
		<td></td>
		<td align="center">
			${puvo.purchaseProd.prodName}
			<span id="add" style="display:hidden;"></span>
		</td>
		<td></td>
		<td align="left">${user.userName}</td>
		<td></td>
		<td align="left">${puvo.receiverPhone}</td>
		<td></td>
		<td align="left">현재
				
					<c:if test="${empty puvo.tranCode }">
					
					</c:if>
					<c:if test="${fn:contains(puvo.tranCode, '1') }">
					구매완료 
					</c:if>
					<c:if test="${fn:contains(puvo.tranCode, '2')}">
					배송중
					</c:if>
					<c:if test="${fn:contains(puvo.tranCode, '3')}">
					배송완료
					</c:if>

				상태 입니다.</td>
		<td></td>
		<td align="center">
		
		<c:if test="${fn:contains(puvo.tranCode, '1') }">
		배송준비중
		</c:if>
		<c:if test="${fn:contains(puvo.tranCode, '2')}">
		<a href="/purchase/updateTranCode?prodNo=${puvo.purchaseProd.prodNo}&tranCode=3">구매확정</a>	
		</c:if>

			
		</td>
		
	</tr>
	<tr>
	<td id="${puvo.tranNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		 
		 <input type="hidden" id="currentPage" name="currentPage" value=""/>
		
			<jsp:include page="../common/pageNavigator.jsp"/>	
			
		</td>
	</tr>
</table>

<!--  페이지 Navigator 끝 -->
</form>

</div>

</body>
</html>