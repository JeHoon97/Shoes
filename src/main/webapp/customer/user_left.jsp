<%@page import="ez.web.util.ProdSpec"%>
<%@page import="ez.web.model.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ez.web.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <div class="">
<aside class="" style="width:100px; color:black;">
	<h5 style="color:black; font-weight:bold;">카테고리</h5>
	  <ul class="nav flex-column">
<%
	CategoryDAO cDao = CategoryDAO.getInstance();
	ArrayList<CategoryDTO> cDtos = cDao.categoryList();
	
	if(cDtos !=null || cDtos.size() !=0){
		for(CategoryDTO cDto : cDtos){
			String catName = cDto.getCatName();
			String code = cDto.getCode(); 
	%>					
	    <li class="nav-item">
	      <a style="color:black;" href="categoryList.do?code=<%=code%>&catName=<%=catName%>"><%=catName%></a>
	    </li>
	<%	} // for문
	}else{ 
		out.println("<li class='nav-item'>카테고리가 없습니다!!!!</li></ul>");
	}// if문
	
	out.println("<ul class='nav flex-column mt-3'>");
	ProdSpec[] pdSpecs = ProdSpec.values();
	for(ProdSpec ps : pdSpecs){
		pageContext.setAttribute("ps", ps);
	
%>
		<li class="nav-item">
	      <a class="" style="color:black;" href="specList.do?pSpec=${ps.name()}">${ps.getValue()}</a>
	    </li>
<%} // for문 %>
	  </ul>
</aside>
</div> --%>