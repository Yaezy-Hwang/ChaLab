<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, first-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>이름을 뭐라고 해야할지</title>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/image/favicon.ico"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome/all.css">

<!-- 반드시 넣어야 하는 2가지 js -->
<script	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/modal.js"></script>

<%--차트--%>
<script src="${pageContext.request.contextPath}/assets/js/chart/dist/Chart.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/chart/dist/Chart.min.css">

<link href="${pageContext.request.contextPath}/assets/css/reset.css"  rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet" type="text/css">

</head>

	<div id="container" class="clearfix">
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!-- //header -->

		<div id="aside">
			<h2>측정 날짜</h2>
			<c:if test="${ !empty resultMap.dateList }">
				<button id="createGraph">그래프 생성</button>
			</c:if>
			<ol>
				<!-- 반복시작 -->
				<c:forEach items="${resultMap.dateList}" var="date">
					<c:choose>
						<c:when test="${date eq resultMap.firstLac.measureDate or date eq resultMap.recentLac.measureDate}">
							<li>
								<input type="checkbox" id="${date.resultNo}" checked>
								<label for="${date.resultNo}">${date.measureDate}</label>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<input type="checkbox" id="${date.resultNo}">
								<label for="${date.resultNo}">${date.measureDate}</label>
							</li>
						</c:otherwise>
					</c:choose>
				
				</c:forEach>
				<!-- 반복 끝 -->
				
			</ol>
		</div>
		<!-- //aside -->

		<div class="contents-wrapper">
			<h2>측정 기록 보기</h2>
			<div class="result-wrapper">
				<table>
					<tr>
						<th>NAME</th>
						<td>${resultMap.athInfo.name} (${resultMap.athInfo.gender})</td>
						<th>WEIGHT</th>
						<td>${resultMap.athInfo.weight} kg</td>
					</tr>
					<tr>
						<th>SPORT</th>
						<td>${resultMap.athInfo.field}</td>
						<th>HEIGHT</th>
						<td>${resultMap.athInfo.height} cm</td>
					</tr>					
				</table>
								
				<div id="graph">
				</div>
				
				
				<c:choose>
					<c:when test="${!empty resultMap.firstLac}">
						<table class="firstResult">
							<thead>
								<tr>
									<th colspan="3">${resultMap.firstLac.measureDate}</th>
								</tr>
								<tr>
									<th>속도</th>
									<th>젖산</th>
									<th>심박수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>안정시</th>
									<td>${resultMap.firstLac.lacStable}</td>
									<td>${resultMap.firstHR.heartStable}</td>
								</tr>
								<tr>
									<th>2.0</th>
									<td>${resultMap.firstLac.lac20}</td>
									<td>${resultMap.firstHR.heart20}</td>
								</tr>
								<tr>
									<th>2.5</th>
									<td>${resultMap.firstLac.lac25}</td>
									<td>${resultMap.firstHR.heart25}</td>
								</tr>
								<tr>
									<th>3.0</th>
									<td>${resultMap.firstLac.lac30}</td>
									<td>${resultMap.firstHR.heart30}</td>
								</tr>
								<tr>
									<th>3.5</th>
									<td>${resultMap.firstLac.lac35}</td>
									<td>${resultMap.firstHR.heart35}</td>
								</tr>
								<tr>
									<th>4.0</th>
									<td>${resultMap.firstLac.lac40}</td>
									<td>${resultMap.firstHR.heart40}</td>
								</tr>
								<tr>
									<th>4.5</th>
									<td>${resultMap.firstLac.lac45}</td>
									<td>${resultMap.firstHR.heart45}</td>
								</tr>
								<tr>
									<th>5.0</th>
									<td>${resultMap.firstLac.lac50}</td>
									<td>${resultMap.firstHR.heart50}</td>
								</tr>
								<tr>
									<th>/5min</th>
									<td>${resultMap.firstLac.lac5min}</td>
									<td>${resultMap.firstHR.heart5min}</td>
								</tr>
							</tbody>
						</table>
					</c:when>
					
					<c:otherwise>
						<p>아직 첫번째 테스트 전입니다.</p>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${!empty resultMap.recentLac}">
						<table class="secondResult">
							<thead>
								<tr>
									<th colspan="3">${resultMap.recentLac.measureDate}</th>
								</tr>
								<tr>
									<th>속도</th>
									<th>젖산</th>
									<th>심박수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>안정시</th>
									<td>${resultMap.recentLac.lacStable}</td>
									<td>${resultMap.recentHR.heartStable}</td>
								</tr>
								<tr>
									<th>2.0</th>
									<td>${resultMap.recentLac.lac20}</td>
									<td>${resultMap.recentHR.heart20}</td>
								</tr>
								<tr>
									<th>2.5</th>
									<td>${resultMap.recentLac.lac25}</td>
									<td>${resultMap.recentHR.heart25}</td>
								</tr>
								<tr>
									<th>3.0</th>
									<td>${resultMap.recentLac.lac30}</td>
									<td>${resultMap.recentHR.heart30}</td>
								</tr>
								<tr>
									<th>3.5</th>
									<td>${resultMap.recentLac.lac35}</td>
									<td>${resultMap.recentHR.heart35}</td>
								</tr>
								<tr>
									<th>4.0</th>
									<td>${resultMap.recentLac.lac40}</td>
									<td>${resultMap.recentHR.heart40}</td>
								</tr>
								<tr>
									<th>4.5</th>
									<td>${resultMap.recentLac.lac45}</td>
									<td>${resultMap.recentHR.heart45}</td>
								</tr>
								<tr>
									<th>5.0</th>
									<td>${resultMap.recentLac.lac50}</td>
									<td>${resultMap.recentHR.heart50}</td>
								</tr>
								<tr>
									<th>/5min</th>
									<td>${resultMap.recentLac.lac5min}</td>
									<td>${resultMap.recentHR.heart5min}</td>
								</tr>
							</tbody>
						</table>
					</c:when>
										
					<c:otherwise>
						<p>아직 두번째 테스트 전입니다.</p>
					</c:otherwise>
				</c:choose>

				
	
				</div>
		</div>
		<!-- contents-wrapper -->

	</div>
	<!-- container -->

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- footer -->
</body>
<script type="text/javascript">

$(document).ready(function(){
	 
	var firLacArr = [];
	var firHRArr = [];
	var recentLacArr = [];
	var recentHRArr = [];
	
	firLacArr.puch("${resultMap.}");
	
	
	
	<c:forEach items="${inbodyInfo.inbodyList}" var="graphInfo">
	 
		weightArr.push("${graphInfo.weight}");
		muscleMassArr.push("${graphInfo.muscleMass}");
		percentFatArr.push("${graphInfo.percentFat}");
		bmiArr.push("${graphInfo.bmi}");
 
	</c:forEach>

	var lineChartData = {
		labels : ['안정시', 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, '/5min'],
		datasets : [ {
			label : '체중',
			borderColor : '#cc2121',
			backgroundColor : '#cc2121',
			fill : false,
			data : weightArr,
			yAxisID : 'y-axis-1',
		}, {
			label : '골격근량',
			borderColor : '#008526',
			backgroundColor : '#008526',
			fill : false,
			data : muscleMassArr,
			yAxisID : 'y-axis-1'
		}, {
			label : '체지방',
			borderColor : '#ffc0cb',
			backgroundColor : '#ffc0cb',
			fill : false,
			data : percentFatArr,
			yAxisID : 'y-axis-2'
		}, {
			label : 'BMI',
			borderColor : '#45474d',
			backgroundColor : '#45474d',
			fill : false,
			data : bmiArr,
			yAxisID : 'y-axis-2'
		} ]
	};
	var chartCanvas = document.getElementById("canvas");
	var myLineChart = new Chart(chartCanvas, {
		type : 'line',
		data : lineChartData,
		options : {
			responsive : false,
			hoverMode : 'index',
			stacked : false,
			title : {
				display : true,
				text : '인바디 그래프'
			},
			scales : {
				yAxes : [ {
					type : 'linear',
					display : true,
					position : 'left',
					id : 'y-axis-1',
				}, {
					type : 'linear',
					display : true,
					position : 'right',
					id : 'y-axis-2',

					// grid line settings
					gridLines : {
						drawOnChartArea : false
					},
				} ],
			}
		}
	});

});

$("input[type='checkbox']").on("click", function(){
    var count = $("input[type='checkbox']:checked").length;

    if(count > 2){
            $(this).attr("checked", false);
            alert("측정 결과 비교는 2개까지만 가능해요 :(");
    }
});



</script>

</html>