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

    <title>MY PAGE</title>

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
  </head>

  <body>
  <%
	LoginVO value = (LoginVO) session.getAttribute("login");
	//session.getAttribute()는 object테이터타입이기에 명시적형변환으로 (String)을 해줘야한다.
	String id = value.getMember_id();
	String grade = value.getMember_grade();
	String face = value.getMember_face();
	pageContext.setAttribute("grade", grade);
	
	%>
<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<!-- Layout container -->
		<div class="layout-container">
			<%@ include file="/resources/js/navBar.jsp" %>
        <div class="layout-page">
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Account Settings /</span> Account</h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i> Account</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="pages-account-settings-notifications.html"
                        ><i class="bx bx-bell me-1"></i> Notifications</a
                      >
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="pages-account-settings-connections.html"
                        ><i class="bx bx-link-alt me-1"></i> Connections</a
                      >
                    </li>
                  </ul>
                 <form id="update" method="POST" action="update" enctype="multiPart/form-data">
                  <div class="card mb-4">
                    <h5 class="card-header">회원정보</h5>
<%--                     </c:forEach> --%>
                    <!-- Account -->
                    <div class="card-body">
                      <div class="d-flex align-items-start align-items-sm-center gap-4">
                        <img
                          src="<%=face%>"
                          alt="user-avatar"
                          class="d-block rounded"
                          height="100"
                          width="100"
                          id="uploadedAvatar"
                        />
                        	
                        
                        <div class="button-wrapper">
                          <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                            <span class="d-none d-sm-block">사진 업로드</span>
                            <i class="bx bx-upload d-block d-sm-none"></i>
                            <input
                              type="file"
                              id="upload"
                              name="member_faceFile"
                              class="account-file-input"
                              hidden
                              accept="image/png, image/jpeg"
                            />
                          </label>

                          <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
                        </div>
                      </div>
                    </div>
                    <hr class="my-0" />
                    <div class="card-body">
                      <form id="update" method="POST" action="update">
                        <div class="row justify-content-center">
                            <label for="member_name" class="form-label col-md-4">이름</label>
                          <div class="mb-3 col-md-8" style="float: none; margin:0 auto;">
                            <input
                              class="form-control"
                              type="text"
                              id="member_name"
                              name="member_name"
                              value="${memberVO.member_name}"
                              
                              autofocus
                            />
                          </div>
                            <label for="member_email" class="form-label col-md-4">이메일</label>
                          <div class="mb-3 col-md-8">
                            <input
                              class="form-control"
                              type="text"
                              id="member_email"
                              name="member_email"
                              value="${memberVO.member_email}"
                              placeholder="john.doe@example.com"
                              
                            />
                          </div>
                            <label for="member_sex" class="form-label col-md-4">성별</label>
                          <div class="mb-3 col-md-8">
                            <input
                              type="text"
                              class="form-control"
                              id="member_sex"
                              name="member_sex"
                              value="${memberVO.member_sex}"
                              
                            />
                          </div>
                            <label class="form-label col-md-4" for="member_phone">전화번호</label>
                          <div class="mb-3 col-md-8">
                            <div class="input-group input-group-merge">
                              <span class="input-group-text">KR (+82)</span>
                              <input
                                type="text"
                                id="member_phone"
                                name="member_phone"
                                class="form-control"
                                value="${memberVO.member_phone}"
                                
                              />
                            </div>
                          </div>
                          <input name="member_id" value="${memberVO.member_id}" hidden="hidden">
                          <input name="member_grade" value="${memberVO.member_grade}" hidden="hidden">
                            <label for="member_height" class="form-label col-md-4">키</label>
                          <div class="mb-3 col-md-8">
                            <input class="form-control" type="text" id="member_height" name="member_height" placeholder="California" value="${memberVO.member_height}"  />
                          </div>
                            <label for="member_top_size" class="form-label col-md-4">상체 사이즈</label>
                          <div class="mb-3 col-md-8">
                            <input class="form-control" type="text" id="member_top_size" name="member_top_size" placeholder="California" value="${memberVO.member_top_size}"  />
                          </div>
                            <label for="member_bottom_size" class="form-label col-md-4">하체 사이즈</label>
                          <div class="mb-3 col-md-8">
                            <input class="form-control" type="text" id="member_bottom_size" name="member_bottom_size" placeholder="California" value="${memberVO.member_bottom_size}"  />
                          </div>
                            <label for="member_shoes_size" class="form-label col-md-4">신발 사이즈</label>
                          <div class="mb-3 col-md-8">
                          <div class="input-group input-group-merge">
                            <input class="form-control" type="text" id="member_shoes_size" name="member_shoes_size" placeholder="California" value="${memberVO.member_shoes_size}"  />
                            <span class="input-group-text">mm</span>
                            </div>
                          </div>
                            <label for="member_reg_date" class="form-label col-md-4">가입 날짜</label>
                          <div class="mb-3 col-md-8">
                            <input class="form-control" type="date" id="member_reg_date" name="member_reg_date" readonly="readonly" placeholder="California" value=<fmt:formatDate value="${memberVO.member_reg_date}" pattern="yyyy-MM-dd" />  />
                          </div>
                          
                        </div>
                        <div class="mt-2">
<!--                           <a href="/member/myPage"><button type="submit" class="btn btn-primary me-2" >수정완료</button></a> -->
                          <button type="submit" class="btn btn-primary me-2" >수정완료</button>
                        </div>
                      </form>
                    </div>
                  </div>
                 </form>
                    <!-- /Account -->
                  <div class="card">
                    <h5 class="card-header">Delete Account</h5>
                    <div class="card-body">
                      <div class="mb-3 col-12 mb-0">
                        <div class="alert alert-warning">
                          <h6 class="alert-heading fw-bold mb-1">Are you sure you want to delete your account?</h6>
                          <p class="mb-0">Once you delete your account, there is no going back. Please be certain.</p>
                        </div>
                      </div>
                      <form id="formAccountDeactivation" action="delete">
                        <div class="form-check mb-3">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            name="accountActivation"
                            id="accountActivation"
                          />
                          <label class="form-check-label" for="accountActivation"
                            >I confirm my account deactivation</label
                          >
                        </div>
                        <button type="submit" class="btn btn-danger deactivate-account" >Deactivate Account</button>
                      </form>
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
    <script src="/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

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
