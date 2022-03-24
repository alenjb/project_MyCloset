<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<script type="text/javascript">
$(function () {
	
	//id 중복체크 변수, 비밀번호와 비밀번호 확인이 같은지 체크 변수 -> 전역변수 선언
	var idCheck = false;
	var pwCheck = false;
	// datepicker 클래스 이벤트 - 적정한 옵션을 넣어서 초기화 시켜 준다. 기본 datepicker()로 사용 가능

	   $(".datepicker").datepicker({
		   changeMonth: true,
		   changeYear: true,
		   dateFormat: "yy-mm-dd",
		   dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		   monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
	   });
	  
	   // datepicker 클래스 이벤트

	   var now = new Date();
	   var startYear = now.getFullYear();
	   var yearRange = (startYear - 100) +":" + startYear ;

	   // datepicker - 초기값으로 셋팅하는 방법을 사용하면 2번째는 무시 당한다.
	   //원래 있던 datepicker에 option을 추가하는 방법이다.
	   $( ".datepicker" ).datepicker("option", {
	      "maxDate" : new Date(),
	      yearRange: yearRange
	   });
	   
	   //회원가입 전처리 - 유효성 검사
	   $("#writeForm").submit(function () {

		   alert("회원 등록 처리");
		   //submit을 무시 시킨다.
		   //return false;
	});
	   
	   //아이디 실시간 중복 체크
	   $("#id").keyup(function () {
		  idCheck=false;
		  var id= $("#id").val();
		  id=$.trim(id);
		  $("#id").val(id);
// 		  alert(id);
		//4자 미만
		if(id.length <4){
			$("#idCheckDiv").removeClass("alert-success");
			$("#idCheckDiv").addClass("alert-danger");
			$("#idCheckDiv").text("아이디는 4글자 이상 입력하셔야합니다.");
			return;
			}
		//20초과
		if(id.length >20){
			$("#idCheckDiv").removeClass("alert-success");
			$("#idCheckDiv").addClass("alert-danger");
			$("#idCheckDiv").text("아이디는 20글자 이내로 입력하셔야합니다.");
			return;		
		}
	
	//서버로 가서 아이디 중복 체크를 하러 가자 ->url과 입력 데이터는 바뀌면 안된다. ->Ajax
	//url /member/idCheck
	//가져온 데이터가 null이면 사용가능, 있으면 중복
	//result -> 서버에서 전달해 주는 데이터
	$("#idCheckDiv").load("/member/idCheck?id="+id, function(result){
		//중복이 되지 않은 경우
		$("idCheckDiv").removeClass("alert-success alert-danger");
		//중복 O 배경은 빨간색
		if(result.indexOf("가능한") == -1){
			$("#idCheckDiv").addClass("alert-danger");
			idCheck= false;
		}else{
			//중복 X 배경은 파란색
			$("#idCheckDiv").removeClass("alert-danger");
			$("#idCheckDiv").addClass("alert-success");
			idCheck= true;
		}
	});
	

	   });
		//비밀번호 처리 이벤트
		$("#pw").keyup(function () {
			pwCheck= false;
//			$(this)== $("pw")
			var pw=$(this).val()
// 			alert(pw.length);

//			4글자 미만 처리
			if(pw.length <4){
				$("#pwCheckDiv").removeClass("alert-success");
				$("#pwCheckDiv").addClass("alert-danger");
				$("#pwCheckDiv").text("비밀번호는 4글자 이상 입력하셔야합니다.");
				return;
				}
				
//			20글자 초과 처리
			if(pw.length >20){
				$("#pwCheckDiv").removeClass("alert-success");
				$("#pwCheckDiv").addClass("alert-danger");
				$("#pwCheckDiv").text("비밀번호는 20글자 미만으로 입력하셔야합니다.");
				return;
				}
				
				//4~20자 사이 -> pw와 pw2 같은지 체크
				var pw2=$("#pw2").val();
				if(pw==pw2){
					//비밀번호가 같은 경우
					$("#pwCheckDiv, #pw2CheckDiv").removeClass("alert-danger");
					$("#pwCheckDiv, #pw2CheckDiv").addClass("alert-success");
					$("#pwCheckDiv, #pw2CheckDiv").text("사용가능한 비밀번호 입니다.");
					pwCheck = true;
				}else{//비밀번호가 다른경우
					$("#pwCheckDiv, #pw2CheckDiv").removeClass("alert-success");
					$("#pwCheckDiv, #pw2CheckDiv").addClass("alert-danger");
					$("#pwCheckDiv").text("비밀번호가 일치하지 않습니다.");
					if(pw2.length < 4)
						$("#pw2CheckDiv").text("비밀번호는 4글자 이상 입력하셔야합니다.");
					else if (pw2.length > 20)
						$("#pw2CheckDiv").text("비밀번호는 20글자 미만으로 입력하셔야합니다.");
					else
						$("#pw2CheckDiv").text("비밀번호가 일치하지 않습니다.");
				}
				
		});
		//비밀번호 확인 처리 이벤트
		$("#pw2").keyup(function () {
			var pw2=$(this).val()
// 			alert(pw2.length);
			
//			4글자 미만 처리
			if(pw2.length <4){
				$("#pw2CheckDiv").removeClass("alert-success");
				$("#pw2CheckDiv").addClass("alert-danger");
				$("#pw2CheckDiv").text("비밀번호는 4글자 이상 입력하셔야합니다.");
				return;
				}
				
//			20글자 초과 처리
			if(pw2.length >20){
				$("#pw2CheckDiv").removeClass("alert-success");
				$("#pw2CheckDiv").addClass("alert-danger");
				$("#pw2CheckDiv").text("비밀번호는 20글자 미만으로 입력하셔야합니다.");
				return;
				}
				

			//4~20자 사이 -> pw와 pw2 같은지 체크
			var pw=$("#pw").val();
			if(pw==pw2){
				//비밀번호가 같은 경우
				$("#pw2CheckDiv, #pwCheckDiv").removeClass("alert-danger");
				$("#pw2CheckDiv, #pwCheckDiv").addClass("alert-success");
				$("#pw2CheckDiv, #pwCheckDiv").text("사용가능한 비밀번호 입니다.");
				pwCheck=true;
			}else{//비밀번호가 다른경우
				$("#pw2CheckDiv, #pwCheckDiv").removeClass("alert-success");
				$("#pw2CheckDiv, #pwCheckDiv").addClass("alert-danger");
				$("#pw2CheckDiv").text("비밀번호가 일치하지 않습니다.");
				if(pw.length < 4)
					$("#pwCheckDiv").text("비밀번호는 4글자 이상 입력하셔야합니다.");
				else if (pw2.length > 20)
					$("#pwCheckDiv").text("비밀번호는 20글자 미만으로 입력하셔야합니다.");
				else
					$("#pwCheckDiv").text("비밀번호가 일치하지 않습니다.");
			}

		});   
		//비밀번호 처리 이벤트의 끝
		
		//회원 가입 이벤트
		$("#writeForm").submit(function () {
			
// 			alert("아이디 체크: "+idCheck + "\n비밀번호 체크: "+pwCheck)
			
			//아이디 중복체크 -사용 가능한 아이디인지 확인
 			if (!idCheck){
 				alert("중복이 되지않는 아이디를 사용해야합니다.");
 				$("#id").focus();
 				//form 전송을 무시시킨다.
 				return false;
 				
 			}
 			
			//비밀번호와 비밀번호 왁인
 			if (!pwCheck){
 				alert("비밀번호와 비밀번호 확인의 길이가 4~20이내이고 같아야 합니다.");
 				$("#pw").focus();
 				//form 전송을 무시시킨다.
 				return false;
 				
 			}
			
			//form 전송을 무시시킨다. -> 나중에 꼭 주석처리해야됨
			//return false;
		});
});//$(function의 끝)
</script>
</head>
<body>
	<div class="container">
		<h2>회원가입 폼</h2>
		<form action="write.do" method="post" enctype="multipart/form-data" id="writeForm">
			<div class="form-group">
				<label for ="id">아이디</label>
				<input id="id" name="id" required="required" pattern="[A-Za-z0-9]{4,20}" placeholder="아이디 입력"
				class="form-control" autocomplete="off">
				<div class="alert alert-danger" id="idCheckDiv">아이디는 4글자 이상 입력하셔야합니다.	</div>
			</div>
			<div class="form-group">
				<label for ="pw">비밀번호</label>
				<input id="pw" name="pw" required="required" pattern=".{4,20}" placeholder="비밀번호 입력"
				class="form-control" type="password">
				<div id="pwCheckDiv" class="alert alert-danger">비밀번호는 4자 이상이어야합니다.</div>
			</div>
			<div class="form-group">
				<label for ="pw2">비밀번호 확인</label>
				<input id="pw2" name="pw2" required="required" pattern=".{4,20}" placeholder="비밀번호 확인 입력"
				class="form-control" type="password">
				<div id="pw2CheckDiv" class="alert alert-danger">비밀번호는 4자 이상이어야합니다.</div>
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
				<input id="birth" name="birth" required="required" placeholder="생년월일 입력" class="form-control datepicker" autocomplete="off" >
			</div>

			<div class="form-group">
				<label for="tel">연락처</label> 
				<input id="tel" name="tel" placeholder="연락처 입력" class="form-control" >
			</div>
			
			<div class="form-group">
				<label for="email">이메일</label> 
				<input id="email" name="email" placeholder="이메일 입력" required="required" class="form-control" >
			</div>

			<div class="form-group">
				<label for="photoFile">사진</label> 
				<input id="photoFile" name="photoFile" type="file"  class="form-control" >
			</div>
			
			<button class="btn btn-default">등록</button>
			<button class="btn btn-default" type="reset">새로입력</button>
			<button class="btn btn-default cancelBtn" type="button" >취소</button>

			
		</form>
	</div>
</body>
</html>