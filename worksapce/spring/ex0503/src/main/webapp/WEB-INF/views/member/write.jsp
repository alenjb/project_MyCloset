<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	$("#writeForm").submit(function(e) {
		
		alert("회원 등록 처리");
		//submit을 무시 시킨다.
	});
	
	//아이디 중복체크
	$("#id").keyup(function() {
		var id= $(this).val();
		//4글자 미만
		if(id.length <4){
			$("#idCheckDiv").removeClass("alert-success");
			$("#idCheckDiv").addClass("alert-danger");
			$("#idCheckDiv").text("아이디는 4글자 이상이어야 합니다.");
			return false;
		}
		
		//20자 초과
		if(id.length >20){
			$("#idCheckDiv").removeClass("alert-success");
			$("#idCheckDiv").addClass("alert-danger");
			$("#idCheckDiv").text("아이디는 20글자 미만이어야 합니다.");
			return false;
		}
		
		//서벌 가서 아이디 중복 체크 -> url과 입력데이터는 바뀌면 안된다. ->Ajax
		//url /member/idCheck
		//서버에서 전달받는 데이터를 result로 받음
		//기져온 데이터가 null이면 사용가능, 있으면 중복
		$("#idCheckDiv").load("/a/member/idCheck?id="+id, function (result) {
			console.log(result);
			if(result.indexOf("가능한") > -1){
				//중복이 되지 않은 경우
				$("#idCheckDiv").addClass("alert-success");
				$("#idCheckDiv").removeClass("alert-danger");
				$("#idCheckDiv").text("아이디 사용가능");
			} else{
				//중복된 경우
				$("#idCheckDiv").removeClass("alert-success");
				$("#idCheckDiv").addClass("alert-danger");
				$("#idCheckDiv").text("중복된 아이디");
			}
			
		});
	});
});
</script>
</head>
<body>
	<div class="container">
		<h2>회원가입 폼</h2>
		<form action="write.do" method="post" enctype="multipart/form-data" id="writeForm">
			<div class="form-group">
				<label for ="id">아이디</label>
<!-- 				autocomplete: 자동완성 -->
				<input id="id" name="id" required="required" placeholder="아이디 입력" pattern="[A-Za-z0-9]{4,20}"
				class="form-control" autocomplete="off">
				<div class="alert alert-danger" id="idCheckDiv">아이디는 4글자 이상 입력하셔야합니다.</div>
			</div>
			<div class="form-group">
				<label for ="password">비밀번호</label>
				<input id="password" name="password" required="required" pattern="[A-Za-z0-9]{4,20}"  placeholder="비밀번호 입력"
				class="form-control" type="password">
			</div>
			<div class="form-group">
				<label for ="pw2">비밀번호 확인</label>
				<input id="pw2" name="pw2" required="required"  placeholder="비밀번호 확인 입력" pattern="[A-Za-z0-9]{4,20}"
				class="form-control" type="password">
			</div>
			<div class="form-group">
				<label for ="name">이름</label>
				<input id="name" name="name" required="required" placeholder="이름 입력" pattern="[가-힣]{2,20}"
				class="form-control" > 
			</div>
			<div class="form-group">
				<label for ="sex">성별</label>
				<div>
					<label class="radio-inline"><input type="radio" name="sex" checked value="남자">남자</label>
					<label class="radio-inline"><input type="radio" name="sex"  value="여자">여자</label>
				</div>
			</div>
			<div class="form-group">
				<label for ="birthday">생년월일</label>
					<input id="birthday" name="birthday" required="required" placeholder="생년월일 입력"
					class="form-control datepicker" autocomplete="off" >
			</div>
			<div class="form-group">
				<label for ="phone">연락처</label>
					<input id="phone" name="phone"  placeholder="연락처 입력"
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
			<button class="btn btn-default" id="test">등록</button>
			<button class="btn btn-default" type="reset">새로입력</button>
			<button class="btn btn-default cancelBtn" type="button">취소</button>
		</form>
	</div>
	<script>
		$("#test").on("click", function() {
			console.log($("#writeForm").val());
		});
	</script>
</body>
</html>