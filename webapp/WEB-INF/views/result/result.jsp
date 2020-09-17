<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>이름을 뭐라고 해야할지</title>

<link href="${pageContext.request.contextPath}/assets/css/home.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/result.css"
	rel="stylesheet" type="text/css">

</head>

<body>
	<div id="wrap">
		<div id="header">
			<img
				src="${pageContext.request.contextPath}/assets/image/스포츠의학대학원.png"
				alt="Logo">
			<form>
				<ol>
					<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
					<li><a href="${pageContext.request.contextPath}/user/modify">회원정보수정</a></li>
				</ol>
			</form>
		</div>
		<!-- //header -->

		<div id="contents">
			<div id="aside">
				<h2>Medical Record</h2>
				<ol>
					<li>2019.11</li>
					<li>2019.12</li>
					<li>2020.01</li>
					<li>2020.02</li>
					<li>2020.03</li>
				</ol>
			</div>
			<!-- //aside -->


			<div id="table">
				<!-- 페이지마다 달라지는 영역 -->
				<table style="margin-left: auto; margin-right: auto;">
					<colgroup>
						<col style="width: 100px;">
						<col style="width: 100px;">
						<col style="width: 200px;">
					</colgroup>
					<tr>
						<th rowspan="4"><img
							src="${pageContext.request.contextPath}/assets/image/사진.png"
							width="100px"></th>
						<th>이름</th>
						<td>${authUser.name}</td>
					</tr>

					<tr>
						<th>신장</th>
						<td>${userInfo.height} cm</td>
					</tr>

					<tr>
						<th>체중</th>
						<td>${userInfo.weight} kg</td>
					</tr>

					<tr>
						<th>담당자</th>
						<td>${userInfo.adminName}</td>
					</tr>

				</table>

				<div id="graph">
					<img src="${pageContext.request.contextPath}/assets/image/그래프.png"
						width="465px">
				</div>
				<!-- graph -->
				
				<table>
					<tr>
						<td>SPEED</td><td>0.0</td><td>2.0</td><td>2.5</td><td>3.0</td><td>3.5</td><td>4.0</td><td>/5min</td>
					</tr>
					<tr>
						<td>LACITC ACID</td>
					</tr>
					<tr>
						<td>HEART RATE</td>
					</tr>
				
				</table>
			</div>


			<div id="footer">
				<p>copyright (c) 2020 황예지. all rights reserved</p>
			</div>
			<!-- footer -->
		</div>
		<!-- content -->

	</div>
	<!-- wrap -->
</body>

</html>