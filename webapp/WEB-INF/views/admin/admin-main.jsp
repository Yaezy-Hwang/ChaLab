<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>이름을 뭐라고 해야할지</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/image/favicon.ico"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome/all.css">

<!-- 반드시 넣어야 하는 2가지 js -->
<script	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/modal.js"></script>

<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/admin.css"	rel="stylesheet" type="text/css">

</head>

<body>
	<div id="container" class="clearfix">
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!-- //header -->

		<div id="aside">
			<h2>선수관리</h2>
			<ol>
				<li><a href="">선수관리</a></li>
			</ol>
		</div>
		<!-- //aside -->

		<div class="contents-wrapper">
			<h2>선수 관리</h2>

			<table id="athlete-list">
				<tr>
					<th>이름</th>
					<th>종목</th>
					<th></th>
				</tr>
				<!-- 반복시작 -->
				<tr>
					<td class="name">김이름 <i class="fas fa-venus"></i></td>
					<td class="field">펜싱</td>
					<td><button type="button" onclick="showModal('#testModal');">정보수정</button></td>
				</tr>
				<tr>
					<td>김이름 <i class="fas fa-mars"></i></td>
					<td>펜싱</td>
					<td><button type="button">정보수정</button></td>
				</tr>
				<tr>
					<td>김이름 <i class="fas fa-venus"></i></td>
					<td>펜싱</td>
					<td><button type="button">정보수정</button></td>
				</tr>
				<!-- 반복 끝 -->
			</table>
		</div>
		<!-- contents-wrapper -->


	</div>
	<!-- container -->

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- footer -->


<!-- 모달 -->
	<div class="modal-layer hide-off" id="testModal">
		<div class="modal-wrapper">
			<div class="modal-content">
				모다아알
			</div>
			<div class="modal-btn-area">
				<button type="button" class="modal-cancel"
					onclick="forceHideModal('#testModal')">취소</button>
				<button type="button" class="modal-confirm" onclick="">확인</button>
			</div>
		</div>
	</div>

</body>

</html>