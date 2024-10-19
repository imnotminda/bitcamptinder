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
<title>BiteTinder My페이지 - 프로필</title>
<style>

/* id, name, pwdWrap 항목 컨테이너 스타일 */
#btnwrap {
	display: flex;
	justify-content: center; /* 가로 가운데 정렬 */
	gap: 20px; /* 버튼 간 간격 */
	margin-top: 20px;
}

#idwrap, #namewrap, #pwdwrap, #btnwrap, #resetwrap, #categorywrap,
	#sportwrap, #foodwrap, #hobbywrap, #artwrap, #musicwrap, #smokingwrap,
	#mbtiwrap, #reliwrap, #genderwrap, #agewrap, #moviewrap {
	font-family: Arial, sans-serif;
	font-size: 14px;
	color: #333;
}

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
.innerOuter {
	width: 80%;
	margin: auto;
	padding: 5% 10%;
	background-color: white;
}
/* .menu {
    list-style-type: none;
    margin-right: 10px;
    margin-left: 0px;
    padding-left: 0px;
    width: 15%;
    position: fixed; /* 메뉴를 고정된 위치에 두도록 설정 */
    top: 0; /* 상단에 고정 */
    left: 0; /* 좌측에 고정 */
    background-color: #fff; /* 배경색 추가 */
    padding-top: 20px; /* 상단 여백 추가 */
    height: 100vh; /* 메뉴의 높이를 전체 뷰포트 높이로 설정 */
} */
 
.menu {
	list-style-type: none;
	margin-right: 10px;
	margin-left: 0px;
	padding-left: 0px;
	width: 15%;
	height: 100%;
	overflow: auto;
} 

.menu li a {
	display: block;
	color: #000;
	padding: 8px 16px;
	text-decoration: none;
	  font-size: 20px;
}

 .menu li a.active {
	background-color: #b81c40; /*#5271FF;*/
	color: white;
}
 
.menu li a:hover:not(.active) {
	background-color:  #b81c40; /*#5271FF;*/
	color: white;
}

ul {
	list-style: none;
}

body {
	font-family: 'Roboto', sans-serif;
	background: #fbfbfb;
}

.profile-widget {
	width: 400px;
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
    color: #630016;  /* 빨간색 #b81c40; /* 기존 파란색 #6E9DDC; */
    margin: 10px 0px 20px ; /* 오른쪽 여백을 20px로 설정 */
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
	box-shadow: 0px 0px 4px 0px  #b81c40; /* #6E9DDC; 기존 파란색*/
	border: 4px solid #fff;
	margin: 0 auto;
	margin-top: -60px;
	position: relative;
	z-index: 999;
}
/* 부모 컨테이너의 너비를 설정 */
.profile-widget {
    max-width: 100%; /* 필요한 경우 max-width 값을 조정 */
    width: 500px; /* 필요에 맞게 너비를 늘림 */
    margin: 0 auto; /* 중앙 정렬 */
}

.followers {
    display: flex;
    flex-wrap: wrap; /* 항목들이 가로로 배치되며 줄바꿈 가능 */
    gap: 20px; /* 항목 사이에 간격 추가 */
    justify-content: space-between; /* 항목 간 여백을 자동으로 분배 */
}

.followers h3 {
    width: 45%; /* 한 줄에 두 개씩 배치되도록 너비 설정 */
    padding: 6px 0px;
    border: 1px dashed #838383;
    border-radius: 144px;
    font-size: 18px;
    text-align: center;
    box-sizing: border-box; /* 패딩과 너비가 겹치지 않도록 함 */
}

.followers h3:last-child {
	float: right;
}

.followers h3 span {
	font-weight: normal;
	font-size: 16px;
}

button.follow-btn {
	font-size: 19px;
	background: #b81c40; /* #6E9DDC; */
	border: none;
	color: #fff;
	padding: 10px 10px 40px;
	margin: 20px 0px 0px;
	width: 100%;
	cursor: pointer;
}

button.follow-btn:hover {
	opacity: 0.8;
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
			<input type="hidden" id="memId" value="${sessionscope.memId }" />
			<a href="/BitcampTinder/"><img src="../image/tlogo.png"
				width="50" alt="Tinder" /></a>
		 <h2>BitcampTinder 마이페이지</h2>
		<br>
		<hr>
		<br>
		<div style="display: flex;">

			<ul class="menu" style="padding-left: 0px; width: 230px;">
				<br>
				<li><a >마이페이지</a>
					<ul style="width: 210px;">
						<c:if test="${currentUserId != userDTO.user_id}">
							 <li>
						        <a href="#" onclick="submitMessageForm(${currentUser.user_id}, ${clickedUser.user_id}); return false;">- 매칭 신청하기</a>
						    </li>
						    <!-- Hidden Form -->
							<form id="messageForm" action="${pageContext.request.contextPath}/user/messageForm" method="get" style="display:none;">
							    <input type="hidden" name="sender_id" id="senderId">
							    <input type="hidden" name="receiver_id" id="receiverId">
							</form>										
						</c:if>
						<c:if test="${currentUserId == userDTO.user_id}">
							<li><a href="${pageContext.request.contextPath}/user/updateForm">- 회원 정보수정 </a></li>
							<li><a href="${pageContext.request.contextPath}/user/deleteForm">- 회원 탈퇴</a></li>
					        <li><a href="${pageContext.request.contextPath}/user/userInbox">- 메세지함</a></li>
				        </c:if>
				       
						 <!-- <button type="button" class="btn btn-danger" onclick="location.href='http://localhost:8080/BitcampTinder/user/loginForm'">로그인</button> -->
					</ul>
				</li>


			</ul>

			<!--  프로필 이미지  영역 -->
			<div class="profile-widget">
		<h2 class="widget-heading">프로필</h2>
				<div class="cover-img">
				<h2 class="widget-heading">
					</h2>
					<label for="chooseFileBg"> <%--   <img src="resources/image/background/<fmt:formatNumber value='${sessionScope.UserDTO.propicfic}' pattern='00000000' />.jpg" onerror="this.src='resources/image/company/signup-bg.jpg'" onclick="" id="uploadFilesBg"> --%>
					</label>
				</div>
				<div class="user-details">
					<div class="user-img">
				<img src="${userDTO.profile_pic }" />
						<form method="post" enctype="multipart/form-data">
							<label for="chooseFile">
								<div id="canvas">
									<c:choose>
										<c:when
											test="${sessionScope.loginMember.memberPhotoExtend eq jpg}">
											<!--수정       <img src="resources/image/company/signup-bg.jpg" id="uploadFiles"> -->
										</c:when>
										<c:otherwise>
											<img
												src="resources/image/profile/<fmt:formatNumber value='${userDTO.profile_pic}' pattern ='00000000' />.${sessionScope.loginMember.memberPhotoExtend}"
												alt="User photo2" id="uploadFiles">
										</c:otherwise>
									</c:choose>
								</div>
							</label> <input type="file" id="chooseFile" name="chooseFile"
								accept="image/*" onchange="loadFile(this);"
								style="visibility: hidden;"> <input type="file"
								id="chooseFileBg" name="chooseFileBg" accept="image/*"
								onchange="loadFileBg(this);" style="visibility: hidden;">
						</form>
					</div>
					<!--  매칭항목  영역 -->
					<div id="fileName"></div>
					<h3>${sessionScope.loginMember.memberName}</h3>
					<h3>${userDTO.user_username}</h3>
					<p>${userDTO.user_name}님의 매칭 항목</p>
					<div class="followers">
						<h3>
							아이디<br> <span>${userDTO.user_username}</span>
						</h3>
						<h3>
							나이<br> <span>${userDTO.user_age}</span>
						</h3>
						<h3>
							mbti<br> <span>${userDTO.user_mbti}</span>
						</h3>
						<h3>
							영화<br> <span>${userDTO.user_movie}</span>
						</h3>
						<h3>
							종교<br> <span>${userDTO.user_religion}</span>
						</h3>
						<h3>
							여행<br> <span>${userDTO.user_travel}</span>
						</h3>
						<h3>
							음악<br> <span>${userDTO.user_food}</span>
						</h3>
						<h3>
							취미<br> <span>${userDTO.user_hobby}</span>
						</h3>
						<h3>
						문화생활<br> <span>${userDTO.user_art}</span>
						</h3>
						<h3>
						음식<br> <span>${userDTO.user_food}</span>
						</h3>
						<h3>
						흡연<br> <span>${userDTO.user_smoke}</span>
						</h3>
						<h3>
						성별<br> <span>${userDTO.user_gender}</span>
						</h3>
					</div>
					<!--   <button class="follow-btn" onclick="location.href='myPage.me'">수정하기</button> <br> -->
					<button class="follow-btn" onclick="location.href='/BitcampTinder'">매칭점수보러 메인가기</button>
				</div>
				<!-- Image by <a href="https://www.freepik.com/free-photo/empty-room-with-chairs-desks_15501155.htm#query=office&position=4&from_view=search&track=sph&uuid=bc5b64e6-870d-4c59-a1d8-d8ba1d700a20">Freepik</a> -->
				<%--  <c:choose>
		                <c:when test="${sessionScope.loginMember.memberPhotoExtend}">
		                    <a href="https://www.freepik.com/free-vector/illustration-uploading-icon_2609994.htm#page=3&query=upload%20file&position=34&from_view=search&track=ais&uuid=9266a4ed-f875-4e8e-a066-016287752433">Image by rawpixel.com</a> on Freepik
		                </c:when>	
		                
		                
		            </c:choose>
		            
		            				        
 --%>

			</div>

		</div>
		<!--  장훈님 댓글 영역 -->
   <% 
        // 세션에서 memId 가져오기
        Integer comment_memId = (Integer) session.getAttribute("memId");
    	String comment_memName = (String) session.getAttribute("memName");
    %>

    <div>
    	<input type="text" id="pageuser_id" value="${userDTO.user_id}" readonly>
        <input type="text" id="comment_id" value="<%= comment_memId %>" readonly>
        <input type="text" id="comment_name" value="<%= comment_memName %>" readonly>
    </div>
    
	<div id="commentSection">
	    <div id="commentList"> <!-- 댓글 리스트를 표시할 div 추가 -->
	        <!-- 댓글이 여기에 추가됩니다. -->
	    </div>
	    
	    <textarea id="commentContent" placeholder="댓글을 입력하세요"></textarea>
	    <button id="commentInput">댓글 작성</button>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/comment.js"></script>
<script type="text/javascript"></script>
</body>
</html>

