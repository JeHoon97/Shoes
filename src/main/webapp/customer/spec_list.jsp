<%@page import="java.text.DecimalFormat"%>
<%@page import="ez.web.model.ProductDTO"%>
<%@page import="ez.web.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="user_top.jsp" %>
<main>
	<div class="container mt-5 d-flex">
		<section class="w-100 ps-5">
		<c:if test="${requestScope.msg !=null }">	
			<p>${requestScope.msg}</p>		
		</c:if>
		<c:if test="${requestScope.msg == null }">
		<h3 style="color:#708090; font-weight:bold;">${requestScope.specValue}!</h3>
		<div class="d-flex">
			<c:set var="cnt" value="0"/>
			<c:forEach var="pDto" items="${requestScope.pDtos}">
				<%@ include file="prod_loop.jsp" %> 
			</c:forEach>
			</div>	
			</c:if>		
		</section>
	</div>
</main>
<%@ include file="user_bottom.jsp" %>