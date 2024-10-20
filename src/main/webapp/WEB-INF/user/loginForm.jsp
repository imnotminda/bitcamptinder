<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BitcampTinder: 로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div id="title">
        <a href="/BitcampTinder/"><img src="../image/tlogo.png" width="50" alt="Tinder" /></a> BitcampTinder 로그인
    </div>
    <div id="wrap" style="border : 1px solid red;">
        <div id="Formwrap" style="border : 1px solid;">
            <form id="LoginForm">
                <div id="inputwrap">
                    <!--  4.아이디 -->
                    <div id="idwrap">
                        <div>아이디 :</div>
                        <input type="text" id="username" name="user_username" />
                        <div id="idDiv"></div>
                    </div>
                    <!--  5.비밀번호 -->
                    <div id="pwdwrap">
                        <div>비밀번호 :</div>
                        <input type="password" id="pwd" name="user_pwd" />
                        <div id="pwdDiv"></div>
                    </div>

                    <div id="btnwrap">
                        <button type="button" id="loginBtn" style="width: 100px; height: 30px;">로그인</button>
                        <button type="button" style="width: 100px; height: 30px;" onclick="location.href='http://localhost:8080/BitcampTinder/user/writeForm'">회원가입</button>
                    </div>
                    <div id="loginResult"></div>
                </div>
            </form>
        </div>
    </div>
<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">

$(function() {
		$('#loginBtn').click(function() {
			$('#idDiv').empty();
			$('#pwdDiv').empty();

			// 유효성 검사
			if ($('#username').val() == '') {
				$('#idDiv').html('아이디 입력');
			} else if ($('#pwd').val() == '') {
				$('#pwdDiv').html('비밀번호 입력');
			} else {
				$.ajax({
					type: 'POST',
					url: '/BitcampTinder/user/login',  // 스프링 컨트롤러의 URL로 변경
					data: {
						user_username: $('#username').val(),
						user_pwd: $('#pwd').val()
					},
					dataType : 'text',
					success: function(data) {
		            	if (data.trim() === 'fail') { 
							$('#loginResult').html('아이디 또는 비밀번호가 틀립니다.');
							$('#loginResult').css('font-size', '10px');
							$('#loginResult').css('padding', '10px');
						} else {
							alert('로그인 성공'); // 수정된 부분
							location.href = '/BitcampTinder';
						}
					},
					error: function(e) {
						console.log(e);
					}
				});
			}
		});
	});
</script>
</body>
</html>