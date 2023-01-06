<%@page import="ez.web.util.ProdSpec"%>
<%@page import="ez.web.model.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ez.web.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="${ctx}/css/shoes.css" rel="stylesheet" type="text/css">
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>                                         
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<script src="${ctx}/js/validChk.js"></script>
</head>
<body>
<header>
<nav class="navbar navbar-expand-sm bg-light navbar-light">

  <div class="container" style="height:100px;">
    <a class="navbar-brand mt-1" style="color:black; font-weight:bold; font-size:30px;" href="${ctx}">Unbalance</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>	
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav w-100">
<div class="me-auto">
	  <ul class="nav justify-content-center" style="margin-left:260px;">
<%
	CategoryDAO cDao = CategoryDAO.getInstance();
	ArrayList<CategoryDTO> cDtos = cDao.categoryList();
	
	if(cDtos !=null || cDtos.size() !=0){
		for(CategoryDTO cDto : cDtos){
			String catName = cDto.getCatName();
			String code = cDto.getCode(); 
	%>					
	    <li class="nav-link">
	      <a class="p-1" style="color:#dc143c; font-size:20px; font-weight:bold; textdecoration:none;" href="categoryList.do?code=<%=code%>&catName=<%=catName%>"><%=catName%></a>
	    </li>
	<%	} // for문
	}else{ 
		out.println("<li class='nav-item'>카테고리가 없습니다!!!!</li></ul>");
	}// if문
	
	out.println("<ul class='nav justify-content-center'>");
	ProdSpec[] pdSpecs = ProdSpec.values();
	for(ProdSpec ps : pdSpecs){
		pageContext.setAttribute("ps", ps);
	
%>
		<li class="nav-link nav flex">
	      	<a class="p-1" style="color:black; font-size:20px; font-weight:bold;" href="specList.do?pSpec=${ps.name()}">${ps.getValue()}</a>
	    </li>
<%} // for문 %>
	  </ul>
</div>  
      <c:if test="${sessionScope.isLogin != null}">
        <li class="nav-item mt-3" style="color:black; font-weight:bold; line-height:40px; margin-left:20px;">
          ${sessionScope.name}님
        </li>
      </c:if>  
      <c:if test="${sessionScope.isLogin == null}">
        <li class="nav-item mt-3">
          <a class="nav-link" style="font-weight:bold; color:black;" href="userLogin.do">로그인</a>
        </li>
        <li class="nav-item mt-3">
          <a class="nav-link" style="font-weight:bold" href="userJoin.do">회원가입</a>
        </li>
      </c:if>
      <c:if test="${sessionScope.isLogin != null && sessionScope.memberInfo == 'user'}">
        <li class="nav-item mt-3">
          <a class="nav-link" style="font-weight:bold" href="userLogout.do">로그아웃</a>
        </li>
      </c:if>
      <c:if test="${sessionScope.isLogin != null && sessionScope.memberInfo == 'admin'}">
        <li class="nav-item mt-3" style="font-weight:bold">
          <a class="nav-link" href="shoesAdLogout.do">관리자 로그아웃</a>
        </li>
      </c:if>
      <c:if test="${sessionScope.isLogin !=null }">
        <li class="nav-item mt-3">
          <a class="nav-link" style="font-weight:bold; color:black;" href="cartList.do">장바구니</a>
        </li>
      </c:if>
      <c:if test="${sessionScope.isLogin ==null }">
        <li class="nav-item mt-3">
          <a class="nav-link" style="font-weight:bold; color:black;" href="javascript:alert('로그인이 필요합니다')">장바구니</a>
        </li>
      </c:if>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mt-3" style="font-weight:bold" href="#" role="button" 
          	data-bs-toggle="dropdown">프로필</a>
          <c:if test="${sessionScope.isLogin !=null && sessionScope.memberInfo == 'admin'}">	
          <ul class="dropdown-menu">
        	<li><a class="dropdown-item" href="shoesAdMain.do">관리자 페이지</a></li>
          </ul>
          </c:if>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div style="background-color:black; height:30px;">
</div>
</header>