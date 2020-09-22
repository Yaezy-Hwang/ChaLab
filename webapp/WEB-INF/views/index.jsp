<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>이름을 뭐라고 해야할지</title>

<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/assets/css/home.css" rel="stylesheet" type="text/css">

</head>

<body>
		<header id="header">
			<a href="${pageContext.request.contextPath}/main">
				<img src="${pageContext.request.contextPath}/assets/image/스포츠의학대학원.png" alt="Logo">
			</a>
		</header>
	<div id="container">
		<!--header-->

		<div class="wrapper">
			<div id="loginForm">
				<c:choose>
					<c:when test="${empty authUser}">
						<form action="${pageContext.request.contextPath}/user/login" method="post">
		
							<!-- 아이디 -->
							<div class="form-group">
								<label class="form-text" for="input-uid">ID</label> <input
									type="text" id="input-uid" name="id" value="" placeholder="ID">
							</div>
							<br>
							<!-- 비밀번호 -->
							<div class="form-group">
								<label class="form-text" for="input-pass">PW</label> <input
									type="password" id="input-pass" name="pw" value=""
									placeholder="PASSWORD">
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
					</c:when>
					
					<c:otherwise>
						<div>
							<a href="${pageContext.request.contextPath}/admin/admin-main">ADMIN 페이지로 이동</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- //loginForm -->
		</div>
		<!-- body -->

	</div>
	<!-- wrap -->

		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!-- footer -->


</body>

</html>