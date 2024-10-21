<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BitcampTinder: 로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
<c:import url="/WEB-INF/header/header.jsp"></c:import>
<div id="login-container" style="background-image: url(&quot;https://tinder.com/static/build/3011237ba52b39fe50311f7917878ace.webp&quot;);">	
	<div id="login-wrap">
        <div id="login-form-wrap">
			<div id="login-title">
         		<span>BitcampTinder</span>
    		</div>
            <form id="LoginForm">
                <div id="login-input-wrap">
                    <!--  4.아이디 -->
                    <div id="login-idwrap">
                        <div>아이디 :</div>
                        <input type="text" id="username" name="user_username" />
                        <div id="idDiv"></div>
                    </div>
                    <!--  5.비밀번호 -->
                    <div id="login-pwdwrap">
                        <div>비밀번호 :</div>
                        <input type="password" id="pwd" name="user_pwd" />
                        <div id="pwdDiv"></div>
                    </div>

                    <div id="login-btnwrap">
                        <button type="button" id="loginBtn">로그인</button>
                    </div>
                    
                    <button type="button" class="signup-btn" onclick="location.href='http://localhost:8080/BitcampTinder/user/writeForm'">회원가입</button>
                    <div id="loginResult"></div>
                </div>
            </form>
        </div>
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