<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,900&display=swap" rel="stylesheet">
<title>BiteTinder My페이지 - 프로필</title>
</head>
<body>
    <c:import url="/WEB-INF/header/header.jsp"></c:import>
    <div class="innerOuter">
        <input type="hidden" id="memId" value="${sessionscope.memId}" />
        <h2>BitcampTinder 마이페이지</h2>
        <br>
        <br>
        
        <!--  --><div style="display: flex; justify-content: space-around; width: 100%;">
            <!-- 메뉴 리스트 -->
            <ul class="menu" style="padding-left: 0px; width: 230px;">
				<br>
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
				    <li>
				        <a>마이페이지</a>
				        <ul style="width: 210px;">
				            <li><a href="${pageContext.request.contextPath}/user/updateForm">- 회원 정보수정</a></li>
				            <li><a href="${pageContext.request.contextPath}/user/deleteForm">- 회원 탈퇴</a></li>
				            <li><a href="${pageContext.request.contextPath}/user/userInbox">- 메세지함</a></li>
				        </ul>
				    </li>
				</c:if>
			</ul>
            
            <!-- 프로필 및 매칭 항목 -->
            <div class="profile-container">
                <!-- 프로필 이미지 -->
                <div class="profile-widget">
                    <h2 class="widget-heading">프로필</h2>
                    <div class="cover-img">
                        <label for="chooseFileBg"></label>
                    </div>
                    <div class="user-details">
                        <div class="user-img">
                            <img src="${userDTO.profile_pic}" />
                        </div>
                        <h3>${sessionScope.loginMember.memberName}</h3>
                        <h3>${userDTO.user_username}</h3>
                        <p>${userDTO.user_name}님의 매칭 항목</p>
                    </div>
                </div>
                <!-- 매칭 항목 -->
                <div class="matching-items">
                    <div class="item-circle">아이디 : <br><span>${userDTO.user_username}</span></div>
                    <div class="item-circle">나이 : <br><span>${userDTO.user_age}</span></div>
                    <div class="item-circle">MBTI : <br><span>${userDTO.user_mbti}</span></div>
                    <div class="item-circle">영화 : <br><span>${userDTO.user_movie}</span></div>
                    <div class="item-circle">종교 : <br><span>${userDTO.user_religion}</span></div>
                    <div class="item-circle">여행 : <br><span>${userDTO.user_travel}</span></div>
                    <div class="item-circle">음악 : <br><span>${userDTO.user_food}</span></div>
                    <div class="item-circle">취미 : <br><span>${userDTO.user_hobby}</span></div>
                    <div class="item-circle">문화생활 : <br><span>${userDTO.user_art}</span></div>
                    <div class="item-circle">음식 : <br><span>${userDTO.user_food}</span></div>
                    <div class="item-circle">흡연 : <br><span>${userDTO.user_smoke}</span></div>
                    <div class="item-circle">성별 : <br><span>${userDTO.user_gender}</span></div>
                </div>
            </div>
        </div>
        <button class="follow-btn" onclick="location.href='/BitcampTinder'">매칭 점수 보러 메인가기</button>
    </div>

		<!--  장훈님 댓글 영역 -->
   <% 
        // 세션에서 memId 가져오기
        Integer comment_memId = (Integer) session.getAttribute("memId");
    	String comment_memName = (String) session.getAttribute("memName");
    %>

    <div>
    	<input type="hidden" id="pageuser_id" value="${userDTO.user_id}" readonly>
        <input type="hidden" id="comment_id" value="<%= comment_memId %>" readonly>
        <input type="hidden" id="comment_name" value="<%= comment_memName %>" readonly>
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
<script type="text/javascript">
function submitMessageForm(senderId, receiverId) {
    document.getElementById('senderId').value = senderId;
    document.getElementById('receiverId').value = receiverId;
    document.getElementById('messageForm').submit();
}
</script>
</body>
</html>
