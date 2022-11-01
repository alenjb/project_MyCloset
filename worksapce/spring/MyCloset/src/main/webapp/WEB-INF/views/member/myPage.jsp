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
    <!-- 	jQuery CDN	 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/resources/assets/js/config.js"></script>
    <script type="text/javascript">
    	$(function () {
    		//탈퇴 동의 해야지 탈퇴 가능
    		$("#accountActivation").on("change", function(e) {
	    		var checked = $("#accountActivation").is(':checked');
    			var target = document.getElementById('deleteBtn');
	    		if(checked==true){
	    			  target.disabled = false;
	    		}else{
	    			  target.disabled = true;
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
	String face = value.getMember_face();
	pageContext.setAttribute("grade", grade);
	
	%>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
	<%@ include file="/resources/js/navBar.jsp" %>

	<!-- Layout container -->
        <div class="layout-page">
        <%@ include file="/resources/js/searchBar_myPage.jsp" %>
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                <div class="col-md-12">
	                <h4 class="fw-bold py-3 mb-4">마이페이지</h4>
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

                      </div>
                    </div>
                    <hr class="my-0" />
                    <div class="card-body">
                      <form id="formAccountSettings" method="POST" onsubmit="return false">
                        <div class="row justify-content-center">
                            <label for="firstName" class="form-label col-md-4">이름</label>
                          <div class="mb-3 col-md-8" style="float: none; margin:0 auto;">
                            <input
                              class="form-control"
                              type="text"
                              id="firstName"
                              name="firstName"
                              value="${memberVO.member_name}"
                              readonly="readonly"
                              onfocus="this.blur()"
                            />
                          </div>
                            <label for="email" class="form-label col-md-4">이메일</label>
                          <div class="mb-3 col-md-8">
                            <input
                              class="form-control"
                              type="text"
                              id="email"
                              name="email"
                              value="${memberVO.member_email}"
                              readonly="readonly"
                              onfocus="this.blur()"
                              
                            />
                          </div>
                            <label for="organization" class="form-label col-md-4">성별</label>
                          <div class="mb-3 col-md-8">
                            <input
                              type="text"
                              class="form-control"
                              id="organization"
                              name="organization"
                              value="${memberVO.member_sex}"
                              readonly="readonly"
                              onfocus="this.blur()"
                              
                            />
                          </div>
                            <label class="form-label col-md-4" for="phoneNumber">전화번호</label>
                          <div class="mb-3 col-md-8">
                            <div class="input-group input-group-merge">
                              <span class="input-group-text">KR (+82)</span>
                              <input
                                type="text"
                                id="phoneNumber"
                                name="phoneNumber"
                                class="form-control"
                                value="${memberVO.member_phone}"
                                readonly="readonly"
                                onfocus="this.blur()"
                              />
                            </div>
                          </div>
                            <label for="height" class="form-label col-md-4">키</label>
                          <div class="mb-3 col-md-8">
                            <input class="form-control" type="text" id="height" name="height" placeholder="California" value="${memberVO.member_height}" readonly="readonly" onfocus="this.blur()"/>
                          </div>
                            <label for="topSize" class="form-label col-md-4">상체 사이즈</label>
                          <div class="mb-3 col-md-8">
                            <input class="form-control" type="text" id="topSize" name="topSize" placeholder="California" value="${memberVO.member_top_size}" readonly="readonly" onfocus="this.blur()"/>
                          </div>
                            <label for="bottomSize" class="form-label col-md-4">하체 사이즈</label>
                          <div class="mb-3 col-md-8">
                            <input class="form-control" type="text" id="bottomSize" name="bottomSize" placeholder="California" value="${memberVO.member_bottom_size}" readonly="readonly" onfocus="this.blur()"/>
                          </div>
                            <label for="shoesSize" class="form-label col-md-4">신발 사이즈</label>
                          <div class="mb-3 col-md-8">
                          <div class="input-group input-group-merge">
                            <input class="form-control" type="text" id="shoesSize" name="shoesSize" placeholder="California" value="${memberVO.member_shoes_size}" readonly="readonly" onfocus="this.blur()"/>
                            <span class="input-group-text">mm</span>
                            </div>
                          </div>
                            <label for="regDate" class="form-label col-md-4">가입 날짜</label>
                          <div class="mb-3 col-md-8">
                            <input class="form-control" type="date" id="regDate" name="regDate" placeholder="California" value=<fmt:formatDate value="${memberVO.member_reg_date}" pattern="yyyy-MM-dd"/> readonly="readonly" onfocus="this.blur()"/>
                          </div>
                          
                        </div>
                        <div class="mt-2">
                          <a href="/member/myPage/update"><button type="button" class="btn btn-primary me-2" >수정하기</button></a>
                        </div>
                      </form>
                    </div>
                  </div>
                    <!-- /Account -->
                  <div class="card">
                    <h5 class="card-header">탈퇴하기</h5>
                    <div class="card-body">
                      <div class="mb-3 col-12 mb-0">
                        <div class="alert alert-warning">
                          <h6 class="alert-heading fw-bold mb-1">정말로 탈퇴하시겠습니까?</h6>
                          <p class="mb-0">한번 탈퇴하시면 계정을 복구할 수 없습니다.</p>
                        </div>
                      </div>
                      <form id="formAccountDeactivation" action="myPage/delete">
                      	<div class="form-check mb-3">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            name="accountActivation"
                            id="accountActivation"
                          />
                          <label class="form-check-label" for="accountActivation">위 조건을 인지하였고 탈퇴하겠습니다.</label>
                        </div>
                     	<button type="submit" class="btn btn-danger deactivate-account" id="deleteBtn" disabled="disabled">탈퇴하기</button>
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
