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
			<h2>선수 등록</h2>
			<form action="${pageContext.request.contextPath}/user/signUp" method="get">
				<div class="signUp-wrapper">
					<table>
						<tr>
							<th colspan="2">RESPONSIBILITY
								<select name="adminNo">
									<option value="">담당자 선택</option>
									<!-- 반복 -->
									<option value="6">손주연</option>
									<option value="2">손수정</option>
									<option value="3">손정범</option>
									<!-- 반복끝 -->
								</select>
							</th>
						</tr>
						<tr>
							<th>ID</th>
							<td colspan="2">
								<input type="text" name="userId" placeholder="아이디">
								<button type="button" id="idCheck" class="btnMain">중복 확인</button>
							</td>
							<td>
								<p class="errMsg">이미 사용 중인 아이디 입니다.</p>
			                    <p class="emtMsg">사용 불가한 아이디 입니다.</p>
			                    <p class="okMsg">사용 가능한 아이디 입니다.</p>
							</td>
						</tr>
						<tr>
							<th>PW</th>
							<td><input type="password" name="pw" placeholder="비밀번호"></td>
						</tr>
						<tr>
							<th>PW-Check</th>
							<td><input type="password" id="pwCheck" placeholder="비밀번호 확인"></td>
						</tr>
						<tr>
							<th>NAME</th>
							<td><input type="text" name="name" placeholder="김이름"></td>
							<th>GENDER</th>
							<td>
								<input type="radio" id="male" name="gender" value="male">
			                    <label for="male" class="gender-label">Male</label>
			                    <input type="radio" id="remale" name="gender" value="female">
			                    <label for="remale" class="gender-label">Female</label>
							</td>
						</tr>
						<tr>
							<th>SPORTS</th>
							<td><input type="text" name="field" placeholder="종목"></td>
						</tr>
						<tr>
							<th>HEIGHT</th>
							<td><input type="number" step="0.1" name="height" placeholder="000.0">cm</td>
							<th>WEIGHT</th>
							<td><input type="number" step="0.1" name="weight" placeholder="00.0">kg</td>
						</tr>
					</table>
				</div>
				<button type="submit" id="btn-signUp" class="btnMain">등록하기</button>
			</form>
		
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
<script type="text/javascript">

	//아이디 중복체크 변수 선언
	var uniqueId = false;

    $(document).ready(function (){
       $(".errMsg").hide();
       $(".okMsg").hide();
       $(".emtMsg").hide();
    });


    // 아이디 체크
    $("#idCheck").on("click", function(){
        // 데이터 받아와서 확인하기
        var newId = $("input[name='userId']").val();
		
		$.ajax({
			
			url : "${pageContext.request.contextPath}/user/idCheck",		
			type : "post",
			data : {newId: newId},

			dataType : "json",
			success : function(result){
				console.log(result);
				
				/*성공시 처리해야될 코드 작성*/
				if(result == false){
					//중복 아이디인 경우
			        $(".errMsg").show();
			        $(".emtMsg").hide();
			        $(".okMsg").hide();
				} else{
					if(newId == ""){
						//공란인경우
				        $(".errMsg").hide();
						$(".emtMsg").show();
				        $(".okMsg").hide();
					}else {
					//사용가능한 아이디인 경우
					$(".errMsg").hide();
					$(".emtMsg").hide();
			        $(".okMsg").show();
			        uniqueId = true;
					}
				}
				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			} 
		})

    });
    
    $("#btn-signUp").on("click", function(){
    	
   		//담당자를 확인 해 주세요
   		if($("select[name='adminNo']").val() == ""){
   			alert("담당자를 확인 해 주세요");
   			return false;
   		}

		//아이디를 입력해 주세요
		if(!$("input[name='userId']").val()){
			alert("아이디를 입력해주세요");
			return false;
		}
		
		// 아이디 중복체크를 해주세요
		if(uniqueId == false){
			alert("아이디 중복체크를 해주세요");
			return false;
		}
		
		//패스워드를 입력해 주세요
		if(!$("input[name='pw']").val()){
			alert("패스워드를 입력해주세요");
			return false;
		}
		
		//패스워드가 일치하지 않습니다
		if($("input[name='pw']").val() != $("#pwCheck").val()){
			alert("패스워드가 일치하지 않습니다");
			return false;
		}

		//이름을 입력해 주세요
		if(!$("input[name='name']").val()){
			alert("이름 입력해주세요");
			return false;
		}
		
		//성별을 선택해 주세요
		if(!$("input[name='gender']:checked").val()){
			alert("성별을 선택해 주세요");
			return false;
		}
		
		//종목을 입력해 주세요
		if(!$("input[name='field']").val()){
			alert("종목을 입력해 주세요");
			return false;
		}
		
		//키를 입력해 주세요
		if(!$("input[name='height']").val()){
			alert("키를 입력해 주세요");
			return false;
		}	
		
		//체중을 입력해 주세요
		if(!$("input[name='weight']").val()){
			alert("체중을 입력해 주세요");
			return false;
		}
		
		alert("선수 등록이 완료 되었습니다 :)");
	});
    
</script>


</html>