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

		<c:import url="/WEB-INF/views/includes/admin-aside.jsp"></c:import>
		<!-- //aside -->

		<div class="contents-wrapper">
			<h2>선수 관리</h2>

			<table id="athlete-list">
				<tr>
					<th>이름</th>
					<th>종목</th>
					<th>담당자</th>
					<th></th>
				</tr>
				<c:forEach items="${athleteMap.athList}" var="athlete">
					<tr>
						<td>
							${athlete.name} (${athlete.userId}) 
							<c:if test="${athlete.gender eq 'male'}">
								<i class="fas fa-mars"></i>
							</c:if>
							<c:if test="${athlete.gender eq 'female'}">
								<i class="fas fa-venus"></i>
							</c:if>
						</td>
						<td>${athlete.field}</td>
						<td>${athlete.adminName}</td>
						<td class="td-icon"><i class="fas fa-cog" onclick="showAthInfo(${athlete.userNo});"></i></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- contents-wrapper -->

	</div>
	<!-- container -->

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- footer -->


<!-- 모달 -->
	<div class="modal-layer hide-off" id="athleteInfo">
		<div class="modal-wrapper">
			<div class="modal-content">
				<p><i class="fas fa-times" onclick="forceHideModal('#athleteInfo')"></i></p>
				<h2>· Athlete Info ·</h2>
				<div>
					<table>
						<tr>
							<th colspan="4">RESPONSIBILITY
								<select name="adminNo">
								</select>
							</th>
						</tr>
						<tr>
							<th>NAME</th>
							<td><input type="text" name="name" disabled></td>
							<th>ID</th>
							<td id="userId"></td>
						</tr>
						<tr>
							<th>SPORTS</th>
							<td><input type="text" name="field" disabled></td>
							<th>GENDER</th>
							<td id="gender">Male</td>
						</tr>
						<tr>
							<th>HEIGHT</th>
							<td><input type="number" step="0.1" name="height" disabled>cm</td>
							<th>WEIGHT</th>
							<td><input type="number" step="0.1" name="weight" disabled>kg</td>
						</tr>
						<tr>
							<th>PW</th>
							<td><input type="password" name="pw" disabled></td>
						</tr>
						<tr class="tr-pwCheck">
							<th>PW-Check</th>
							<td><input type="password" id="pwCheck" placeholder="비밀번호 확인"></td>
						</tr>
					</table>
					<button id="modifyAthlete" data-userno="">정보수정</button>
				</div>
			
			</div>
		</div>
	</div>
	
	<!-- test 모달 -->
	<div class="modal-layer hide-off" id="testModal">
		<div class="modal-wrapper">
			<div class="modal-content">
				모다아알
			</div>
			<div class="modal-btn-area">
				<button type="button" class="modal-cancel"
					onclick="forceHideModal('#testModal')">닫기</button>
				<button type="button" class="modal-confirm" onclick="">확인</button>
			</div>
		</div>
	</div>

</body>

<script type="text/javascript">

/* 정보 수정 클릭 */
$(".modal-content").on("click", "#modifyAthlete", function(){
	$(this).text("수정완료");
	$(this).attr("id","modifyComplete");
	
	$("select[name='adminNo'] option").prop('disabled', false);
	$("#athleteInfo input").prop('disabled', false);
	$(".tr-pwCheck").css("visibility", "visible");
	
});

/* 수정 완료 클릭 */
$(".modal-content").on("click", "#modifyComplete", function(){
	
	var name = $("input[name='name']").val();
	var field = $("input[name='field']").val();
	var pw = $("input[name='pw']").val();
	var pwCheck = $("#pwCheck").val();
	var height = $("input[name='height']").val();
	var weight = $("input[name='weight']").val();
	var adminNo = $("select[name='adminNo']").val();
	var userNo = $(this).data('userno');
	
	//이름을 입력해 주세요
	if(!name){
		alert("이름 입력해주세요");
		return false;
	}

	//종목을 입력해 주세요
	if(!field){
		alert("종목을 입력해 주세요");
		return false;
	}
	
	//키를 입력해 주세요
	if(!height){
		alert("키를 입력해 주세요");
		return false;
	}	
	
	//체중을 입력해 주세요
	if(!weight){
		alert("체중을 입력해 주세요");
		return false;
	}
	
	//패스워드를 입력해 주세요
	if(!pw){
		alert("패스워드를 입력해주세요");
		return false;
	}
	
	//패스워드가 일치하지 않습니다
	if( pw != pwCheck ){
		alert("패스워드가 일치하지 않습니다");
		return false;
	}

	var userVo = {
		userNo : userNo,
		adminNo: adminNo,
		name: name,
		field: field,
		pw: pw,
		height: height,
		weight: weight
		}
	
	//데이터 전송
	$.ajax({
		//보낼 때 옵션
		url : "${pageContext.request.contextPath}/admin/modifyAthInfo",
		type : "post",
		data: userVo,
				
		//받을 때 옵션
		dataType : "json",
		success : function(result) {
			
			if(result){
				alert("선수 정보가 수정되었습니다 :) ");
				forceHideModal('#athleteInfo');
				location.reload(true);
			}else {
				alert("관리자에게 문의 바랍니다 :( ");
			}
			
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	})
	
	$(this).text("정보수정");
	$(this).attr("id","modifyAthlete");
	
	$("select[name='adminNo'] option").prop('disabled', true);
	$("#athleteInfo input").prop('disabled', true);
	$(".tr-pwCheck").css("visibility", "hidden");
	
});

/* 모달에 값 넣기 */
function showAthInfo(userNo){
	console.log("adsfsdf");
	
	//데이터 전송
	$.ajax({
		//보낼 때 옵션
		url : "${pageContext.request.contextPath}/admin/getAthlInfo",
		type : "post",
		data : {userNo: userNo},
				
		//받을 때 옵션
		dataType : "json",
		success : function(info) {
			console.log(info);
			
			$("input[name='name']").val(info.name);
			$("td#userId").text(info.userId);
			$("td#gender").text(info.gender);
			$("input[name='field']").val(info.field);
			$("input[name='height']").val(info.height);
			$("input[name='weight']").val(info.weight);
			$("input[name='pw']").val(info.pw);
			$("button#modifyAthlete").data("userno", info.userNo);
			
			var str = '';
			<c:forEach items="${athleteMap.adminList}" var="admin">
				var userNo = ${admin.userNo}
				if( info.adminNo == userNo ){
					str += '<option value="'+userNo+'" disabled selected>${admin.name}</option>';
				}else {
					str += '<option value="'+userNo+'" disabled>${admin.name}</option>';
				}
			</c:forEach>
			
			$("select[name='adminNo']").append(str);
			
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	})
	
	showModal('#athleteInfo');
	
};




</script>

</html>