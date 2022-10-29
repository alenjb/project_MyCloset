<%@page import="com.mycloset.member.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Cards basic - UI elements | Sneat - Bootstrap 5 HTML
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
		var fit= "1";
		var fit2="2";
		$(".fittingOverView").click(function() {
			location = "view?fitting_id=" + $(this).find(".fitting_id").text()+"&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}";


		});

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
		
		// public 버튼 클릭시
		$("#flexSwitchCheckChecked1").on("click", function(e) {
			//체크 되면 public 보임
			var checked = $("#flexSwitchCheckChecked1").is(':checked');
			var result = new Array();
			
			
					
			
// 			//ajax 기본 틀
// 			$.ajax({
// 				url: '/fitting/Private',
// 				type: 'GET',
				
// 				data: { 
// 					"fitting_open_range":fitting_open_range
// 				},
// 				beforeSend: function() {
					
// 				},
// 				success: function(res) {
// 					console.log(res);
// 					var jstr = res;
					
// 				},
// 				error: function() {
				
// 				},
// 				complete: function() {
					
// 				}
// 			});
			
			
			<c:forEach items="${fittings}" var="vo">
				var json = new Object();
				json.name="${vo.fitting_name}";
				result.push(json);
			</c:forEach>
						//public을 안보겠다고 하면
						if (!checked){
							
							//만약 private 버튼도 안눌려 있으면
							if ($("#flexSwitchCheckChecked2").is(':checked') == false){
								var fitting_open_range = "none";
							}else{//private 버튼이 눌려 있으면
								var fitting_open_range = "private" 
							}
							
							//ajax 기본 틀
							$.ajax({
								url: '/fitting/listOpenRange',
								type: 'GET',
								
								data: { 
									"fitting_open_range":fitting_open_range
								},
								beforeSend: function() {
									
								},
								success: function(res) {
									console.log(res[1].fitting_id);
									var jstr = res;
									
									//vo에서 하나씩 꺼내서
									//해당 div 찾기
		 							var div = document.getElementsByClassName("fittingOverView");
		 						<c:forEach var="vo" items="${fittings}" begin="0" varStatus="status">
		 						console.log(div[${status.index}].innerHtml);
		 						div[${status.index}].innerHtml=${jstr}[${status.index}];
		 							console.log(div[${status.index}].innerHtml);
		 						</c:forEach>
									
									
								},
								error: function() {
								
								},
								complete: function() {
									
								}
							});
							
							//vo에서 하나씩 꺼내서
							//해당 div 찾기
// 							var div = document.getElementsByClassName("fittingOverView");
// 						<c:forEach var="vo" items="${fittings}" begin="0" varStatus="status">
// 							div[${status.index}].outerText = "안녕";
// 						</c:forEach>
							
							
							
// 							//vo에서 하나씩 꺼내서
// 								//해당 div 찾기
// 								var div = document.getElementsByClassName("fittingOverView");
// 							<c:forEach var="vo" items="${fittings}" begin="0" varStatus="status">
// 								//만약 private이면
// 								if("${vo.fitting_open_range}"=="public"){
// // 										console.log("${vo.fitting_id}");
// // 										console.log(${status.index});
// // 										//div 속성 보이게 하기
// 										div[${status.index}].style.display="none";
// // 										console.log(div[${status.index}]);
// 									}
// 							</c:forEach>
							}
						//public을 보겠다고 하면
						if (checked){
							//vo에서 하나씩 꺼내서
								//해당 div 찾기
								var div = document.getElementsByClassName("fittingOverView");
							<c:forEach var="vo" items="${fittings}" begin="0" varStatus="status">
								//만약 private이면
								if("${vo.fitting_open_range}"=="public"){
// 										console.log("${vo.fitting_id}");
// 										console.log(${status.index});
// 										//div 속성 보이게 하기
										div[${status.index}].style.display="block";
// 										console.log(div[${status.index}]);
									}
							</c:forEach>
							}
		});
		
		// private 버튼 클릭시
		$("#flexSwitchCheckChecked2").on("click", function(e) {
			//체크 되면 private 보임
			var checked = $("#flexSwitchCheckChecked2").is(':checked');
			var result = new Array();
			<c:forEach items="${fittings}" var="vo">
				var json = new Object();
				json.name="${vo.fitting_name}";
				result.push(json);
			</c:forEach>
						//private을 안보겠다고 하면
						if (!checked){
							//vo에서 하나씩 꺼내서
								//해당 div 찾기
								var div = document.getElementsByClassName("fittingOverView");
							<c:forEach var="vo" items="${fittings}" begin="0" varStatus="status">
								//만약 private이면
								if("${vo.fitting_open_range}"=="private"){
										console.log("${vo.fitting_id}");
										console.log(${status.index});
// 										//div 속성 보이게 하기
										div[${status.index}].style.display="none";
										console.log(div[${status.index}]);
									}
							</c:forEach>
							}
						//private을 보겠다고 하면
						if (checked){
							//vo에서 하나씩 꺼내서
								//해당 div 찾기
								var div = document.getElementsByClassName("fittingOverView");
							<c:forEach var="vo" items="${fittings}" begin="0" varStatus="status">
								//만약 private이면
								if("${vo.fitting_open_range}"=="private"){
										console.log("${vo.fitting_id}");
										console.log(${status.index});
// 										//div 속성 보이게 하기
										div[${status.index}].style.display="block";
										console.log(div[${status.index}]);
									}
							</c:forEach>
							}
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
										id="flexSwitchCheckChecked1" checked /> <label
										class="form-check-label" for="flexSwitchCheckChecked1">public</label>
								</div>
								<div class="form-check form-switch mb-2 form-check-inline">
									<input class="form-check-input" type="checkbox"
										id="flexSwitchCheckChecked2" checked /> <label
										class="form-check-label" for="flexSwitchCheckChecked2">private</label>
								</div>


							</div>
						</div>
						<!-- 		옷 등록 버튼 -->
						<button type="button" class="btn btn-primary enrollBtn"
							onclick="location.href='enroll'">피팅 만들기</button>

						<div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
							<c:forEach items="${fittings}" var="fitting">
									<div class="col" id="fittingDiv">
										<div class="card h-100 fittingOverView">
											<img class="card-img-top" src="${fitting.fitting_image}"
												alt="Card image cap" />
											<div class="card-body">
												<h5 class="card-title">${fitting.fitting_name}</h5>
												<p class="card-text">${fitting.fitting_info}</p>
												<p class="fitting_id" hidden="hidden">${fitting.fitting_id}</p>
												<p class="fitting_open_range" hidden="hidden">${fitting.fitting_open_range}</p>
											</div>
										</div>
									</div>
							</c:forEach>
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


						<!-- 페이지에 관한 정보 클릭한 링크로 날리기 -->
						<form id='actionForm' action="/fitting/list" method="get">
							<input type="hidden" name="pageNum"
								value="${pageMaker.cri.pageNum}"> <input type="hidden"
								name="amount" value="${pageMaker.cri.amount}"> <input
								type="hidden" name="type"
								value='<c:out value="${pageMaker.cri.type}"/>'> <input
								type="hidden" name="keyword"
								value='<c:out value="${pageMaker.cri.keyword}"/>'>
						</form>
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