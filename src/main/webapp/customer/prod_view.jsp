<%@page import="java.text.DecimalFormat"%>
<%@page import="ez.web.model.ProductDTO"%>
<%@page import="ez.web.model.ProductDAO"%>
<%@page import="ez.web.model.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ez.web.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@ include file="user_top.jsp" %>
<main>
	<div class="container mt-5 d-flex">
		<section class="w-75 ps-5">
			<h3 style="font-weight:bold; color:#3cb371">${requestScope.specValue}상품</h3>
			<ul class="d-flex p-0" style="list-style:none;">
				<li class="me-5">
					<img src="${ctx}/uploadedFile/${requestScope.pDto.pImage}" width="220px"/>
				</li>
				<li>
					<form style="font-weight:bold; "name="prodForm" method="post">
						<input type="hidden" name="pSpec" value="${requestScope.pSpec}"/>
						상품번호 : ${requestScope.pNum}<br/>
						상품이름 : ${requestScope.pDto.pName}<br/>
						상품가격 : <fmt:formatNumber value="${requestScope.pDto.price}"/><br/>
						상품포인트 : <fmt:formatNumber value="${requestScope.pDto.pPoint}"/><br/>
						상품수량 : <input type="text" name="pQty" size="3" value="1"/>개<br/>
						<p class="mt-3" style="color:#778899"><b>[상품설명]</b><br/>
							${requestScope.pDto.pContent}
						</p>
						
						<c:if test="${sessionScope.isLogin !=null }">
							<a href="javascript:goCart(${requestScope.pNum})" class="btn btn-sm btn-success">장바구니 담기</a>
						</c:if>					
						<c:if test="${sessionScope.isLogin ==null }">
							<a href="javascript:showMsg()" class="btn btn-sm btn-success">장바구니 담기</a>
						</c:if>
						<a href="javascript:history.back()" class="btn btn-sm btn-secondary">계속 쇼핑하기</a>
					</form>
				</li>
			</ul>
		</section>
	</div>
</main>
<script>
	function goCart(pNum){
		document.prodForm.action="cartAdd.do?pNum="+pNum;
		document.prodForm.submit();
	}
	
	function showMsg(){
		alert("로그인이 필요합니다....")
	}
</script>
<%@ include file="user_bottom.jsp" %>
