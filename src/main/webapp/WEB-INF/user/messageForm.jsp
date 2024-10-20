<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메세지 보내기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="../css/matchForm.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="header">
        <c:import url="/WEB-INF/header/header.jsp"></c:import>
    </div>
	
	  <!-- Centered content -->
    <div class="message-container">
        <h2>${clickedUser.user_name}님에게 매칭 메세지를 보내세요!</h2>
        <br>

        <!-- Message Form -->
        <form action="${pageContext.request.contextPath}/user/sendMessage" method="post">
            <input type="hidden" name="sender_id" value="${currentUser.user_id}">
            <input type="hidden" name="receiver_id" value="${clickedUser.user_id}">

            <!-- Message input field -->
            <textarea name="message_text" placeholder="메세지 입력..."></textarea>

            <div>
                <!-- Send and Reset buttons -->
                <button class="button-82-pushable" type="submit">
				  <span class="button-82-shadow"></span>
				  <span class="button-82-edge"></span>
				  <span class="button-82-front text">
				    보내기
				  </span>
				</button>
				<button class="button2-82-pushable" type="reset">
				  <span class="button2-82-shadow"></span>
				  <span class="button2-82-edge"></span>
				  <span class="button2-82-front text">
				    다시쓰기
				  </span>
				</button>
            </div>
        </form>
    </div>
</body>
</html>