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

<title>Horizontal Layouts - Forms | Sneat - Bootstrap 5 HTML
	Admin Template - Pro</title>

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
<script>
	//사진 파일을 바꿨을 때
	$(function(){document.getElementById('aPhotoFile').onchange = function(e){
		 readImage(e.target)}
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
			<%@ include file="/resources/js/navBar.jsp"%>
			<div class="layout-page">
				<%@ include file="/resources/js/searchBar_qna.jsp"%>

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">

						<!-- Basic Layout & Basic with Icons -->
						<div class="row">
							<!-- Basic Layout -->
							<div class="col-xxl">
								<div class="card mb-4">

									<form action="updateAnswer" method="post"
										enctype="multiPart/form-data">
										<div class="card-body">
											<div class="row mb-3">
												<label class="col-sm-2 col-form-label" for="title">제목</label>

												<textarea name="aTitle" id="title" class="form-control"
													rows="1">${vo.ATitle}</textarea>
											</div>
											<div class="row mb-3">
												<label class="col-sm-2 col-form-label" for="content">내용</label>
												<textarea name="aContent" id="content" class="form-control"
													rows="7">${vo.AContent}</textarea>
											</div>
											<div class="row mb-3">
												<label for="image" class="col-md-0 col-form-label">첨부파일</label>
												<div
													class="d-flex align-items-start align-items-sm-center gap-4">
													<img src="${vo.AImage}"
														alt="user-avatar" class="d-block rounded" height="100"
														width="100" id="uploadedAvatar" />
													<div class="button-wrapper">
														<label for="aPhotoFile"
															class="btn btn-primary me-2 mb-4" tabindex="0"> <span
															class="d-none d-sm-block">사진 선택</span> <i
															class="bx bx-upload d-block d-sm-none"></i> <input
															type="file" id="aPhotoFile"
															name="aPhotoFile" class="account-file-input"
															hidden
															accept="image/png, image/jpeg, image/jpg, image/gif" />
														</label>

														<p class="text-muted mb-0">JPG, GIF, JPEG, PNG 등 사진
															파일만 등록 가능합니다.</p>
													</div>
												</div>
											</div>
										</div>
										<input type="hidden" name="aWriter" value="<%=id%>">
										<input id="no" name="no" value="${vo.no}" hidden="hidden"/>
										<input id="qTitle" name="qTitle" value="${vo.QTitle}" hidden="hidden"/>
										<input id="qContent" name="qContent" value="${vo.QContent}" hidden="hidden"/>
										<input id="qWriter" name="qWriter" value="${vo.QWriter}" hidden="hidden"/>
										<input id="qDate" name="qDate" value="<fmt:formatDate value="${vo.QDate}" pattern="yyyy-MM-dd"/>" hidden="hidden"/>
										<input type="file" id="qPhotoFile" name="qPhotoFile" value="${vo.QPhotoFile}" hidden="hidden"/>
										<div class="row justify-content-end">
											<div class="col-sm-15">
												<button type="submit" class="btn btn-primary">수정</button>
					                            <button type="reset" class="btn btn-primary">복구</button>
					                            <button type="button" class="btn btn-primary" id="cancelBtn">취소</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- Basic with Icons -->
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

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
