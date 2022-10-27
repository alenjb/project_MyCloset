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
    <script type="text/javascript">
    $(function () {
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
<style type="text/css">

#searchBtn{
	padding:0px 0px 0px 0px;
}
#seachKeyBox{
	padding:4px 0px 0px 0px;
}
</style>
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
		<!-- Layout container -->
		<div class="layout-container">
			<%@ include file="/resources/js/navBar.jsp" %>
			<div class="layout-page">
			<%@ include file="/resources/js/searchBar_qna.jsp" %>
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">


              <!-- Hoverable Table rows -->
              <h4 class="fw-bold">질문</h4>
              <div class="card">
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <tbody class="table-border-bottom-0">
                      <tr>
                        <td><strong>제목</strong></td>
                        <td>${vo.QTitle}</td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td><strong>번호</strong></td>
                        <td>${vo.no}</td>
                      </tr>
                      <tr>
                        <td> <strong>작성일</strong></td>
                        <td><fmt:formatDate value="${vo.QDate}" pattern="yyyy-MM-dd"/></td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td> <strong>작성자</strong></td>
                        <td>${vo.QWriter}</td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <strong>내용</strong>
                        </td>
                        <td>${vo.QContent}</td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <strong>첨부파일</strong>
                        </td>
                        <td><img src="${vo.QImage}"></td>
                        <td>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <c:if test="${vo.ATitle ne null}">
	              <hr class="my-5">
	              <h4 class="fw-bold">답변</h4>
	              <div class="card">
	                <div class="table-responsive text-nowrap">
	                  <table class="table">
	                    <tbody class="table-border-bottom-0">
	                      <tr>
	                        <td><strong>제목</strong></td>
	                        <td>${vo.ATitle}</td>
	                        <td>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td><strong>번호</strong></td>
	                        <td>${vo.no}</td>
	                      </tr>
	                      <tr>
	                        <td> <strong>작성일</strong></td>
	                        <td><fmt:formatDate value="${vo.ADate}" pattern="yyyy-MM-dd"/></td>
	                        <td>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td> <strong>작성자</strong></td>
	                        <td>${vo.AWriter}</td>
	                        <td>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          <strong>내용</strong>
	                        </td>
	                        <td>${vo.AContent}</td>
	                        <td>
	                        </td>
	                      </tr>
	                      <tr>
	                        <td>
	                          <strong>첨부파일</strong>
	                        </td>
	                        <td><img src="${vo.AImage}"></td>
	                        <td>
	                        </td>
	                      </tr>                     
	                    </tbody>
	                  </table>
	                </div>
	              </div>
              </c:if>
              
              <div class="mt-2">
                  <button type="button" class="btn btn-primary me-1"
										onclick="location.href='list?type=${cri.type}&keyword=${cri.keyword}&pageNum=${cri.pageNum}&amount=${cri.amount}'">리스트</button>
				  <!-- 질문에 답변이 달리면 수정할 수 없음 -->
                  <c:if test="${vo.AContent eq null and grade ne '관리자'}">
                  <button type="button" class="btn btn-secondary me-1" 
                  onclick="location.href='update?no=${vo.no}&type=${cri.type}&keyword=${cri.keyword}&pageNum=${cri.pageNum}&amount=${cri.amount}'">수정</button>
                  </c:if>
                  
                  <c:if test="${grade eq '관리자' and vo.AContent eq null}">
                  <button type="button" class="btn btn-secondary me-1" 
                  onclick="location.href='writeAnswer?no=${vo.no}&type=${cri.type}&keyword=${cri.keyword}&pageNum=${cri.pageNum}&amount=${cri.amount}'">답변등록</button>
                  </c:if>
                  <c:if test="${grade eq '관리자' and vo.AContent ne null}">
                  <button type="button" class="btn btn-secondary me-1" 
                  onclick="location.href='updateAnswer?no=${vo.no}&type=${cri.type}&keyword=${cri.keyword}&pageNum=${cri.pageNum}&amount=${cri.amount}'">답변수정</button>
                  </c:if>
                  
                  
                  <button type="button" class="btn btn-success" onclick="location.href='delete?no=${vo.no }&type=${cri.type}&keyword=${cri.keyword}&pageNum=${cri.pageNum}&amount=${cri.amount}'">삭제</button>
              </div>
              <!--/ Hoverable Table rows -->

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

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
