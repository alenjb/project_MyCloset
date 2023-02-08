<%@page import="com.mycloset.member.vo.LoginVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>


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

<title>내 옷장</title>

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
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}

.demo-inline-spacing {
	margin-bottom: 5px;
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
		$(".dataRow")
				.click(
						function() {
// 							var no = $(this).find(".no").text();
							location = "view?clothes_id="+$(this).find(".id").text()+"&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}";

// 									+ "&inc=1"
// 									+ "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}&key=${pageObject.key}&word=${pageObject.word}&period=${pageObject.period}";

						});

// 		//perPageNum 데이터의 변경 이벤트 처리 ->jQuery에 대한 이벤트
// 		$("#perPageNumSelect").change(function() {
// 			// 			alert("값 변경");	
// 			$("#perPageNumForm").submit();
// 		});

		var actionForm = $("#actionForm");
		$(".page-link").on("click", function(e) {
			//페이지네이션 이동을 막음
			e.preventDefault();
			//클릭한 페이지의 값을 가져옴
			var targetPage = $(this).attr("href");
			//전송도리 form의 pageNum값을 targetPage 값으로 지정
			actionForm.find("input[name='pageNum']").val(targetPage);
			//form 전송
			actionForm.submit();
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
						<h4 class="fw-bold">내 옷장</h4>
						<!-- 		옷 등록 버튼 -->
						<div class="demo-inline-spacing">
							<button type="button" class="btn btn-primary"
								onclick="location.href='enroll'">옷 등록</button>
						</div>

						<!-- 내 옷장 리스트 -->
						<div class="card">
							<div class="table-responsive text-nowrap">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>번호</th>
											<th>이름</th>
											<th>종류</th>
											<th>사이즈</th>
											<th>계절</th>
											<th>구매일</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0">
										<c:forEach items="${closets}" var="closet">
											<tr class="dataRow">
												<td class="id">${closet.clothes_id}</td>
												<td>${closet.clothes_name}</td>
												<td>${closet.clothes_type}</td>
												<td>${closet.clothes_size}</td>
												<td>${closet.clothes_season}</td>
												<td><fmt:formatDate
														value="${closet.clothes_purchase_year}"
														pattern="yyyy-MM-dd" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>


							</div>
						</div>
						<!--/ Hoverable Table rows -->

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


						<!-- 페이지에 관한 정보 클릭한 링크로 날리기 -->
						<form id='actionForm' action="/closet/list" method="get">
							<input type="hidden" name="pageNum"
								value="${pageMaker.cri.pageNum}"> <input type="hidden"
								name="amount" value="${pageMaker.cri.amount}"> <input
								type="hidden" name="type"
								value='<c:out value="${pageMaker.cri.type}"/>'> <input
								type="hidden" name="keyword"
								value='<c:out value="${pageMaker.cri.keyword}"/>'>
						</form>

						<!--/ Basic Pagination -->
						<hr class="my-5" />


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
