<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원가입</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Welcome to MyCloset</h1>
                            </div>
                            <!-- 	입력 폼 -->
                            <form class="user">
                            	<!-- 			아이디 입력 -->
                                <div class="form-group">
									<input class="form-control form-control-user" id="id" placeholder="사용할 아이디를 입력하세요"
									 pattern="[A-Za-z0-9]{4,20}" autocomplete="off" required="required" name="member_id" >
								</div>
								<!-- 			비밀번호 입력 -->
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
										<input class="form-control form-control-user" id="password" placeholder="비밀번호를 입력하세요" autocomplete="off"
											 pattern="[A-Za-z0-9]{4,20}" type="password" required="required" name="member_password">
                                    </div>
                                    <!-- 			비밀번호 확인 입력 -->
                                    <div class="col-sm-6">
                                        <input class="form-control form-control-user" id="passwordCheck" placeholder="비밀번호를 한 번 더 입력하세요" autocomplete="off"
											 pattern="[A-Za-z0-9]{4,20}" type="password" required="required" >
                                    </div>
                                </div>
                                <!-- 			이름 입력 -->
                                <div class="form-group row">
                                    <div class="col-sm-5 mb-3 mb-sm-0">
                                        <input class="form-control form-control-user" id="name" placeholder="이름을 입력하세요"
										 pattern="[A-Za-z가-힣]{1,15}"  required="required" name="member_name">
                                    </div>
                                  <!-- 			연락처 -->
                                 <div class="col-sm-7">
                                     <input class="form-control form-control-user" id="phone" placeholder="연락처를 입력하세요" required="required" name="member_phone">
                                 </div>
                                    
               					</div>
                                  <!-- 			이메일 입력 -->
                               <div class="form-group">
								<input class="form-control form-control-user" id="email" placeholder="이메일을 입력하세요"
								 autocomplete="off" required="required" name="member_email" >
								</div>
                                <a href="/resources/login.html" class="btn btn-primary btn-user btn-block">
                                    Register Account
                                </a>
                                <hr>
                                <a href="/resources/index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="/resources/index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="/resources/forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="/resources/login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

</body>

</html>