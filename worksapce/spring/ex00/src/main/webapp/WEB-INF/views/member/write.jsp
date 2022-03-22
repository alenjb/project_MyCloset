<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
</head>
<body>
	<div class="container">
		<h2>회원가입 폼</h2>
		<form action="write.do" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for ="id">아이디</label>
				<input id="id" name="id" required="required" pattern="[A-Za-z0-9]{4,20}" placeholder="아이디 입력"
				class="form-control" autocomplete="off">
			</div>
			<div class="form-group">
				<label for ="pw">비밀번호</label>
				<input id="pw" name="pw" required="required" pattern=".{4,20}" placeholder="비밀번호 입력"
				class="form-control" type="password">
			</div>
			<div class="form-group">
				<label for ="pw2">비밀번호 확인</label>
				<input id="pw2" name="pw2" required="required" pattern=".{4,20}" placeholder="비밀번호 확인 입력"
				class="form-control" type="password">
			</div>
			<div class="form-group">
				<label for="name">이름</label> <input id="name" name="name"
					required="required" pattern="[가-힣]{2,10}"
					placeholder="이름 입력" class="form-control" >
			</div>
			<div class="form-group">
				<label>성별</label> 
				<div>
					<label class="radio-inline"><input type="radio" name="gender" checked value="남자">남자</label>
					<label class="radio-inline"><input type="radio" name="gender" value="여자">여자</label>
				</div>
			</div>
			
			<div class="form-group">
				<label for="birth">생년월일</label> 
				<input id="birth" name="birth"
					required="required" placeholder="생년월일 입력" class="form-control" >
			</div>
			
		</form>
	</div>
</body>
</html>