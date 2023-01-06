<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<c:set var="cnt" value="${cnt+1}"/>
<div class="card <c:if test="${cnt%8 != 0}">me-4</c:if>" style="width:180px">
	<a href="prodView.do?pNum=${pDto.pNum}&pSpec=${pDto.pSpec}" style="overflow:hidden; height:120px;">
    	<img class="card-img-top" src="${ctx}/uploadedFile/${pDto.pImage}" alt="Card image" 
    	style="width:100%;">
    </a>	
    <div class="card-body">
      <h4 class="card-title" style="font-size:15px; color:gray; overflow:hidden; text-overflow:ellipsis; 
	      	white-space:nowrap;"><b>${pDto.pName}</b></h4>
      <p class="card-text" style="font-size:15px; font-weight:bold;">가격 : <fmt:formatNumber type="Number" value="${pDto.price}"/>원</p>
      <p class="card-text" style="font-size:14px;">포인트 : <fmt:formatNumber value="${pDto.pPoint}"/>P</p>
      <!-- 로그인이 되었을 경우 -->
      <c:if test="${sessionScope.isLogin !=null}">
      <a href="cartAdd.do?pNum=${pDto.pNum}&pQty=1&pSpec=${pDto.pSpec}&pCategory_fk=${requestScope.code}" 
      	class="btn btn-outline-success" style="width:100%;">장바구니 담기</a>
      </c:if>	
      <!-- 로그인이 안되었을 경우 -->
      <c:if test="${sessionScope.isLogin == null}">
      <a href="javascript:alert('로그인이 필요합니다')" 
      	class="btn btn-outline-success" style="width:100%;">장바구니 담기</a>
      </c:if>	
    </div>
</div>
<c:if test="${cnt%8 ==0}">
	<div class="d-flex mt-3"></div>
</c:if>