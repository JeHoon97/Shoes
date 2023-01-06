<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="user_top.jsp" %>
<c:if test="${requestScope.msg !=null }">
	<script>
		alert("${requestScope.msg}")
	</script>
</c:if>    
<div class="container mt-5 border shadow p-5" style="width:500px; height:400px;">
	<h3 class="text-center">로그인</h3>
	<form action="${ctx}/userLoginOk.do" method="post">
		<div class="mt-3 mb-3">
			<label for="id">아이디</label>
			<input type="text" class="form-control" id="id" placeholder="ID" name="id"/>
		</div>
		<div class="mb-3">
			<label for="pw">비밀번호</label>
			<input type="password" class="form-control" id="pw" placeholder="password" name="pw"/>
		</div>
		<div class="text-center p-5">
			<input type="submit" class="btn btn-sm btn-success" value="로그인"/>
			<input type="button" class="btn btn-sm btn-secondary" 
				value="회원가입" onclick="javascript:window.location='userJoin.do'"/>
		</div>
	</form>
</div>
</br>
<%@ include file="user_bottom.jsp" %>

