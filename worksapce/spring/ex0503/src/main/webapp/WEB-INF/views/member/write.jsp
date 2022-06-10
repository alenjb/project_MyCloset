<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	// datepicker 클래스 이벤트 - 적정한 옵션을 넣어서 초기화 시켜 준다. 기본 datepicker()로 사용 가능
	   $(".datepicker").datepicker({
	   changeMonth: true,
	   changeYear: true,
	   dateFormat: "yy-mm-dd",
	   dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
	   monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
	   });
	
	// datepicker 클래스 이벤트
	   var now = new Date();
	   var startYear = now.getFullYear();
	   var yearRange = (startYear - 100) +":" + startYear ;
	   // datepicker - 초기값으로 셋팅하는 방법을 사용하면 2번째는 무시 당한다.
	   //원래 있던 datepicker에 option을 추가하는 방법이다.
	   $( ".datepicker" ).datepicker("option", {
	      "maxDate" : new Date(),
	      "yearRange": yearRange
	   });
	   
	   //취소버튼 처리 -> 이전페이지 이동
	  $(".cancelBtn").click(function() {
		history.back();
	});
	
	//회원가입 전처리 -유효성 검사
	$("#writeForm").submit(function() {
		alert("회원 등록 처리");
		//submit을 무시 시킨다.
		return false;
	})
});
</script>
</head>
<body>
	<div class="container">
		<h2>회원가입 폼</h2>
		<form action="write.do" method="post" enctype="multipart/form-data" id="witeFrom">
			<div class="form-group">
				<label for ="id">아이디</label>
<!-- 				autocomplete: 자동완성 -->
				<input id="id" name="id" required="required" pattern="[A-Za-z0-9]{4, 20}" placeholder="아이디 입력"
				class="form-control">
			</div>
			<div class="form-group">
				<label for ="pw">비밀번호</label>
				<input id="pw" name="pw" required="required" pattern=".{4, 20}" placeholder="비밀번호 입력"
				class="form-control" type="password">
			</div>
			<div class="form-group">
				<label for ="pw2">비밀번호 확인</label>
				<input id="pw2" name="pw2" required="required" pattern=".{4, 20}" placeholder="비밀번호 확인 입력"
				class="form-control" type="password">
			</div>
			<div class="form-group">
				<label for ="name">이름</label>
				<input id="name" name="name" required="required" pattern="[가-힣]{2, 10}" placeholder="이름 입력"
				class="form-control" >
			</div>
			<div class="form-group">
				<label for ="name">성별</label>
				<div>
					<label class="radio-inline"><input type="radio" name="sex" checked value="남자">남자</label>
					<label class="radio-inline"><input type="radio" name="sex"  value="여자">여자</label>
				</div>
			</div>
			<div class="form-group">
				<label for ="birth">생년월일</label>
					<input id="birth" name="birth" required="required" placeholder="생년월일 입력"
					class="form-control datepicker" autocomplete="off" >
			</div>
			<div class="form-group">
				<label for ="tel">연락처</label>
					<input id="tel" name="tel"  placeholder="연락처 입력"
					class="form-control" >
			</div>
			<div class="form-group">
				<label for ="email">이메일</label>
					<input id="email" name="email"  placeholder="이메일 입력" required="required"
					class="form-control" >
			</div>

			<div class="form-group">
				<label for ="faceFile">얼굴사진</label>
					<input id="faceFile" name="faceFile" type="file"
					class="form-control" >
			</div>
			<button class="btn btn-default">등록</button>
			<button class="btn btn-default" type="reset">새로입력</button>
			<button class="btn btn-default cancelBtn" type="button">취소</button>
		</form>
	</div>
</body>
</html>