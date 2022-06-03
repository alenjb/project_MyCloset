<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>
</head>
<!-- ???뭐지 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	$(function() {
  		$("#cancelBtn").click(function(){
  			history.back();
  		});
		
	});
  </script>
<body>
	<div class="container">
		<h2>공지 수정폼</h2>
		<form action="update" method="post">
<!-- 		이 부분이 있어야 param의 page와 perPageNum이 그대로 넘어감 -->
			<input type="hidden" name="page" value="${param.page }"> 
			<input type="hidden" name="perPageNum" value="${param.perPageNum }">
			<div class="form-group">
				<label>제목</label> <input name="title" id="title"
					class="form-control" value="${vo.title}">
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea name="content" id="content" class="form-control" rows="7" >${vo.content}</textarea>
			</div>
			<div class="form-group">
				<label>작성자</label>
<%-- 				일단 임시로 이정빈으로 해놓음 -> 나중에는 ${param.writer } --%>
				<input name="writer" id="writer" class="form-control" value="이정빈" readonly="readonly" ></input>
			</div>
			<div class="form-group">
<!-- 			sysDate 오류 가능 -->
				<label>공지 작성일</label> <input name="writeDate" id="writeDate" class="form-control" value="<fmt:formatDate value="${vo.writeDate }"
						pattern="yyyy-MM-dd" />">
			</div>
			<div class="form-group">
				<label>공지 종료일</label> <input name="endDate" id="endDate"
					class="form-control" value="<fmt:formatDate value="${vo.endDate }"
						pattern="yyyy-MM-dd" />">
			</div>

			<button>수정</button>
			<button type="reset">복구</button>
			<button type="button" id="cancelBtn">취소</button>

		</form>

	</div>
</body>
</html>