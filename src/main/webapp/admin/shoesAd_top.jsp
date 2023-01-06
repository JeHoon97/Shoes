<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>                                         
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<header>

<nav class="navbar navbar-expand-sm bg-light navbar-light">
  <div class="container" style="height:80px;">
    <a class="navbar-brand" href="${ctx}"><b>Shoes97</b></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" style="font-weight:bold; color:black;" href="adminCatInput.do"><b>카테고리등록</b></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" style="font-weight:bold;" href="catAllList.do"><b>카테고리리스트</b></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" style="font-weight:bold; color:black;" href="prodInput.do"><b>상품등록</b></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" style="font-weight:bold;" href="prodList.do"><b>상품리스트</b></a>
        </li>  
        <li class="nav-item dropdown ms-auto">
          <a class="nav-link dropdown-toggle" href="#" role="button" 
          	data-bs-toggle="dropdown" style="font-weight:bold; color:black;">ProFil</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" style="font-weight:bold;" href="shoesAdMain.do">MyPage</a></li>
            
            <c:if test="${sessionScope.isLogin == null}">
            	<li><a class="dropdown-item" style="font-weight:bold;" href="shoesAdLogin.do">Login</a></li>
            </c:if>
            <c:if test="${sessionScope.isLogin != null}">
            	<li><a class="dropdown-item" style="font-weight:bold;" href="shoesAdLogout.do">Logout</a></li>
            </c:if>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div style="background-color:black; height:25px;">
</div>

</header>