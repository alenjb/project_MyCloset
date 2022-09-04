<%@page import="com.mycloset.member.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</head>

<body>
	<%
	LoginVO value = (LoginVO) session.getAttribute("login");
	//session.getAttribute()는 object테이터타입이기에 명시적형변환으로 (String)을 해줘야한다.
	String id = value.getMember_id();
	String grade = value.getMember_grade();
	%>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->

			<aside id="layout-menu"
				class="layout-menu menu-vertical menu bg-menu-theme">
				<div class="app-brand demo">
					<a href="/mycloset/home" class="app-brand-link"> <span
						class="app-brand-text demo menu-text fw-bolder ms-2">MyCloset</span>
					</a>
				</div>
				<!-- 		메뉴 리스트 -->
				<ul class="menu-inner py-1 ps ps--active-y">
					<!-- 홈 -->
					<!--      	li 태그에 active 붙여주면 그 메뉴가 선택된 것으로 나옴  -->
					<li class="menu-item"><a href="/mycloset/home"
						class="menu-link"> <i
							class="menu-icon tf-icons bx bx-home-circle"></i>
							<div>홈</div>
					</a></li>

					<!-- 공지사항 -->
					<li class="menu-item"><a href="/notice/list" class="menu-link">
							<i class="menu-icon tf-icons bx bx-detail"></i>
							<div>공지사항</div>
					</a></li>

					<!-- 마이페이지 -->
					<li class="menu-item"><a href="/member/myPage"
						class="menu-link"> <i
							class="menu-icon tf-icons bx bx-dock-top"></i>
							<div>마이페이지</div>
					</a></li>

					<!-- 내 옷장 -->
					<li class="menu-item"><a href="/closet/list" class="menu-link">
							<i class="menu-icon tf-icons bx bx-cube-alt"></i>
							<div>내 옷장</div>
					</a></li>

					<!-- 피팅룸 -->
					<li class="menu-item"><a href=/fitting/list
						" class="menu-link"> <i class="menu-icon tf-icons bx bx-crown"></i>
							<div>피팅룸</div>
					</a></li>

					<!-- QnA -->
					<li class="menu-item"><a href="/qna/list;" class="menu-link">
							<i class="menu-icon tf-icons bx bx-support"></i>
							<div>QnA</div>
					</a></li>
				</ul>
			</aside>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->

				<nav
					class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
					id="layout-navbar">
					<div
						class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
						<a class="nav-item nav-link px-0 me-xl-4" href="/kkk"> <i
							class="bx bx-menu bx-sm"></i>
						</a>
					</div>
					<!-- 맨 위 navbar -->
					<div class="navbar-nav-right d-flex align-items-center"
						id="navbar-collapse">
						<!-- Search -->
						<div class="navbar-nav align-items-center">
							<div class="nav-item d-flex align-items-center">
								<div>
									<form>
										<select name="key" id="key" class="form-select form-select-sm">
											<option value="t" ${(pageObject.key =="t") ? "seleted":""}>제목</option>
											<option value="c" ${(pageObject.key =="c") ? "seleted":""}>내용</option>
											<option value="w" ${(pageObject.key =="w") ? "seleted":""}>작성자</option>
											<option value="tc" ${(pageObject.key =="tc") ? "seleted":""}>제목/내용</option>
											<option value="tcw"
												${(pageObject.key =="tcw") ? "seleted":""}>전체</option>
										</select>
								</div>
								<!--검색 창 -->
								<div class="row">
									<div class="col-9">
										<input type="text" class="form-control border-0 shadow-none"
											placeholder="검색" name="word" value="${pageObject.word }" />
									</div>
									<div class="input-group-btn col-3">
										<button class="btn btn-default" type="submit">
											<i class="bx bx-search fs-4 lh-0"></i>
										</button>
									</div>
								</div>
								</form>
							</div>
						</div>
						<!-- /Search -->

						<ul class="navbar-nav flex-row align-items-center ms-auto">
							<!-- Place this tag where you want the button to render. -->
							<!-- User(내정보 보기) -->
							<li class="nav-item navbar-dropdown dropdown-user dropdown">
								<a class="nav-link dropdown-toggle hide-arrow"
								href="javascript:void(0);" data-bs-toggle="dropdown">
									<div class="avatar avatar-online">
										<img src="/resources/assets/img/avatars/1.png" alt
											class="w-px-40 h-auto rounded-circle" />
									</div>
							</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item" href="#">
											<div class="d-flex">
												<div class="flex-shrink-0 me-3">
													<div class="avatar avatar-online">
														<img src="/resources/assets/img/avatars/1.png" alt
															class="w-px-40 h-auto rounded-circle" />
													</div>
												</div>
												<div class="flex-grow-1">
													<span class="fw-semibold d-block"><%=id%></span> <small
														class="text-muted"><%=grade%></small>
												</div>
											</div>
									</a></li>
									<li>
										<div class="dropdown-divider"></div>
									</li>
									<li><a class="dropdown-item" href="/member/myPage"> <i
											class="bx bx-user me-2"></i> <span class="align-middle">내
												프로필</span>
									</a></li>
									<li><a class="dropdown-item" href="setting"> <i
											class="bx bx-cog me-2"></i> <span class="align-middle">환경설정</span>
									</a></li>
									<li>
										<div class="dropdown-divider"></div>
									</li>
									<li><a class="dropdown-item" href="/member/login"> <i
											class="bx bx-power-off me-2"></i> <span class="align-middle">로그아웃</span>
									</a></li>
								</ul>
							</li>
							<!--/ User -->
						</ul>
					</div>
				</nav>

				<!-- / Navbar -->

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
									<h5 class="card-header">피팅 정보</h5>
									<!-- Account -->
									<form id="enroll" method="POST" action="enroll"
										enctype="multiPart/form-data">
										<div class="card-body">
											<div
												class="d-flex align-items-start align-items-sm-center gap-4">
												<img src="/resources/assets/img/avatars/1.png"
													alt="user-avatar" class="d-block rounded" height="100"
													width="100" id="uploadedAvatar1" />
												<div class="button-wrapper">
													<label for="clothes_photo_file1"
														class="btn btn-primary me-2 mb-4" tabindex="0"> <span
														class="d-none d-sm-block">아우터 사진 선택</span> <i
														class="bx bx-upload d-block d-sm-none"></i> <input
														type="file" id="clothes_photo_file1"
														name="clothes_photo_file" class="account-file-input"
														hidden
														accept="image/png, image/jpeg, image/jpg, image/gif" />
													</label>

													<p class="text-muted mb-0">JPG, GIF, JPEG, PNG 등 사진 파일만
														등록 가능합니다.</p>
												</div>
											</div>
											<div
												class="d-flex align-items-start align-items-sm-center gap-4">
												<img src="/resources/assets/img/avatars/1.png"
													alt="user-avatar" class="d-block rounded" height="100"
													width="100" id="uploadedAvatar2" />
												<div class="button-wrapper">
													<label for="clothes_photo_file2"
														class="btn btn-primary me-2 mb-4" tabindex="0"> <span
														class="d-none d-sm-block">상의 사진 선택</span> <i
														class="bx bx-upload d-block d-sm-none"></i> <input
														type="file" id="clothes_photo_file2"
														name="clothes_photo_file" class="account-file-input"
														hidden
														accept="image/png, image/jpeg, image/jpg, image/gif" />
													</label>

													<p class="text-muted mb-0">JPG, GIF, JPEG, PNG 등 사진 파일만
														등록 가능합니다.</p>
												</div>
											</div>
											<div
												class="d-flex align-items-start align-items-sm-center gap-4">
												<img src="/resources/assets/img/avatars/1.png"
													alt="user-avatar" class="d-block rounded" height="100"
													width="100" id="uploadedAvatar3" />
												<div class="button-wrapper">
													<label for="clothes_photo_file3"
														class="btn btn-primary me-2 mb-4" tabindex="0"> <span
														class="d-none d-sm-block">하의 사진 선택</span> <i
														class="bx bx-upload d-block d-sm-none"></i> <input
														type="file" id="clothes_photo_file3"
														name="clothes_photo_file" class="account-file-input"
														hidden
														accept="image/png, image/jpeg, image/jpg, image/gif" />
													</label>

													<p class="text-muted mb-0">JPG, GIF, JPEG, PNG 등 사진 파일만
														등록 가능합니다.</p>
												</div>
											</div>
										</div>
										<hr class="my-0" />
										<div class="card-body">

											<div class="row justify-content-center">
												<label for="fitting_name" class="form-label col-md-4">피팅
													이름</label>
												<div class="mb-3 col-md-8"
													style="float: none; margin: 0 auto;">
													<input class="form-control" type="text" id="fitting_name"
														name="fitting_name" autofocus />
												</div>

												<label for="fitting_info" class="form-label col-md-4">피팅
													설명</label>
												<div class="mb-3 col-md-8"
													style="float: none; margin: 0 auto;">
													<textarea class="form-control" id="fitting_info"
														name="fitting_info" rows="5"></textarea>
												</div>

												<label for="fitting_season1" class="form-label col-md-4">옷
													계절</label>
												<div class="mb-3 col-md-8">
													<div class="form-check form-check-inline">
														<input name="fitting_season" class="form-check-input"
															type="checkbox" value="봄" id="fitting_season1" /> <label
															class="form-check-label" for="fitting_season1"> 봄
														</label>
													</div>
													<div class="form-check form-check-inline">
														<input name="fitting_season" class="form-check-input"
															type="checkbox" value="여름" id="fitting_season2" /> <label
															class="form-check-label" for="fitting_season2">
															여름 </label>
													</div>
													<div class="form-check form-check-inline">
														<input name="fitting_season" class="form-check-input"
															type="checkbox" value="가을" id="fitting_season3" /> <label
															class="form-check-label" for="fitting_season3">
															가을 </label>
													</div>

													<div class="form-check form-check-inline">
														<input name="fitting_season" class="form-check-input"
															type="checkbox" value="겨울" id="fitting_season4" /> <label
															class="form-check-label" for="fitting_season4">
															겨울 </label>
													</div>



												</div>

												<label for="fitting_open_range" class="form-label col-md-4">공개범위
												</label>
												<div class="mb-3 col-md-8">
													<div class="form-check form-check-inline">
														<input name="fitting_open_range" class="form-check-input"
															type="radio" value="public" id="fitting_open_range1" />
														<label class="radio-inline" for="fitting_open_range1">
															public </label>
													</div>
													<div class="form-check form-check-inline">
														<input name="fitting_open_range" class="form-check-input"
															type="radio" value="private" id="fitting_open_range2" />
														<label class="radio-inline" for="fitting_open_range2">
															private </label>
													</div>
												</div>

												<input type="hidden" name="member_id" value="${member_id}">
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
			</div>
			<!-- / Content -->


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

	<script>
	//사진 파일을 바꿨을 때
	$('#clothes_photo_file').on('change', function(e) {
		 readImage(e.target)
	});
	
	//이미지 변경 시 바로바로 적용
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("uploadedAvatar")
	            previewImage.src = e.target.result
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
	}
	</script>
	
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