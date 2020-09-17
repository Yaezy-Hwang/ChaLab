<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>이름을 뭐라고 해야할지</title>
<link href="${pageContext.request.contextPath}/assets/css/home.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div id="wrap">
		<div id="header">
			<img src="${pageContext.request.contextPath}/assets/image/스포츠의학대학원.png" alt="Logo">

		</div>
		<!--header-->

		<div id="body">
			<div id="loginForm">
				<form action="${pageContext.request.contextPath}/user/login" method="get">

					<!-- 아이디 -->
					<div class="form-group">
						<label class="form-text" for="input-uid">ID</label>
						<input type="text" id="input-uid" name="id" value="" placeholder="ID">
					</div>
					<br>
					<!-- 비밀번호 -->
					<div class="form-group">
						<label class="form-text" for="input-pass">PW</label>
						<input type="text" id="input-pass" name="pw" value="" placeholder="PASSWORD">
					</div>
					<div class="center">
						<c:if test="${param.login eq 'fail'}">
							가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.
						</c:if>
					</div>
					<!-- 버튼영역 -->
					<div class="button-area">
						<button type="submit" id="btn-submit">로그인</button>
					</div>

				</form>
			</div>
			<!-- //loginForm -->
			
		</div>
		<!-- body -->

		<c:import url= "/WEB-INF/views/include/footer.jsp"></c:import>
		<!-- footer -->

	</div>
	<!-- wrap -->


</body>

</html>