<%@page import="com.mycloset.member.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/resources/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>MY PAGE</title>

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
<script type="text/javascript">
$(function () {
// 	아우터 선택
	$(".imgSelect").click(
		function (e) {
			var src= e.target.getAttribute('src')
			var outer = document.getElementById("selectedOuter")
			outer.value = src
			
			//일단 피팅 이미지를 아우터 이미지로 설정
			var image = document.getElementById("fitting_image")
			image.value=src
			$("#collapseExample").collapse('toggle')
			//update 화면에서 수정된 사진 바로바로 보이기
			var outerPic = document.getElementById("uploadOuter")
			outerPic.setAttribute('src', src)

	});
// 	상의 선택
	$(".imgSelect2").click(
		function (e) {
			var src= e.target.getAttribute('src')
			var top = document.getElementById("selectedTop")
			top.value = src
			$("#collapseExample2").collapse('toggle')
			//update 화면에서 수정된 사진 바로바로 보이기
			var outerPic = document.getElementById("uploadTop")
			outerPic.setAttribute('src', src)

		});
// 	하의 선택
	$(".imgSelect3").click(
		function (e) {
			var src= e.target.getAttribute('src')
			var bottom = document.getElementById("selectedBottom")
			bottom.value = src
			$("#collapseExample3").collapse('toggle')			
			//update 화면에서 수정된 사진 바로바로 보이기
			var outerPic = document.getElementById("uploadBottom")
			outerPic.setAttribute('src', src)


		});
					

});
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
			<!-- Layout Page -->
			<div class="layout-page">
			<%@ include file="/resources/js/searchBar_fitting.jsp" %>
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">Account Settings /</span>
							Account
						</h4>

						<div class="row">
							<div class="col-md-12">
								<ul class="nav nav-pills flex-column flex-md-row mb-3">
									<li class="nav-item"><a class="nav-link active"
										href="javascript:void(0);"><i class="bx bx-user me-1"></i>
											Account</a></li>
									<li class="nav-item"><a class="nav-link"
										href="pages-account-settings-notifications.html"><i
											class="bx bx-bell me-1"></i> Notifications</a></li>
									<li class="nav-item"><a class="nav-link"
										href="pages-account-settings-connections.html"><i
											class="bx bx-link-alt me-1"></i> Connections</a></li>
								</ul>



								<div class="card mb-4">
									<h3 class="card-header">피팅 정보</h3>
									<h5 class="card-header">피팅 의류 선택</h5>
									<div class="card-body">
									<form id="update" method="POST" action="update"
											enctype="multiPart/form-data">
										<p class="card-text">나의 옷장에서 원하는 아우터, 상의, 하의를 추가하세요</p>
										<img src="${vo.outer_clothes_photo}" height="125" width="125" class="ms-2 me-2" id="uploadOuter" name="outer_clothes_photo"/>
										<img src="${vo.top_clothes_photo}" height="125" width="125" class="ms-4 me-3" id="uploadTop" name="top_clothes_photo"/>
										<img src="${vo.bottom_clothes_photo}" height="125" width="125" class="ms-2 me-5" id="uploadBottom" name="bottom_clothes_photo"/>
										<p class="demo-inline-spacing">
											<a class="btn btn-primary me-1 collapseBtn"
												data-bs-toggle="collapse" href="#collapseExample"
												role="button" aria-expanded="false"
												aria-controls="collapseExample" id="outerA"> 아우터 사진 선택 </a>										
											<a class="btn btn-primary me-1 collapseBtn"
												data-bs-toggle="collapse" href="#collapseExample2"
												role="button" aria-expanded="false"
												aria-controls="collapseExample" id="topA"> 상의 사진 선택 </a> <a
												class="btn btn-primary me-1 collapseBtn"
												data-bs-toggle="collapse" href="#collapseExample3"
												role="button" aria-expanded="false"
												aria-controls="collapseExample" id="bottomA"> 하의 사진 선택 </a>
										</p>
										<!-- 아우터 선택 collapse -->
										<div class="collapse" id="collapseExample">
											<div class="d-grid d-sm-flex p-3 border">
												<!-- 												db에서 옷 정보를 가져와서 뿌림 -->
												<c:forEach items="${list}" var="list">
													<!-- 												각 옷을 선택 가능하게 만듬 -->
													<a class="imgSelect"> <img src="${list.clothes_photo}"
														alt="이미지" class="d-block rounded me-4 mb-sm-0 mb-2"
														height="125" width="125" id="uploadedPhoto"
														style="cursor: pointer;" />
													</a>
												</c:forEach>
											</div>
										</div>
										<!-- 상의 선택 collapse -->
										<div class="collapse" id="collapseExample2">
											<div class="d-grid d-sm-flex p-3 border">
												<!-- 												db에서 옷 정보를 가져와서 뿌림 -->
												<c:forEach items="${list}" var="list">
													<!-- 												각 옷을 선택 가능하게 만듬 -->
													<a class="imgSelect2"> <img src="${list.clothes_photo}"
														alt="이미지" class="d-block rounded me-4 mb-sm-0 mb-2"
														height="125" width="125" id="uploadedPhoto1"
														style="cursor: pointer;" />
													</a>
												</c:forEach>
											</div>
										</div>
										<!-- 하의 선택 collapse -->
										<div class="collapse" id="collapseExample3">
											<div class="d-grid d-sm-flex p-3 border">
												<!-- 												db에서 옷 정보를 가져와서 뿌림 -->
												<c:forEach items="${list}" var="list">
													<!-- 												각 옷을 선택 가능하게 만듬 -->
													<a class="imgSelect3"> <img src="${list.clothes_photo}"
														alt="이미지" class="d-block rounded me-4 mb-sm-0 mb-2"
														height="125" width="125" id="uploadedPhoto2"
														style="cursor: pointer;" />
													</a>
												</c:forEach>
											</div>
										</div>


										<!-- Account -->
										
											<input id="selectedOuter" name="outer_clothes_photo" hidden="hidden" accept="image/png, image/jpeg, image/jpg, image/gif" value="${vo.outer_clothes_photo}"> 
											<input id="selectedTop" name="top_clothes_photo" hidden="hidden" accept="image/png, image/jpeg, image/jpg, image/gif" value="${vo.top_clothes_photo}"> 
											<input id="selectedBottom" name="bottom_clothes_photo" hidden="hidden" accept="image/png, image/jpeg, image/jpg, image/gif" value="${vo.bottom_clothes_photo}">
											<input id="fitting_image" name="fitting_image" hidden="hidden" accept="image/png, image/jpeg, image/jpg, image/gif" value="${vo.outer_clothes_photo}">
											<hr>
											<div class="row justify-content-center">
												<label for="fitting_name" class="form-label col-md-4">피팅
													이름</label>
												<div class="mb-3 col-md-8"
													style="float: none; margin: 0 auto;">
													<input class="form-control" type="text" id="fitting_name"
														name="fitting_name" value="${vo.fitting_name}" autofocus />
												</div>

												<label for="fitting_info" class="form-label col-md-4">피팅
													설명</label>
												<div class="mb-3 col-md-8"
													style="float: none; margin: 0 auto;">
													<textarea class="form-control" id="fitting_info"
														name="fitting_info" rows="5">${vo.fitting_info}</textarea>
												</div>

												<label for="fitting_season1" class="form-label col-md-4">피팅
													계절</label>
												<div class="mb-3 col-md-8">
													<div class="form-check form-check-inline">
														<input name="fitting_season" class="form-check-input"
															type="checkbox" value="봄" id="fitting_season1"
															<c:set var="season" value="${vo.fitting_season}" />
															<c:if test="${fn:contains(season, '봄')}">
	                              checked="checked"
                              </c:if> />
														<label class="form-check-label" for="fitting_season1">
															봄 </label>
													</div>
													<div class="form-check form-check-inline">
														<input name="fitting_season" class="form-check-input"
															type="checkbox" value="여름" id="fitting_season2"
															<c:set var="season" value="${vo.fitting_season}" />
															<c:if test="${fn:contains(season, '여름')}">
	                              checked="checked"
                              </c:if> />
														<label class="form-check-label" for="fitting_season2">
															여름 </label>
													</div>
													<div class="form-check form-check-inline">
														<input name="fitting_season" class="form-check-input"
															type="checkbox" value="가을" id="fitting_season3"
															<c:set var="season" value="${vo.fitting_season}" />
															<c:if test="${fn:contains(season, '가을')}">
	                              checked="checked"
                              </c:if> />
														<label class="form-check-label" for="fitting_season3">
															가을 </label>
													</div>

													<div class="form-check form-check-inline">
														<input name="fitting_season" class="form-check-input"
															type="checkbox" value="겨울" id="fitting_season4"
															<c:set var="season" value="${vo.fitting_season}" />
															<c:if test="${fn:contains(season, '겨울')}">
	                              checked="checked"
                              </c:if> />
														<label class="form-check-label" for="fitting_season4">
															겨울 </label>
													</div>
												</div>

												<label for="fitting_open_range" class="form-label col-md-4">공개범위
												</label>
												<div class="mb-3 col-md-8">
													<div class="form-check form-check-inline">
														<input name="fitting_open_range" class="form-check-input"
															type="radio" value="public" id="fitting_open_range1"
															<c:set var="range" value="${vo.fitting_open_range}" />
															<c:if test="${fn:contains(range, 'public')}">
	                              checked="checked"
                              </c:if> />
														<label class="radio-inline" for="fitting_open_range1">
															public </label>
													</div>
													<div class="form-check form-check-inline">
														<input name="fitting_open_range" class="form-check-input"
															type="radio" value="private" id="fitting_open_range2"
															<c:set var="range" value="${vo.fitting_open_range}" />
															<c:if test="${fn:contains(range, 'private')}">
	                              checked="checked"
                              </c:if> />
														<label class="radio-inline" for="fitting_open_range2">
															private </label>
													</div>
												</div>
												<input type="hidden" name="member_id" value="${member_id}">
												<input type="hidden" name="fitting_id"
												value="${vo.fitting_id}">
											</div>
											<div class="mt-2">
												<!--                           <a href="/member/myPage"><button type="submit" class="btn btn-primary me-2" >수정완료</button></a> -->
												<button type="submit" class="btn btn-primary me-2">등록</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Content -->
				</div>
				<!-- Content wrapper -->
			</div>
			<!-- Layout Page -->
		<!-- Content wrapper -->
		</div>
		<!-- Layout container -->
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

	<!-- Main JS -->
	<script src="/resources/assets/js/main.js"></script>

	<!-- Page JS -->
	<script src="/resources/assets/js/pages-account-settings-account.js"></script>

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
