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
		$("#changeGradeBtn").click(function() {
			location = "changeGrade?member_id=" + "${vo.member_id}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}";
		});
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
		
	});
</script>
</head>

<body>
	<%
	LoginVO value = (LoginVO) session.getAttribute("login");
	//session.getAttribute()는 object테이터타입이기에 명시적형변환으로 (String)을 해줘야한다.
	String id = value.getMember_id();
	String grade = value.getMember_grade();
	pageContext.setAttribute("grade",grade);
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
					<li class="menu-item"><a href="/member/home"
						class="menu-link"> <i
							class="menu-icon tf-icons bx bx-home-circle"></i>
							<div>홈</div>
					</a></li>

					<!-- 공지사항 -->
					<li class="menu-item"><a href="/notice/list" class="menu-link">
							<i class="menu-icon tf-icons bx bx-detail"></i>
							<div>공지사항</div>
					</a></li>
					<!-- 회원관리페이지 -->
					<c:if test="${grade eq '관리자'}">
						<li class="menu-item"><a href="/admin/list"
							class="menu-link"> <i
								class="menu-icon tf-icons bx bx-dock-top"></i>
								<div>회원관리</div>
						</a></li>											
					</c:if>
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
								<div class="row">
									<form id="searchForm" action="/admin/list" method="get"
										class="row">
										<div class="col-sm-6">
											<select name="type" class="form-select form-select-sm col-6">
												<option value="ING"
													<c:out value="${pageMaker.cri.type eq 'ING'?'selected':''}"/>>전체</option>
												<option value="I"
													<c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>아이디</option>
												<option value="N"
													<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>이름</option>
												<option value="G"
													<c:out value="${pageMaker.cri.type eq 'G'?'selected':''}"/>>회원등급</option>
												<option value="IN"
													<c:out value="${pageMaker.cri.type eq 'IN'?'selected':''}"/>>아이디/이름</option>
											</select>
										</div>
										<div class="col-sm-6">
											<!-- 페이지에 관한 정보 클릭한 링크로 날리기 -->
<!-- 											<input type="text" class="form-control border-0 shadow-none col-6" -->
<!-- 												placeholder="검색" name="keyword" />  -->
												<input type="text" class="form-control border-0 shadow-none" placeholder="검색" name="keyword"/>											
												<input type="hidden" name="pageNum" value="${cri.pageNum}"> 
												<input type="hidden" name="amount" value="${cri.amount}">
										</div>
									</form>
								</div>
								<!--검색 창 -->
								<div class="row">
									<!-- 									<div class="col-9"> -->
									<!-- 									<form> -->
									<!-- 									</form> -->
									<!-- 									</div> -->
									<div class="input-group-btn col-3">
										<button class="btn btn-default" id="searchBtn" type="submit">
											<i class="bx bx-search fs-4 lh-0"></i>
										</button>
									</div>
								</div>
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
							<span class="text-muted fw-light">회원관리 /</span> 회원 정보
						</h4>

						<div class="row">
							<div class="col-md-12">

								<div class="card mb-4">
									<h5 class="card-header">${vo.member_name}</h5>
									<!-- Account -->
									<form id="enroll" method="POST" action="enroll"
										enctype="multiPart/form-data">
										<div class="card-body">
											<div
												class="d-flex align-items-start align-items-sm-center gap-4">
												<img src="${vo.member_face}" alt="user-avatar"
													class="d-block rounded" height="250" width="250"
													id="uploadedAvatar" />
											</div>
										</div>
										<hr class="my-0" />
										<div class="card-body">

											<div class="row justify-content-center">

												<label for="member_sex_type1" class="form-label col-md-4">성별</label>
												<div class="mb-3 col-md-8">
													<div class="form-check form-check-inline">
														<input name="member_sex" class="form-check-input"
															type="radio" value="남자" id="member_sex_type1"
															disabled="disabled" checked="checked"
															<c:set var="type" value="${vo.member_sex}" />
															<c:if test="${type eq '남자'}">
	                              checked="checked"
                              </c:if> />
														<label class="radio-inline" for="member_sex_type1">
															남자 </label>
													</div>
													<div class="form-check form-check-inline">
														<input name="member_sex" class="form-check-input"
															type="radio" value="여자" id="member_sex_type2"
															disabled="disabled"
															<c:if test="${type eq '여자'}">
	                              checked="checked"
                              </c:if> />
														<label class="radio-inline" for="member_sex_type2">
															여자 </label>
													</div>
												</div>


												<label for="member_email" class="form-label col-md-4">이메일</label>
												<div class="mb-3 col-md-8"
													style="float: none; margin: 0 auto;">
													${vo.member_email}</div>
												<label for="member_grade" class="form-label col-md-4">회원등급</label>
												<div class="mb-3 col-md-8"
													style="float: none; margin: 0 auto;">
													${vo.member_grade}
													<div class="btn-group">
														<button type="button"
															class="btn btn-primary dropdown-toggle hide-arrow"
															data-bs-toggle="dropdown" aria-expanded="false">
															변경
														</button>
														<ul class="dropdown-menu dropdown-menu-end">
															<li><a class="dropdown-item"
																href="changeGrade?member_id=${vo.member_id}&grade=general">일반회원</a></li>
															<li><a class="dropdown-item"
																href="changeGrade?member_id=${vo.member_id}&grade=elite">우수회원</a></li>
															<li>
																<hr class="dropdown-divider" />
															</li>
															<li><a class="dropdown-item"
																href="changeGrade?member_id=${vo.member_id}&grade=admin">관리자</a></li>
														</ul>
													</div>

												</div>
												<!-- Icon Dropdown -->
<!-- 												<small class="text-light fw-semibold">Icon Dropdown</small> -->
												<!--/ Icon Dropdown -->
												<label for="member_status" class="form-label col-md-4">회원상태</label>
												<div class="mb-3 col-md-8"
													style="float: none; margin: 0 auto;">
													${vo.member_status}
													<div class="btn-group">
														<button type="button"
															class="btn btn-primary dropdown-toggle hide-arrow"
															data-bs-toggle="dropdown" aria-expanded="false">
															변경
														</button>
														<ul class="dropdown-menu dropdown-menu-end">
															<li><a class="dropdown-item"
																href="changeStatus?member_id=${vo.member_id}&status=active">활동회원</a></li>
															<li><a class="dropdown-item"
																href="changeStatus?member_id=${vo.member_id}&status=inactive">휴면회원</a></li>
														</ul>
													</div>
													
													</div>


												<!-- 												<label for="clothes_purchase_year" -->
												<!-- 													class="form-label col-md-4">생년월일</label> -->
												<!-- 												<div class="mb-3 col-md-8"> -->
												<%-- 													<fmt:formatDate value="${vo.clothes_purchase_year}" --%>
												<%-- 														pattern="yyyy-MM-dd" /> --%>
												<!-- 												</div> -->

												<label for="member_reg_date" class="form-label col-md-4">가입일</label>
												<div class="mb-3 col-md-8">
													<fmt:formatDate value="${vo.member_reg_date}"
														pattern="yyyy-MM-dd" />
												</div>
											</div>

										</div>
									</form>
								</div>
								<div class="mt-2">
									<!--                           <a href="/member/myPage"><button type="submit" class="btn btn-primary me-2" >수정완료</button></a> -->
									<button type="button" class="btn btn-primary me-1"
										onclick="location.href='list?type=${cri.type}&keyword=${cri.keyword}&pageNum=${cri.pageNum}&amount=${cri.amount}'">리스트</button>
									<button type="button" class="btn btn-success"
										onclick="location.href='delete?member_id=${vo.member_id}'">강제탈퇴</button>
								</div>
								<%--                       </c:forEach> --%>
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
	<!--     <script src="/resources/assets/js/pages-account-settings-account.js"></script> -->

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
