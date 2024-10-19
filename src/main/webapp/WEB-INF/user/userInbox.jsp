<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>Inbox</title>
</head>
<body>

    <h2>나의 메시지함</h2>

    <c:if test="${not empty messages}">
        <ul>
            <c:forEach var="message" items="${messages}">
                <li>
                    <strong>이름:</strong> ${message.sender_name} <br>
                    <strong>내용:</strong> ${message.message_text} <br>
                    <strong>시간:</strong><fmt:formatDate value="${message.timestamp}" pattern="MM월 dd일 hh:mm a" timeZone="Asia/Seoul"/><br>
                    <strong>상태:</strong>
                   	<c:choose>
					    <c:when test="${message.status == 'unread'}">
					        읽지 않음
					    </c:when>
					    <c:otherwise>
					        ${message.status} 읽음
					    </c:otherwise>
					</c:choose>
                </li>
                <hr>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${empty messages}">
        <p>No messages found.</p>
    </c:if>

</body>
</html>
