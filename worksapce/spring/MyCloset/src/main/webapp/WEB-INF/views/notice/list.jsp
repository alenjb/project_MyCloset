<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 리스트</title>
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
		<h2>공지 리스트</h2>
		<table class="table">
		<tr>
		<th>공지 번호</th>
		<th>공지 제목</th>
		<th>공지 작성자</th>
		<th>공지 작성일</th>
		<th>공지 종료일</th>

		</tr>
<!-- 		이 리스트는 어디에서 온거?? -->
		<c:forEach items="${list }" var="vo">
			<tr class="dataRow">
<!-- 			왜 이거만 클래스 줌? -->
				<td class="no">${vo.no}</td>
				<td>${vo.title}</td>
				<td>${vo.writer}</td>
				<td><fmt:formatDate value="${vo.writeDate}" pattern="yyyy-MM-dd"/></td>
				<td><fmt:formatDate value="${vo.endDate}" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><pageNav:pageNav listURI="list" pageObject="${pageObject}"></pageNav:pageNav></td>
		</tr>
		<tr>
			<td colspan="5"><a href="write" class="btn btn-default">쓰기</a></td>
		</tr>
		</table>
	</div>
</body>
</html>