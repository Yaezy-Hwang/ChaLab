<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>

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

<link href="${pageContext.request.contextPath}/assets/css/reset.css"  rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet" type="text/css">



</head>

	<div id="container" class="clearfix">
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!-- //header -->

		<div id="aside">
			<h2>기록 하기</h2>
			<ol>

			</ol>
		</div>
		<!-- //aside -->

		<div class="contents-wrapper">
			<h2>측정 기록 하기</h2>
			<div class="record-wrapper">
				<table>
					<tr>
						<th>NAME</th>
						<td>${athInfo.name} (${athInfo.gender})</td>
						<th>WEIGHT</th>
						<td>${athInfo.weight} kg</td>
						<th>DATE</th>
						<td>${today}</td>
					</tr>
					<tr>
						<th>SPORT</th>
						<td>${athInfo.field}</td>
						<th>HEIGHT</th>
						<td>${athInfo.height} cm</td>
						<th>LOCATION</th>
						<td>스포츠의학대학원</td>
					</tr>					
				</table>
				
				<form action="${pageContext.request.contextPath}/result/recording/${athInfo.userNo}" method="get">
					<table>
						<tr>
							<th>속도</th>
							<th>안정시</th>
							<th>2.0</th>
							<th>2.5</th>
							<th>3.0</th>
							<th>3.5</th>
							<th>4.0</th>
							<th>4.5</th>
							<th>5.0</th>
							<th>/5min</th>
						</tr>
						<tr id="lactate">
							<th>젖산</th>
							<td><input type="number" name="lacStable" step="0.1"></td>
							<td><input type="number" name="lac20" step="0.1"></td>
							<td><input type="number" name="lac25" step="0.1"></td>
							<td><input type="number" name="lac30" step="0.1"></td>
							<td><input type="number" name="lac35" step="0.1"></td>
							<td><input type="number" name="lac40" step="0.1"></td>
							<td><input type="number" name="lac45" step="0.1"></td>
							<td><input type="number" name="lac50" step="0.1"></td>
							<td><input type="number" name="lac5min" step="0.1"></td>
						</tr>
						<tr id="heartRate">
							<th>심박수</th>
							<td><input type="number" name="heartStable" step="0.1"></td>
							<td><input type="number" name="heart20" step="0.1"></td>
							<td><input type="number" name="heart25" step="0.1"></td>
							<td><input type="number" name="heart30" step="0.1"></td>
							<td><input type="number" name="heart35" step="0.1"></td>
							<td><input type="number" name="heart40" step="0.1"></td>
							<td><input type="number" name="heart45" step="0.1"></td>
							<td><input type="number" name="heart50" step="0.1"></td>
							<td><input type="number" name="heart5min" step="0.1"></td>
						</tr>
					</table>
					<button type="submit" class="btnMain">저장</button>
				</form>		
	
				</div>
		</div>
		<!-- contents-wrapper -->
		
	</div>
	<!-- container -->

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- footer -->
</body>
<script type="text/javascript">
$("button[type='submit']").on("click",function(){

	$("#lactate input").each(function(index, item){
		if(!$(item).val()){
			$(item).val(0);
		}
	})
	
	$("#heartRate input").each(function(index, item){
		if(!$(item).val()){
			$(item).val(0);
		}
	})

	
});




</script>

</html>