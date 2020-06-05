<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
<title>��ǰ ���� ���</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">

/* function fncGetUserList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
} */
	

	
	function fncGetUserList(currentPage){
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
	}

	function fncGetProductList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage);
	   	document.detailForm.submit();		
	}

	$(function() {
		
		
	 
	 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
		fncGetProductList(1);
	});
	
	 
	$(".ct_list_pop td:nth-child(3)").on("click", function(){
	  	
		
		var prodNo = $(this).prev().prev().text();
		self.location ="/product/getProduct?prodNo="+prodNo+"+&menu=${param.menu}";
		
		
	});
	 
	$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
	$("h7").css("color" , "red");
	
				
	$(".ct_list_pop:nth-child( even )" ).css("background-color" , "whitesmoke");
	
	
	$(".tranCodeSet:contains('��ǰ���')").on("click", function(){
		
		var prodNo = $("#prodNo").val();
		self.location ="/purchase/updateTranCode?prodNo="+prodNo+"&tranCode=2";
		
	});
	
	
	
	
	
});	

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

 
<form name="detailForm">



<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					
					<c:choose>
						<c:when test="${param.menu=='search'}">
						<td width="93%" class="ct_ttl01">��ǰ �����ȸ</td>
						</c:when>
						
						<c:otherwise>
						<td width="93%" class="ct_ttl01">��ǰ ����</td>
						</c:otherwise>
					</c:choose>
		
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
	
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
			</select>
			<input type="text" name="searchKeyword" 
						value="${! empty search.searchKeyword ? search.searchKeyword : ''}" 
						class="ct_input_g" style="width:200px; height:20px" > 
		</td>

		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>



<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
		<span>
		��ü  ${resultPage.totalCount}�Ǽ�, ���� ${resultPage.currentPage}������
		</span>
			<div style="float:right">
			<select name="sortingCondition" class="ct_input_g" style="width:150px" onchange="fncGetProductList('1')">
				<option value="0"  ${ ! empty search.sortingCondition && search.sortingCondition==0 ? "selected" : "" }>���� ����</option>
				<option value="1"  ${ ! empty search.sortingCondition && search.sortingCondition==1 ? "selected" : "" }>�ֽŵ�ϼ�</option>
				<option value="2"  ${ ! empty search.sortingCondition && search.sortingCondition==2 ? "selected" : "" }>���ݳ�����</option>
				<option value="3"  ${ ! empty search.sortingCondition && search.sortingCondition==3 ? "selected" : "" }>���ݳ�����</option>
			</select>
			</div>
				
		</td>
	</tr>
	
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0"/>
	<c:forEach var="pvo" items="${list}">
		<c:set var="i" value="${i+1 }"/>
		
	<input type="hidden" id="proTranCode" value="${pvo.proTranCode}"/>
	<tr class="ct_list_pop">
		<td id="prodNo" align="center">${pvo.prodNo}</td>
		<td></td>
		<c:if test="${empty pvo.proTranCode }">
		<td id="onSale" align="left">
		${pvo.prodName}
		</td>
		</c:if>
		<c:if test="${!empty pvo.proTranCode }">
		<td id="soldOut" align="left">
		${pvo.prodName}
		</td>
		</c:if>
		<td></td>
		<td align="left">${pvo.price}</td>
		<td></td>
		<td align="left">${pvo.regDate}</td>
		<td></td>	
		<td align="left">
		
	<c:if test="${param.menu=='search'}">
			<c:choose>
				<c:when test="${empty pvo.proTranCode}">
					�Ǹ���
				</c:when>
				<c:otherwise>
					�������
				</c:otherwise>
			</c:choose>
		</c:if>
		
	<c:if test="${param.menu=='manage'}">
				<c:if test="${empty pvo.proTranCode }">
				�Ǹ���
				</c:if>
				<c:if test="${!empty pvo.proTranCode }">

					<c:if test="${fn:contains(pvo.proTranCode, '1') }">
					���ſϷ�  &nbsp; <a class="tranCodeSet">��ǰ���</a>
					</c:if>
					<c:if test="${fn:contains(pvo.proTranCode, '2')}">
					�����
					</c:if>
					<c:if test="${fn:contains(pvo.proTranCode, '3')}">
					��ۿϷ�
					</c:if>
				</c:if>
	</c:if>


		</td> 
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		 <input type="hidden" id="currentPage" name="currentPage" value=""/>
		
			<jsp:include page="../common/pageNavigator.jsp"/>	

    	</td>
	</tr>
</table>
</form>

</body>
</html>