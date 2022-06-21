<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
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
		<h2>${title}</h2>
		${login}
		<table class="table">
		

			<tr>
				<th>아이디</th>
				<td>${vo.id }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${vo.name }</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${vo.sex }</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><fmt:formatDate value="${vo.birthday }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${vo.phone }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${vo.email }</td>
			</tr>
			<tr>
				<th>회원가입일</th>
				<td><fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><img src="${vo.face }" alt="사진"></td>
			</tr>
			<tr>
				<th>등급</th>
				<td>${vo.gradeName }</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${empty param.id}">
<!-- 					개인메뉴 -->
						<a href="update.do" class="btn btn-default">정보수정</a>
						<a href="delete.do" class="btn btn-default">회원탈퇴</a>
						<a href="changePassword.do" class="btn btn-default">비밀번호 변경</a>
					</c:if>

					<c:if test="${login.gradeNo == 10 && !empty param.id && login.id != param.id}">
<!-- 					관리자메뉴 -->
					<form action="changeGradeNo.do" method="post">
						<input type="hidden" name="id" value="${vo.id }">
						<input type="hidden" name="page" value="${param.page }">
						<input type="hidden" name="perPageNum" value="${param.perPageNum }">
						<div class="input-group">
							<select name="gradeNo" class="form-control">
								<option ${(vo.gradeNo == 1)?"selected":""} value="1">일반회원</option>
								<option ${(vo.gradeNo == 10)?"selected":""} value="10">관리자</option>
							</select>
							<div class="input-group-btn">
								<button class="btn btn-default">등급 변경</button>
							</div>
						</div>
					
					</form>
					</c:if>
				
				</td>
			</tr>			
		</table>
	</div>
</body>
</html>