<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

		<header id="header">
			<a href="${pageContext.request.contextPath}/main">
				<img src="${pageContext.request.contextPath}/assets/image/스포츠의학대학원.png" alt="Logo">
			</a>
			<nav>
				<ul>
					<li><a href="${pageContext.request.contextPath}/admin/manageUser">선수관리</a></li>
					<%-- 					
					<li><a href="${pageContext.request.contextPath}/admin/recording">측정기록</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/recordsView">기록보기</a></li>
					 --%>
					<li id="userId">
						${authUser.userId}<i class="fas fa-sort-down"></i>
					</li>
				</ul> <!-- 외부 리스트 끝 -->
			</nav>
		</header>
		
<script type="text/javascript">

$(document).ready(function () {
    $(window).on("click", function () {
        $(".btn-userPop").remove();

    });
});

$("#userId").on("click", function(){
	event.stopPropagation();
	$(".btn-userPop").remove();
   	
	$(this).prepend(
				'<ul class="btn-userPop">' +
		        '    <li><a href="${pageContext.request.contextPath}/user/modify" >회원정보</a></li>' +
		        '    <li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>' +
		        '</ul>'
           );
});

</script>