<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>메세지 보내기</title>
</head>
<body>

    <h2>${clickedUser.user_name}에게 메세지 보내기</h2>

    <!-- Message Form -->
    <form action="${pageContext.request.contextPath}/user/sendMessage" method="post">
        <input type="hidden" name="sender_id" value="${currentUser.user_id}">
        <input type="hidden" name="receiver_id" value="${clickedUser.user_id}">

        <!-- Message input field -->
        <textarea name="message_text" rows="5" placeholder="메세지 입력..." style="resize:none; width: 500px; height: 200px; margin-bottom: 10px;"></textarea>
		
		<div>
        <!-- Send button -->
        <button type="submit">보내기</button>
        <button type="reset">다시 쓰기</button>
        </div>
    </form>

    <a href="${pageContext.request.contextPath}/user/userInbox">메세지함으로 돌아가기</a> <!-- Link to inbox if needed -->

</body>
</html>