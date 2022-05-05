<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<script type="text/javascript">
	$(function() {
		$(".dataRow").click(function() {
			var no = $(this).find(".no").text();
			location = "view.do?no=" + no + "&inc=1";
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h2>게시판 글보기</h2>
		<table class="table">
			<tr>
				<th>번호</th>
				<td>${vo.no }
			</tr>
			<tr>
				<th>제목</th>
				<td>${vo.title }
			</tr>
			<tr>
				<th>내용</th>
				<td>${vo.content }
			</tr>
			<tr>
				<th>작성자</th>
				<td>${vo.writer }
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${vo.writeDate }"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${vo.hit }
			</tr>
			<tr>
				<td colspan="2"><a
					href="update.do?no=${vo.no }"
					class="btn btn-default">수정</a> <a href="delete.do?no=${vo.no }"
					class="btn btn-default" id="deleteBtn">삭제</a> <a href="list.do"
					class="btn btn-default">리스트</a></td>
		</table>
	</div>
</body>
</html>