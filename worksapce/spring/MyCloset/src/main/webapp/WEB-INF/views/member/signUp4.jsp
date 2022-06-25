<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<!-- 부트스트랩 css 사용 -->
<link rel="stylesheet" href="/css/sb-admin-2.min.css">
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/sb-admin-2.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

</head>
<body>
	
	<div class="container">
	<h2>MyCloset 회원가입</h2>
	
<!-- 	입력 폼 -->
		<form action="signUp" method="post" enctype="multipart/form-data" id="signUpForm">		
<!-- 			아이디 입력 -->
			<div class="form-group">
			<label for="id">아이디</label>
				<input class="form-control" id="id" placeholder="아이디는 영문과 숫자를 조합하여 4글자 이상 20글자 이하로 입력하세요"
				 pattern="[A-Za-z0-9]{4,20}" required="required" name="member_id">
			</div>
<!-- 			비밀번호 입력 -->
			<div class="form-group">
			<label for="password">비밀번호</label>
				<input class="form-control" id="password" placeholder="비밀번호는 영문, 숫자, 특수문자를 조합하여 4글자 이상 20글자 이하로 입력하세요"
				 pattern="[A-Za-z0-9]{4,20}" type="password" required="required" name="member_password">
			</div>
<!-- 			비밀번호 확인 입력 -->
			<div class="form-group">
			<label for="passwordCheck">비밀번호 확인</label>
				<input class="form-control" id="passwordCheck" placeholder="비밀번호를 한번 더 입력해주세요"
				 pattern="[A-Za-z0-9]{4,20}" type="password" required="required">
			</div>
<!-- 			이름 입력 -->
			<div class="form-group">
			<label for="name">이름</label>
				<input class="form-control" id="name" placeholder="이름을 입력하세요"
				 pattern="[A-Za-z가-힣]{1,15}"  required="required" name="member_name">
			</div>
<!-- 			성별 -->
			<div class="form-group">
			<label for="sex">성별</label>
				<label class="radio-inline"><input id="sex" type="radio" checked value="남자" required="required" name="member_sex">남자</label>
				<label class="radio-inline"><input id="sex" type="radio" value="여자" name="member_sex">여자</label>
			</div>			
<!-- 			연락처 -->
			<div class="form-group">
			<label for="phone">연락처</label>
				<input class="form-control" id="phone" placeholder="연락처를 입력하세요"
				 required="required" name="member_phone">
			</div>
<!-- 			이메일 -->
			<div class="form-group">
			<label for="email">이메일</label>
				<input class="form-control" id="email" placeholder="이메일을 입력하세요"
				 required="required" name="member_email">
			</div>
<!-- 			키 -->
			<div class="form-group">
			<label for="height">신장</label>
				<input class="form-control" id="height" placeholder="신장을 입력하세요"
				 name="member_height">
			</div>
<!-- 			상체 사이즈 -->
			<div class="form-group">
				<label for="top">상체 사이즈</label> 
					<select class="form-control" id="top" name="member_top_size">
						<option>85</option>
						<option>90</option>
						<option>95</option>
						<option>100</option>
						<option>105</option>
						<option>110</option>
					</select>
			</div>
<!-- 			하체 사이즈 -->
			<div class="form-group">
				<label for="bottom">하체 사이즈</label> 
					<select class="form-control" id="bottom" name="member_bottom_size">
						<option>85</option>
						<option>90</option>
						<option>95</option>
						<option>100</option>
						<option>105</option>
						<option>110</option>
					</select>
			</div>
<!-- 			신발 사이즈 -->
			<div class="form-group">
				<label for="shoes">신발 사이즈</label> 
					<select class="form-control" id="shoes" name="member_shoes_size">
						<option>220</option>
						<option>225</option>
						<option>230</option>
						<option>235</option>
						<option>240</option>
						<option>250</option>
					</select>
			</div>
<!-- 			얼굴사진 -->
			<div class="form-group">
			<label for="faceFile">얼굴사진</label>
				<input class="form-control" id="faceFile" type="file" name="member_faceFile">
			</div>
		</form>
	</div>
</body>
</html>