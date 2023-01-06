<%@page import="ez.web.util.ProdSpec"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="ez.web.model.ProductDTO"%>
<%@page import="ez.web.model.ProductDAO"%>
<%@page import="ez.web.model.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ez.web.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="demo" class="carousel slide" data-bs-ride="carousel">


    
<%@ include file="user_top.jsp" %>

 <div class="mt-5" data-bs-interval="3000">
      <img src="${ctx}/img/3.png" alt="..." class="w-100">
    </div>
</div>
<main>
	<div class="container mt-5 d-flex">
		<section class="w-100 ps-5">
		<h3 class="mb-2"></h3>
			<%				
			ProductDAO pDao = ProductDAO.getInstance();
			ArrayList<ProductDTO> pDtos = null;
			for(ProdSpec ps : pdSpecs){
				// 인기, 신상, 추천
				String key = ps.name();
				pDtos = pDao.getProductBySpec(key);
				pageContext.setAttribute("ps", ps);
				pageContext.setAttribute("pDtos", pDtos);
			%>
				<c:if test="${pDtos == null || pDtos.size() ==0 }">
					${ps.getValue()} 상품이 없습니다!!
				</c:if>
				
				<c:if test="${pDtos != null || pDtos.size() !=0 }">
				<h4 class="mt-4" style="font-weight:bold; color:#ffa500;">${ps.getValue()}!</h4>
				<div class="d-flex">
				  <c:set var="cnt" value="0"/>	
				  <c:forEach var="pDto" items="${pDtos}">
					<%@ include file="prod_loop.jsp" %>
				  </c:forEach>  
				</div>	
				</c:if>
			<% } // for문 %>
		</section>
	</div>
</main>
<%@ include file="user_bottom.jsp" %>
