<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 글보기</title>
<!-- ???뭐지 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>공지 글보기</h2>
		<table class="table">
		<tr>
		<th>공지 번호</th>
		<td>${vo.no }</td>
		</tr>
		<tr>
		<th>공지 제목</th>
		<td>${vo.title }</td>
		</tr>
		<tr>
		<th>공지 작성자</th>
		<td>${vo.writer }</td>
		</tr>
		<tr>
		<th>공지 내용</th>
		<td>${vo.content }</td>
		</tr>
		<tr>
		<th>공지 작성일</th>
		<td><fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
		<th>공지 종료일</th>
		<td><fmt:formatDate value="${vo.endDate }" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
			<td colspan="2">
			<a href="update?no=${vo.no }&inc=0&page=${param.page}&perPageNum=${param.perPageNum}" class="btn btn-default">수정</a>
			<a href="delete?no=${vo.no }" class="btn btn-default" id="deleteBtn">삭제</a>
			<a href="list?page=${param.page}&perPageNum=${param.perPageNum}" class="btn btn-default">리스트</a>
			</td>
		</table>
	</div>
</body>
</html>