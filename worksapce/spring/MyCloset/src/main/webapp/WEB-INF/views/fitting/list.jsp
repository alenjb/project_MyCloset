<%@page import="com.mycloset.member.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피팅룸</title>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="/resources/assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet"
	href="/resources/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="/resources/assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="/resources/assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="/resources/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<!-- Page CSS -->

<!-- Helpers -->
<script src="/resources/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="/resources/assets/js/config.js"></script>
<!-- 	jQuery CDN	 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- 열에 마우스 오버될 시 손가락 모양 -->
<style type="text/css">
.fittingOverView:hover {
	background: #eee;
	cursor: pointer;
}

.enrollBtn {
	margin-bottom: 10px;
}

#searchBtn{
	padding:0px 0px 0px 0px;
}
#seachKeyBox{
	padding:4px 0px 0px 0px;
}
</style>
<script type="text/javascript">
	$(function() {
		
		//검색 버튼
		var searchForm = $("#searchForm");
		$("#searchBtn").on("click", function(e) {
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 입력하세요");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		});
		
		// fitting_open_range 업데이트 해주는 함수
		function updateOpenRange() {
			// 항상 boolean 형태로 바꿔주기
			PagePublicBtnCheck = (PagePublicBtnCheck==="true" || PagePublicBtnCheck===true );
			PagePrivateBtnCheck = (PagePrivateBtnCheck==="true" || PagePrivateBtnCheck===true );
			
			if(PagePublicBtnCheck || PagePrivateBtnCheck){ // 만약 public이나 private 둘 중에 활성화 된게 있는 경우
				if(PagePublicBtnCheck && PagePrivateBtnCheck){ // public과 private 둘 다 활성화된 경우
					fitting_open_range="all";
				}else{
					PagePublicBtnCheck ? fitting_open_range="public" : fitting_open_range="private";  // public이 활성화되면 public 아니면 private
				}
			}else{
				fitting_open_range="none";  // 모두 활성화되지 않은 경우
			}
		}
		
		//input 태그의 PagePublicBtnCheck 와 PagePrivateBtnCheck 변경 함수
		function changeInputChecked() {
			$('input[name=publicBtnCheck]').attr('value',PagePublicBtnCheck);
			$('input[name=privateBtnCheck]').attr('value',PagePrivateBtnCheck);
		}
		
		
		//ajax로 fittinglist 가져오기
		function getFittingList() {
			$.ajax({
				url: '/fitting/listOpenRange',
				type: 'GET',				
				data: { 
					"fitting_open_range":fitting_open_range,
					"pageNum":${pageMaker.cri.pageNum},
					"amount":${pageMaker.cri.amount},
					"type":('${pageMaker.cri.type}'!=null) ? '${pageMaker.cri.type}': null,
					"keyword":('${pageMaker.cri.keyword}'!=null) ? '${pageMaker.cri.keyword}': null
				},
				success: function(res) {
					//현재 있는 피팅 비우기
					$('#fitting_main').empty();
					//div 안에 ajax로 가져온 내용 채우기
					for(var i=0;i<res.length;i++) {
						let html = '';
							html += '<div class="col" id="fittingDiv">';
							html += '	<div class="card h-100 fittingOverView">';
							html += '		<img class="card-img-top" src="'+res[i].fitting_image+'"';
							html += '			alt="Card image cap" />';
							html += '		<div class="card-body">';
							html += '			<h5 class="card-title">'+res[i].fitting_name+'</h5>';
							html += '			<p class="card-text">'+res[i].fitting_info+'</p>';
							html += '			<p class="fitting_id" hidden="hidden">'+res[i].fitting_id+'</p>';
							html += '			<p class="fitting_open_range" hidden="hidden">'+res[i].fitting_open_range+'</p>';
							html += '		</div>';
							html += '	</div>';
							html += '</div>';
						$('#fitting_main').append(html);
					}
														
					//피팅사진 클릭하면 이동
					$(".fittingOverView").click(function() {
						location = "view?fitting_id=" + $(this).find(".fitting_id").text()
								+"&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&publicBtnCheck="
								+PagePublicBtnCheck+"&privateBtnCheck="+PagePrivateBtnCheck;
					});					
				},
				error: function() {},
				complete: function() {}
			});//ajax 끝					
		}
		

		//cri에 담겨있던 public버튼 활성화 상태: ${publicBtnCheck}
		//cri에 담겨있던 private버튼 활성화 상태: ${privateBtnCheck}
		//현재 페이지의 public버튼 활성화 상태
		var PagePublicBtnCheck ='${publicBtnCheck}'; 
		//현재 페이지의 private버튼 활성화 상태
		var PagePrivateBtnCheck ='${privateBtnCheck}';
		//공개 범위 all, public, private, none
		var fitting_open_range;
		// public 버튼 활성화 여부 적용
		if(PagePublicBtnCheck=="true"){
			$("#publicCheckbox").prop('checked', true);
		}else{
			$("#publicCheckbox").prop('checked', false);
		}
		// private 버튼 활성화 여부 적용
		if(PagePrivateBtnCheck=="true"){
			$("#privateCheckbox").prop('checked', true);
		}else{
			$("#privateCheckbox").prop('checked', false);
		}
		updateOpenRange();  // 공개범위 초기 설정
		getFittingList();  // 공개범위에 따른 리스트 가져오기
		changeInputChecked();  //input 태그에 담는 check값 변경

		// public 버튼을 눌렀을 때
		$("#publicCheckbox").on("change", function(e) {
			PagePublicBtnCheck = !PagePublicBtnCheck;  // public 버튼 상태 변경
			updateOpenRange();  // 공개범위 업데이트
			getFittingList();  // 업데이트 된 공개범위에 맞게 리스트 가져오기
			changeInputChecked();  //input 태그에 담는 check값 변경
		});
		// private 버튼을 눌렀을 때	
		$("#privateCheckbox").on("change", function(e) {
			PagePrivateBtnCheck = !PagePrivateBtnCheck;  // private 버튼 상태 변경
			updateOpenRange();  // 공개범위 업데이트
			getFittingList();  // 업데이트 된 공개범위에 맞게 리스트 가져오기
			changeInputChecked();  //input 태그에 담는 check값 변경
		});
	}); // $()의 끝
</script>
</head>
<body>
	<%
	LoginVO value = (LoginVO) session.getAttribute("login");
	//session.getAttribute()는 object테이터타입이기에 명시적형변환으로 (String)을 해줘야한다.
	String id = value.getMember_id();
	String grade = value.getMember_grade();
	pageContext.setAttribute("grade", grade);
	%>
<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<!-- Layout container -->
		<div class="layout-container">
			<%@ include file="/resources/js/navBar.jsp" %>
			<div class="layout-page">
			<%@ include file="/resources/js/searchBar_fitting.jsp" %>
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light"></span>피팅룸
						</h4>
						<!-- Grid Card -->
						<!-- 						<h6 class="pb-1 text-muted">public</h6> -->
						<!-- Switches -->
						<div class="card mb-4">
							<div class="card-body">
								<div class="form-check form-switch mb-2 form-check-inline">
									<input class="form-check-input" type="checkbox"
										id="publicCheckbox" /> <label
										class="form-check-label" for="publicCheckbox">public</label>
								</div>
								<div class="form-check form-switch mb-2 form-check-inline">
									<input class="form-check-input" type="checkbox"
										id="privateCheckbox" /> <label
										class="form-check-label" for="privateCheckbox">private</label>
								</div>


							</div>
						</div>
						<!-- 		옷 등록 버튼 -->
						<button type="button" class="btn btn-primary enrollBtn"
							onclick="location.href='enroll'">피팅 만들기</button>

						<div class="row row-cols-1 row-cols-md-3 g-4 mb-5" id="fitting_main">
						</div>
							
						<!-- / Content -->
						<!-- 페이지네이션 -->
						<div class="col mt-3">
							<nav aria-label="Page navigation">
								<ul class="pagination justify-content-center">
									<li class="page-item first"><a class="page-link" href="1"><i
											class="tf-icon bx bx-chevrons-left"></i></a></li>
									<c:if test="${pageMaker.prev}">
										<li class="page-item prev"><a class="page-link"
											href="${pageMaker.startPage -1} ;"><i
												class="tf-icon bx bx-chevron-left"></i></a></li>
									</c:if>
									<c:forEach var="num" begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}">
										<li class="page-item ${pageMaker.cri.pageNum == num ? "active":""} ">
											<a class="page-link" href="${num}">${num}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next }">
										<li class="page-item next"><a class="page-link"
											href="${pageMaker.endPage +1 }"><i
												class="tf-icon bx bx-chevron-right"></i></a></li>
									</c:if>
									<li class="page-item last"><a class="page-link"
										href="${pageMaker.endPage}"><i
											class="tf-icon bx bx-chevrons-right"></i></a></li>
								</ul>
							</nav>
						</div>
						<div class="content-backdrop fade"></div>
					</div>
					<!-- Content wrapper -->
				</div>
				<!-- / Layout page -->
			</div>

			<!-- Overlay -->
			<div class="layout-overlay layout-menu-toggle"></div>
		</div>
		<!-- / Layout wrapper -->

		<!-- Core JS -->
		<!-- build:js assets/vendor/js/core.js -->
		<script src="/resources/assets/vendor/libs/jquery/jquery.js"></script>
		<script src="/resources/assets/vendor/libs/popper/popper.js"></script>
		<script src="/resources/assets/vendor/js/bootstrap.js"></script>
		<script
			src="/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

		<script src="/resources/assets/vendor/js/menu.js"></script>
		<!-- endbuild -->

		<!-- Vendors JS -->
		<script src="/resources/assets/vendor/libs/masonry/masonry.js"></script>

		<!-- Main JS -->
		<script src="/resources/assets/js/main.js"></script>

		<!-- Page JS -->

		<!-- Place this tag in your head or just before your close body tag. -->
		<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>