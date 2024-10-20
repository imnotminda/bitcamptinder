<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inbox</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="../css/userInbox.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="header">
    <c:import url="/WEB-INF/header/header.jsp"></c:import>
</div>

<div class="pageContent">
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebarHeader">
                메세지함
            </div>
             <ul class="chatList">
		        <c:forEach var="uniqueSender" items="${uniqueSenders}">
		            <!-- Skip if the uniqueSender is the current user (currentUserId) -->
		            <c:if test="${uniqueSender.sender_id != currentUserId}">
		                <li class="chatItem">
		                    <a href="?senderId=${uniqueSender.sender_id}" style="text-decoration: none;"> <!-- Link to select sender -->
		                        <img src="${not empty uniqueSender.sender_profile_pic ? uniqueSender.sender_profile_pic : '../image/tlogo.png'}" alt="User profile" class="profile-pic">
		                        <strong>${uniqueSender.sender_name}</strong><br>
		                    </a>
		                </li>
		            </c:if>
		        </c:forEach>
		    </ul>
        </div>

        <!-- Chat Area -->
        <div class="chatArea">
            <div class="chatHeader">
                  <c:choose>
			        <c:when test="${not empty selectedSenderId}">
			            <!-- Fetch clicked sender's data -->
			            <c:forEach var="sender" items="${uniqueSenders}">
			                <c:if test="${sender.sender_id == selectedSenderId}">
			                    <img src="${not empty sender.sender_profile_pic ? sender.sender_profile_pic : '../image/tlogo.png'}" alt="User profile">
			                    <div>
			                        <strong>${sender.sender_name}</strong><br>
			                    </div>
			                </c:if>
			            </c:forEach>
			        </c:when>
			        <c:otherwise>
			            <div>
			                <strong>채팅</strong><br>
			            </div>
			        </c:otherwise>
			    </c:choose>
		    </div>
            <div class="chatMessages">
			    <c:forEach var="message" items="${messages}">
			        <!-- Compare sender_id and currentUserId as strings to ensure consistent comparison -->
			         <div class="message ${message.sender_id.toString() eq currentUserId.toString() ? 'sent' : 'received'}">
       					 ${message.message_text}
					    <span class="messageTime">
					        <fmt:formatDate value="${message.timestamp}" pattern="hh:mm a" timeZone="Asia/Seoul" />
					    </span>
					</div>
			    </c:forEach>
			</div>
            <div class="messageInput">
                <form id="messageForm" action="${pageContext.request.contextPath}/user/sendMessage" method="post"> <!-- Add your action URL -->
			        <textarea id="messageText" name="message_text" placeholder="메세지를 입력하세요" style="resize: none;"></textarea>
			        <input type="hidden" name="sender_id" value="${currentUserId}">
			        <input type="hidden" name="receiver_id" value="${selectedSenderId}">
			        <button id="sendButton" type="submit">보내기</button>
			    </form>
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById("messageForm").onsubmit = function() {
        var senderId = document.querySelector("input[name='sender_id']").value;
        var receiverId = document.querySelector("input[name='receiver_id']").value;
        var messageText = document.getElementById("messageText").value;

        console.log("Sender ID:", senderId);
        console.log("Receiver ID:", receiverId);
        console.log("Message Text:", messageText);

        // Check if senderId or receiverId is empty
        if (!senderId || !receiverId || !messageText) {
            alert("Please ensure all fields are filled in.");
            return false; // Prevent form submission
        }
    }
</script>
</body>
</html>
