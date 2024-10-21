<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/delete.css">
<title>BitcampTinder: 회원탈퇴</title>
</head>
<body>
<c:import url="/WEB-INF/header/header.jsp"></c:import>
<div id="wrap"style="background-image: url(&quot;https://tinder.com/static/build/3011237ba52b39fe50311f7917878ace.webp&quot;);">
    <div id="Formwrap">
        <div id="delete-header">회원탈퇴</div>
        <form name="DeleteForm" id="DeleteForm">
         <label for="user_username">아이디</label>
            <input type="text" id="user_username" value="${userDTO.user_username }" readonly />
            <div>
                <label for="user_pwd">비밀번호</label>
                <input type="password" name="user_pwd" id="user_pwd" placeholder="비밀번호를 입력하세요" />
                <div id="pwdDiv"></div>
            </div>
            <div style="text-align: center;">
                <button type="button" id="deleteBtn">회원탈퇴</button>
        <button type="button" id="menuBtn" onclick="location.href='/BitcampTinder'">메인</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
<script type="text/javascript" src="../js/delete.js"></script>
</body>
</html>
