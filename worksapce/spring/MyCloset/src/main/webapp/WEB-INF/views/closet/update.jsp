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
	$(function() {
		$("#cancelBtn").click(function() {
			history.back();
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
			<div class="layout-page">
			<%@ include file="/resources/js/searchBar_closet.jsp" %>
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">내 옷장 /</span>
							옷 정보
						</h4>
						<h4>${vo.member_id } </h4>
						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4">
									<h5 class="card-header">${vo.clothes_name}</h5>
									<!-- Account -->
									<form id="update" method="POST" action="update"
										enctype="multiPart/form-data">
										<div class="card-body">
											<div
												class="d-flex align-items-start align-items-sm-center gap-4">
												<img src="${vo.clothes_photo}" alt="user-avatar"
													class="d-block rounded" height="100" width="100"
													id="uploadedAvatar" />
												<div class="button-wrapper">
													<label for="clothes_photo_file"
														class="btn btn-primary me-2 mb-4" tabindex="0"> <span
														class="d-none d-sm-block">사진 선택</span> <i
														class="bx bx-upload d-block d-sm-none"></i> <input
														type="file"
														name="clothes_photo_file" class="account-file-input"
														id="clothes_photo_file" hidden="hidden"
														accept="image/png, image/jpeg, image/jpg, image/gif" />
													</label> <input id="clothes_photo" type="hidden">

													<p class="text-muted mb-0">JPG, GIF, JPEG, PNG 등 사진 파일만
														등록 가능합니다.</p>
												</div>
											</div>
										</div>
										<hr class="my-0" />
										<div class="card-body">

											<div class="row justify-content-center">

												<label for="clothes_season1" class="form-label col-md-4">옷
													종류</label>
												<div class="mb-3 col-md-8">
													<div class="form-check form-check-inline">
														<input name="clothes_type" class="form-check-input"
															type="radio" value="상의" id="clothes_type1"
															<c:if test="${vo.clothes_type eq'상의'}">
																checked
																</c:if> />
														<label class="radio-inline" for="clothes_type1">
															상의 </label>
													</div>
													<div class="form-check form-check-inline">
														<input name="clothes_type" class="form-check-input"
															type="radio" value="하의" id="clothes_type2"
															<c:if test="${vo.clothes_type eq'하의'}">
																checked
																</c:if> />
														<label class="radio-inline" for="clothes_type2">
															하의 </label>
													</div>
												</div>


												<label for="clothes_name" class="form-label col-md-4">옷
													이름</label>
												<div class="mb-3 col-md-8"
													style="float: none; margin: 0 auto;">
													<input class="form-control" type="text" id="clothes_name"
														name="clothes_name" autofocus value="${vo.clothes_name}" />
												</div>

												<label for="clothes_info" class="form-label col-md-4">옷
													설명</label>
												<div class="mb-3 col-md-8"
													style="float: none; margin: 0 auto;">
													<textarea class="form-control" id="clothes_info"
														name="clothes_info" rows="5">${vo.clothes_info}</textarea>
												</div>

												<label for="clothes_size" class="form-label col-md-4">옷
													사이즈</label>
												<div class="mb-3 col-md-8">
													<select id="clothes_size" name="clothes_size"
														class="form-select">
														<option value="80"
															<c:if test="${vo.clothes_size eq 80}">selected="selected"</c:if>>80</option>
														<option value="85"
															<c:if test="${vo.clothes_size eq 85}">selected="selected"</c:if>>85</option>
														<option value="90"
															<c:if test="${vo.clothes_size eq 90}">selected="selected"</c:if>>90</option>
														<option value="95"
															<c:if test="${vo.clothes_size eq 95}">selected="selected"</c:if>>95</option>
														<option value="100"
															<c:if test="${vo.clothes_size eq 100}">selected="selected"</c:if>>100</option>
														<option value="105"
															<c:if test="${vo.clothes_size eq 105}">selected="selected"</c:if>>105</option>
														<option value="110"
															<c:if test="${vo.clothes_size eq 110}">selected="selected"</c:if>>110</option>
														<option value="115"
															<c:if test="${vo.clothes_size eq 115}">selected="selected"</c:if>>115</option>
														<option value="120"
															<c:if test="${vo.clothes_size eq 120}">selected="selected"</c:if>>120</option>
													</select>
												</div>
												<label for="clothes_purchase_price"
													class="form-label col-md-4">구입 가격</label>
												<div class="mb-3 col-md-8">
													<div class="input-group">
														<span class="input-group-text">￦</span> <input type="text"
															class="form-control" id="clothes_purchase_price"
															name="clothes_purchase_price"
															value="${vo.clothes_purchase_price}" /> <span
															class="input-group-text">원</span>
													</div>
												</div>

												<label for="clothes_purchase_year"
													class="form-label col-md-4">구입년도</label>
												<div class="mb-3 col-md-8">
													<input class="form-control" type="date"
														id="clothes_purchase_year" name="clothes_purchase_year"
														value="<fmt:formatDate value='${vo.clothes_purchase_year}'
 														pattern='yyyy-MM-dd'/>">
<%-- 														value="${vo.clothes_purchase_year}"> --%>
												</div>


												<label for="clothes_season1" class="form-label col-md-4">옷
													계절</label>
												<div class="mb-3 col-md-8">
													<c:set var="season" value="${vo.clothes_season}" />
													<div class="form-check form-check-inline">
														<input name="clothes_season" class="form-check-input"
															type="checkbox" value="봄" id="clothes_season1"
															<c:if test="${fn:contains(season, '봄')}">checked="checked"</c:if> />
														<label class="form-check-label" for="clothes_season1">
															봄 </label>
													</div>
													<div class="form-check form-check-inline">
														<input name="clothes_season" class="form-check-input"
															type="checkbox" value="여름" id="clothes_season2"
															<c:if test="${fn:contains(season, '여름')}">checked="checked"</c:if> />
														<label class="form-check-label" for="clothes_season2">
															여름 </label>
													</div>
													<div class="form-check form-check-inline">
														<input name="clothes_season" class="form-check-input"
															type="checkbox" value="가을" id="clothes_season3"
															<c:if test="${fn:contains(season, '가을')}">checked="checked"</c:if> />
														<label class="form-check-label" for="clothes_season3">
															가을 </label>
													</div>

													<div class="form-check form-check-inline">
														<input name="clothes_season" class="form-check-input"
															type="checkbox" value="겨울" id="clothes_season4"
															<c:if test="${fn:contains(season, '겨울')}">checked="checked"</c:if> />
														<label class="form-check-label" for="clothes_season4">
															겨울 </label>
													</div>



												</div>
											</div>

											<input type="hidden" name="member_id" value="${vo.member_id}">
											<input type="hidden" name="clothes_id"
												value="${vo.clothes_id}">
										</div>
										<div class="mt-2">
											<!--                           <a href="/member/myPage"><button type="submit" class="btn btn-primary me-2" >수정완료</button></a> -->
											<button type="submit" class="btn btn-primary me-2">수정</button>
											<button type="reset" class="btn btn-primary me-2">초기화</button>
											<button type="button" class="btn btn-primary me-2"
												id="cancelBtn">취소</button>
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
	<!-- 	<script src="/resources/assets/js/pages-account-settings-account.js"></script> -->

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<script>
	//사진 파일을 바꿨을 때
	$('#clothes_photo_file').on('change', function(e) {
		 readImage(e.target)
	});
	
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
</body>
</html>
