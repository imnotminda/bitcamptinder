<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BitcampTinder: 로그인</title>
<style>
#btnwrap {
	display: flex;
	justify-content: center; /* 가로 가운데 정렬 */
	gap: 20px; /* 버튼 간 간격 */
	margin-top: 20px;
}

/* 버튼 스타일 */
button {
	width: 120px;
	height: 40px;
	background-color: #b81c40; /* 버튼 배경 색상 */
	border: none;
	border-radius: 5px; /* 둥근 모서리 */
	color: white; /* 버튼 텍스트 색상 */
	font-size: 16px; /* 버튼 텍스트 크기 */
	cursor: pointer; /* 마우스를 올렸을 때 커서 변경 */
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 버튼 그림자 */
	transition: background-color 0.3s ease; /* 배경색 전환 효과 */
}

#Formwrap {
	width: 300px;
	margin: 50px auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	background-color: #f9f9f9;
}

div {
	margin-bottom: 15px;
}

div label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input[type="text"], input[type="password"], input[type="mbti"], input[type="reli"],
	input[type="submit"], input[type="reset"] input[type="mbti"] {
	width: calc(100% - 20px); /* 패딩을 고려한 너비 조절 */
	padding: 8px 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="text"]:hover, input[type="mbti"]:hover, input[type="reli"]:hover,
	input[type="password"]:hover, input[type="submit"]:hover, input[type="reset"]:hover
	{
	border-color: #888;
}

input[type="text"]:focus, input[type="mbti"]:focus, input[type="reli"]:focus,
	input[type="password"]:focus {
	border-color: #5a9;
	outline: none;
	box-shadow: 0 0 5px rgba(90, 153, 90, 0.5);
}

/* id, name, pwdWrap 항목 컨테이너 스타일 */
#idwrap, #namewrap, #pwdwrap, #btnwrap, #resetwrap, #categorywrap,
	#sportwrap, #foodwrap, #hobbywrap, #artwrap, #musicwrap, #smokingwrap,
	#mbtiwrap, #reliwrap, #genderwrap, #agewrap {
	font-family: Arial, sans-serif;
	font-size: 14px;
	color: #333;
}

#smokingwrap, #genderwrap {
	display: flex;
	align-items: center;
}

#smokingwrap, #genderwrap label {
	margin-right: 10px; /* 라벨과 라디오 버튼 간의 간격 조절 */
}

#buttonWrap {
	display: flex;
	justify-content: space-between; /* 버튼 간의 간격 조정 */
}

#telwrap {
	display: flex;
	flex-direction: column; /* 요소를 수직으로 나열 */
	gap: 3px; /* 각 칸 사이의 간격 */
}

#telInputs {
	display: flex;
	gap: 7px; /* 입력 필드 간의 간격 */
	align-items: center; /* 입력 필드의 세로 정렬 */
}

#telwrap label {
	font-size: 14px;
}

#telwrap select, #telwrap input {
	padding: 5px;
	font-size: 16px;
}
</style>
</head>
<body>
<div id="wrap">
		<div id="Formwrap">
			<a href="/BitcampTinder/"><img src="../image/apple.jpg"
				width="25" alt="Tinder" /></a> BitcampTinder 로그인
			<form id="LoginForm">
				<div id="inputwrap">
					<!-- ************* 프로필 이미지 일단 숨김 처리 *********-->
					<!-- <table border="1">
						<tr>
							<td colspan="2"><input type="file" name="img[]"
								multiple="multiple"></td>
						</tr>
						<tr>
						 <td colspan="2" align="center">
								<input type="submit" value="이미지 업로드" style="width: 100px; height: 30px;"> 
						 <input type="reset" value="취소"> 
							</td>
						</tr>
					</table> -->
					<!-- 성별 -->

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
			<button type="button" id="loginBtn" style="width: 100px; height: 30px;">로그인</button></div>
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