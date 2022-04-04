<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 보기</title>
<style type="text/css">
	#updateMsgDiv {
		display: none;
	}
</style>
<script type="text/javascript">
	$(function() {
		//객체의 너비 구하기 - 객체.width() -단위가 없는 숫자가 나온다.
		//객체의 너비 조정하기 - 객체.width(너비값) -너비값은 단위를 반드시 붙여야한다.
		//이미지의 너비
		var imageWidth = $("#image").width();
		var imageDivWidth= $("#imageDiv").innerWidth();
// 		alert("이미지의 너비:"+imageWidth+"\n이미지 Div의 너비"+imageDivWidth);
		//이미지의 너비가 크면 줄여야 한다.
		if(imageDivWidth < imageWidth) $("#image").width("100%");  //div 너비와 맞추려면 imageDivWidth + "px"
		
		//수정버튼의 메시지는 처음에는 안보이게 한다. ->style -display :none
		//수정버튼에 마우스가 올라가면
// 		$("#updateBtn")
// 		.mouseover(function() {
// 			$("#updateMsgDiv").show();
// 		})
// 		.mouseout(function() {
// 			$("#updateMsgDiv").hide();
// 		})
// 		;
		
		
	});
</script>
</head>
<body>
<div class="container">
	<h2>이미지 보기</h2>
	<div class="well row">
		<div class="col-sm-3">번호</div>
		<div class="col-sm-9">${vo.no}</div>
	</div>
	<div class="well row">
		<div class="col-sm-3">제목</div>
		<div class="col-sm-9">${vo.title}</div>
	</div>
	<div class="well row">
		<div class="col-sm-3">이미지</div>
		<div class="col-sm-9" id="imageDiv"><img src="${vo.fileName}" class="thumbnail" id="image" ></div>
	</div>
	
	<div class="well row">
		<div class="col-sm-3">내용</div>
		<div class="col-sm-9">${vo.content}</div>
	</div>
	<div class="well row">
		<div class="col-sm-3">작성자</div>
		<div class="col-sm-9">${vo.name}(${vo.id })</div>
	</div>
	<div class="well row">
		<div class="col-sm-3">작성일</div>
		<div class="col-sm-9"><fmt:formatDate value="${vo.writeDate}" pattern="yyyy-MM-dd"/></div>
	</div>
<!-- 	tooltip을 사용하려면 js에서 $(document).ready(function(){ $('[data-toggle="tooltip"]').tooltip(); }); 를 추가해야 한다. -->
	<a href="update.do?no=${vo.no }&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
	class="btn btn-default" id="updateBtn" data-toggle="tooltip" data-plcaement="top" title="이미지 바꾸기는 이미지 제목 오른쪽의 바꾸기 버튼을 이용하세요.">수정</a>
		<a href="delete.do?no=${vo.no }&deleteImage=${vo.fileName}"
	class="btn btn-default">삭제</a>
		<a href="List.do?page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
	class="btn btn-default">리스트</a>
	<div class="alert alert-info" id="updateMsgDiv">이미지 바꾸기는 이미지 제목 오른쪽의 바꾸기 버튼을 이용하세요.</div>
	
</div>
</body>
</html>