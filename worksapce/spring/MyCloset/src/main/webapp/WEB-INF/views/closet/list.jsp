
<%@page import="com.mycloset.member.vo.LoginVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>


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
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="/resources/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Tables - Basic Tables | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/resources/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="/resources/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/resources/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/resources/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="/resources/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/resources/assets/js/config.js"></script>
    <!-- 	jQuery CDN	 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    
    <!-- 열에 마우스 오버될 시 손가락 모양 -->
 <style type="text/css">
  .dataRow:hover{
  		background: #eee;
  		cursor:pointer;
  }
  .demo-inline-spacing{
  	margin-bottom: 5px;
  }
  </style>
    
    <script type="text/javascript">
	$(function() {
		$(".dataRow")
				.click(
						function() {
							var no = $(this).find(".no").text();
							location = "view?no="
									+ no
									+ "&inc=1"
									+"&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}&key=${pageObject.key}&word=${pageObject.word}&period=${pageObject.period}"
							;
									
						});

	//perPageNum 데이터의 변경 이벤트 처리 ->jQuery에 대한 이벤트
		$("#perPageNumSelect").change(function() {
			// 			alert("값 변경");	
			$("#perPageNumForm").submit();
		});
	
	
	});
		
	
    </script>
  </head>

  <body>
  <%
	LoginVO value = (LoginVO)session.getAttribute("login");
	//session.getAttribute()는 object테이터타입이기에 명시적형변환으로 (String)을 해줘야한다.
	String id=value.getMember_id();
	String grade=value.getMember_grade();
%>
  
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="/mycloset/home" class="app-brand-link">
              <span class="app-brand-text demo menu-text fw-bolder ms-2">MyCloset</span>
            </a>
          </div>
<!-- 		메뉴 리스트 -->
          <ul class="menu-inner py-1 ps ps--active-y">
            <!-- 홈 -->
<!--      	li 태그에 active 붙여주면 그 메뉴가 선택된 것으로 나옴  -->
            <li class="menu-item">
              <a href="/mycloset/home" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div>홈</div>
              </a>
            </li>
            
            <!-- 공지사항 -->
            <li class="menu-item">
              <a href="/notice/list" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div>공지사항</div>
              </a>
            </li>

            <!-- 마이페이지 -->
            <li class="menu-item">
              <a href="/member/myPage" class="menu-link">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div>마이페이지</div>
              </a>
            </li>
            
            <!-- 내 옷장 -->
            <li class="menu-item">
              <a href="/closet/list" class="menu-link">
                <i class="menu-icon tf-icons bx bx-cube-alt"></i>
                <div>내 옷장</div>
              </a>
            </li>
            
            <!-- 피팅룸 -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link">
                <i class="menu-icon tf-icons bx bx-crown"></i>
                <div>피팅룸</div>
              </a>
            </li>
            
            <!-- QnA -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link">
                <i class="menu-icon tf-icons bx bx-support"></i>
                <div>QnA</div>
              </a>
            </li>   
          </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="/kkk">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
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
							<option value="tcw" ${(pageObject.key =="tcw") ? "seleted":""}>전체</option>								
                        </select>
                      </div>
<!--                   검색 창 -->
                  <div class="row">
                  <div class="col-9">
                  <input type="text" class="form-control border-0 shadow-none"
                    placeholder="검색" name="word"
                    value="${pageObject.word }"
                  />
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
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="/resources/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="#">
                        <div class="d-flex">
                          <div class="flex-shrink-0 me-3">
                            <div class="avatar avatar-online">
                              <img src="/resources/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                            </div>
                          </div>
                          <div class="flex-grow-1">
                            <span class="fw-semibold d-block"><%=id%></span>
                            <small class="text-muted"><%=grade%></small>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="/member/myPage">
                        <i class="bx bx-user me-2"></i>
                        <span class="align-middle">My Profile</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="setting">
                        <i class="bx bx-cog me-2"></i>
                        <span class="align-middle">Settings</span>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="/member/login">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">Log Out</span>
                      </a>
                    </li>
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
              <h4 class="fw-bold py-3 mb-4">내 옷장</h4>
<!-- 		옷 등록 버튼 -->
                 <div class="demo-inline-spacing">
                   <button type="button" class="btn btn-primary" onclick="location.href='enroll'">옷 등록</button>
                 </div>
<!-- 		!글쓰기 버튼 -->

              <!-- Hoverable Table rows -->
              <div class="card">
<!--                 <h5 class="card-header">공지 리스트</h5> -->
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
						<td><fmt:formatDate value="${closet.clothes_purchase_year}" pattern="yyyy-MM-dd"/></td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="update?no=${vo.no }&inc=0&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
                                ><i class="bx bx-edit-alt me-1"></i> 수정</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i> 삭제</a
                              >
                            </div>
                          </div>
                        </td>
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
                  <li class="page-item first">
                    <a class="page-link" href="list?page=1"
                      ><i class="tf-icon bx bx-chevrons-left"></i
                    ></a>
                  </li>
                  <c:if test="${pageMaker.prev}">
                  <li class="page-item prev">
                    <a class="page-link" href="list?page=${pageMaker.startPage +1} ;"
                      ><i class="tf-icon bx bx-chevron-left"></i
                    ></a>
                  </li>
                  </c:if>
                  <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                  <li class="page-item ${pageMaker.cri.pageNum== num ? "active":""}">
                    <a class="page-link" href="list?page=${num}">${num}</a>
                  </li>
                  </c:forEach>
                  <c:if test="${pageMaker.next }">
                  <li class="page-item next">
                    <a class="page-link" href="list?page=${pageMaker.endPage +1 }"
                      ><i class="tf-icon bx bx-chevron-right"></i
                    ></a>
                  </li>
                  </c:if>
                  <li class="page-item last">
                    <a class="page-link" href="list?page=${pageMaker.endPage}"
                      ><i class="tf-icon bx bx-chevrons-right"></i
                    ></a>
                  </li>
                </ul>
              </nav>
              </div>
              
              <!--/ Basic Pagination -->
              <hr class="my-5" />

 
            </div>
            <!-- / Content -->

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                <div>
                  <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                  <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                  <a
                    href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                    target="_blank"
                    class="footer-link me-4"
                    >Documentation</a
                  >

                  <a
                    href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                    target="_blank"
                    class="footer-link me-4"
                    >Support</a
                  >
                </div>
              </div>
            </footer>
            <!-- / Footer -->

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
    <script src="/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

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
