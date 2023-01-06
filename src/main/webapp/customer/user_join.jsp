<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="user_top.jsp" %>
<c:if test="${requestScope.msg !=null }">
	<script>
		alert("${requestScope.msg}")
	</script>
</c:if>  
<div class="container mt-5 w-50 border shadow p-5">
	<h3 style="margin-left:310px;">회원 가입</h3>
	<form action="userJoinOk.do" method="post" name="joinForm">
		<div class="mt-3 mb-3">
			<label for="id">아이디</label>
			<input type="text" class="form-control" id="id" placeholder="아이디" name="id"/>
		</div>
		<div class="mb-3">
			<label for="pw">비밀번호</label>
			<input type="password" class="form-control" id="pw" placeholder="비밀번호" name="pw"/>
		</div>
		<div class="mb-3">
			<label for="pwConfirm">비밀번호 확인</label>
			<input type="password" class="form-control" id="pwConfirm" placeholder="비밀번호 확인" name="pwConfirm"/>
		</div>
		<div class="mb-3">
			<label for="name">이름</label>
			<input type="text" class="form-control" id="name" placeholder="이름" name="name"/>
		</div>
		<div class="mb-3">
			<label for="tel">전화번호</label>
			<input type="text" class="form-control" id="tel" placeholder="전화번호" name="tel"/>
		</div>
		<div class="mb-3">
			<label for="email">이메일</label>
			<input type="text" class="form-control" id="email" placeholder="이메일" name="email"/>
		</div>
		<div class="mb-3">
			<label for="addr">주소</label>
			<input type="text" class="form-control" id="addr" placeholder="주소" name="addr"/>
		</div>
		
		<div class="text-center">
			<input type="button" class="btn btn-sm btn-success" value="회원가입" onclick="inputChk()"/>
			<input type="reset" class="btn btn-sm btn-secondary" value="취소"/>
		</div>
	</form>
</div>	
<%@ include file="user_bottom.jsp" %>