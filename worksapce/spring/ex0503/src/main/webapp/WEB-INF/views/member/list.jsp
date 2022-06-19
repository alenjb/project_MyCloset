<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	.dataRow:hover{
		background: #eee;
		cursor: pointer;
	}
</style>
<script type="text/javascript">
//아래 document가 다 표시가 되면 처리되도록 한다.
$(function () {
	$(".dataRow").click(function () {
		var id= $(this).find(".id").text();
		location = "view.do?id="+id+"&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}";
	});
});
</script>
</head>
<body>
	<div class="container">
		<h2>회원 리스트</h2>
		<table class="table">
			<tr>
				<th>사진</th>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>회원등급</th>
				<th>회원번호</th>
			</tr>
			<c:forEach items="${list }" var="vo">
				<tr class="dataRow">
					<td><img alt="사진" src="${vo.face}" class="img-rounded" style="width:20px; heigth:24px;"></td>
					<td class="id">${vo.id}</td>
					<td>${vo.name }</td>
					<td><fmt:formatDate value="${vo.birthday }" pattern="yyyy-MM-dd"/></td>
					<td>${vo.sex }</td>					
					<td>${vo.phone }</td>
					<td>${vo.email }</td>
					<td>${vo.gradeName }</td>
					<td>${vo.gradeNo }</td>		
				</tr>
				
			</c:forEach>
			<tr><td colspan="9"><pageNav:pageNav listURI="list.do" pageObject="${pageObject}"></pageNav:pageNav></td></tr>
		</table>
	</div>

</body>
</html>