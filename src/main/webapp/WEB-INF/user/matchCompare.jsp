<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,900&display=swap"
	rel="stylesheet">
<title>BitcampTinder - 비교페이지</title>
<style>

/* Profile container */
#profile-container {
	display: flex;
	justify-content: space-around;
	/* Ensure space between the two profiles */
	gap: 20px; /* Add some gap between the two profiles */
	margin-top: 20px;
}

.profile-widget {
	width: 45%;
	/* Set width of each profile widget to take half the space */
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 4px;
	text-align: center;
	color: #848484;
}

.cover-img {
	max-height: 200px;
	overflow: hidden;
	width: 100%;
}

.user-details {
	padding: 0px 20px 30px;
}

.profile-widget h3 {
	color: #630016; /* 빨간색 #b81c40; */
	margin: 10px 0px 20px;
}

.profile-widget img {
	width: 100%;
	max-width: 100%;
	height: auto;
	display: block;
}

.user-img {
	width: 100px;
	height: 100px;
	border-radius: 100%;
	overflow: hidden;
	box-shadow: 0px 0px 4px 0px #b81c40;
	border: 4px solid #fff;
	margin: 0 auto;
	margin-top: -60px;
	position: relative;
	z-index: 999;
}

.followers {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	justify-content: space-between;
}

.followers h3 {
	width: 45%;
	padding: 6px 0px;
	border: 1px dashed #838383;
	border-radius: 144px;
	font-size: 18px;
	text-align: center;
	box-sizing: border-box;
}

.followers h3 span {
	font-weight: normal;
	font-size: 16px;
}

button.follow-btn {
	font-size: 16px; /* Decrease the font size */
	background: #b81c40;
	border: none;
	color: #fff;
	padding: 10px 20px; /* Adjust the padding for a thinner appearance */
	margin: 20px auto; /* Center the button */
	width: 60%; /* Reduce the button width */
	cursor: pointer;
	display: block; /* Ensure it's centered */
}

button.follow-btn:hover {
	opacity: 0.8;
}

button.messageBtn {
	font-size: 16px; /* Decrease the font size */
	background: #b81c40;
	border: none;
	color: #fff;
	padding: 10px 20px; /* Adjust the padding for a thinner appearance */
	margin: 20px auto; /* Center the button */
	width: 20%; /* Reduce the button width */
	cursor: pointer;
	display: block; /* Ensure it's centered */
}

button.messageBtn:hover {
	opacity: 0.8;
}

h2 {
    text-align: center; /* Center the heading */
    margin-top: 20px; /* Add some space from the top */
    font-size: 24px; /* Adjust the font size */
    color: #630016; /* Optional color for visibility */
}

h2.widget-heading {
	font-size: 25px;
	font-weight: normal;
	margin: 20px 0px 10px;
	padding: 0px 0px 10px;
}

@media ( max-width : 767px) {
	.profile-widget {
		width: 90%;
	}
}
</style>
</head>
<body>

	<div class="innerOuter">
		<input type="hidden" id="memId" value="${sessionscope.memId }" /> <a
			href="/BitcampTinder/"> <img src="../image/tlogo.png" width="50"
			alt="Tinder" />
		</a>
		
		<!-- Centered heading -->
		<h2>${currentUser.user_name}님과 ${clickedUser.user_name}님의 매칭 결과입니다.</h2>
		<form action="${pageContext.request.contextPath}/user/messageForm" method="get">
		<input type="hidden" name="sender_id" value="${currentUser.user_id}">
    	<input type="hidden" name="receiver_id" value="${clickedUser.user_id}">	
		<button type="submit" class="messageBtn">매칭 신청하기</button>
		</form>
		<br>

		<!-- Parent container for both profiles -->
		<div id="profile-container">

			<!--  First user profile (currentUser) -->
			<div class="profile-widget">
				<div class="cover-img">
					<h2 class="widget-heading"></h2>
					<label for="chooseFileBg"> </label>
				</div>
				<div class="user-details">
					<div class="user-img">
						<img src="${currentUser.profile_pic }" />
					</div>
					<div id="fileName"></div>
					<h3>${currentUser.user_name}</h3>
					<h3>${currentUser.user_username}</h3>
					<div class="followers">
						<h3>
							아이디<br> <span>${currentUser.user_username}</span>
						</h3>
						<h3>
							나이<br> <span>${currentUser.user_age}</span>
						</h3>
						<h3>
							mbti<br> <span>${currentUser.user_mbti}</span>
						</h3>
						<h3>
							영화<br> <span>${currentUser.user_movie}</span>
						</h3>
						<h3>
							종교<br> <span>${currentUser.user_religion}</span>
						</h3>
						<h3>
							여행<br> <span>${currentUser.user_travel}</span>
						</h3>
						<h3>
							음악<br> <span>${currentUser.user_music}</span>
						</h3>
						<h3>
							취미<br> <span>${currentUser.user_hobby}</span>
						</h3>
						<h3>
							문화생활<br> <span>${currentUser.user_art}</span>
						</h3>
						<h3>
							음식<br> <span>${currentUser.user_food}</span>
						</h3>
						<h3>
							흡연<br> <span>${currentUser.user_smoke}</span>
						</h3>
						<h3>
							성별<br> <span>${currentUser.user_gender}</span>
						</h3>
					</div>
				</div>
			</div>

			<!--  Second user profile (clickedUser) -->
			<div class="profile-widget">
				<div class="cover-img">
					<h2 class="widget-heading"></h2>
					<label for="chooseFileBg"> </label>
				</div>
				<div class="user-details">
					<div class="user-img">
						<img src="${clickedUser.profile_pic }" />
					</div>
					<div id="fileName"></div>
					<h3>${clickedUser.user_name}</h3>
					<h3>${clickedUser.user_username}</h3>
					<div class="followers">
						<h3>
							아이디<br> <span>${clickedUser.user_username}</span>
						</h3>
						<h3>
							나이<br> <span>${clickedUser.user_age}</span>
						</h3>
						<h3>
							mbti<br> <span>${clickedUser.user_mbti}</span>
						</h3>
						<h3>
							영화<br> <span>${clickedUser.user_movie}</span>
						</h3>
						<h3>
							종교<br> <span>${clickedUser.user_religion}</span>
						</h3>
						<h3>
							여행<br> <span>${clickedUser.user_travel}</span>
						</h3>
						<h3>
							음악<br> <span>${clickedUser.user_music}</span>
						</h3>
						<h3>
							취미<br> <span>${clickedUser.user_hobby}</span>
						</h3>
						<h3>
							문화생활<br> <span>${clickedUser.user_art}</span>
						</h3>
						<h3>
							음식<br> <span>${clickedUser.user_food}</span>
						</h3>
						<h3>
							흡연<br> <span>${clickedUser.user_smoke}</span>
						</h3>
						<h3>
							성별<br> <span>${clickedUser.user_gender}</span>
						</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<button class="follow-btn"
			onclick="location.href='${pageContext.request.contextPath}/user/autoMatchResult'">매칭으로 돌아가기</button>
	</div>
</body>
</html>
