<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BitcampTinder: 회원탈퇴</title>
<style>
#Formwrap {
    width: 300px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color: #f9f9f9;
}

#delete-header {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
    text-align: center;
}

input[type="text"], input[type="password"] {
    width: calc(100% - 20px);
    padding: 8px 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-bottom: 15px;
}

/* input[type="text"]:hover, input[type="mbti"]:hover, input[type="reli"]:hover,
	input[type="password"]:hover, input[type="submit"]:hover, input[type="reset"]:hover
	{
	border-color: #b81c40;
}

input[type="text"]:focus, input[type="mbti"]:focus, input[type="reli"]:focus,
	input[type="password"]:focus {
	border-color: #b81c40; /* #5a9; */
	outline: none;
	box-shadow: 0 0 5px rgba(184, 28, 64, 0.5);
} 
*/


input[type="text"]:hover, input[type="password"]:hover {
    border-color: #b81c40;
}

input[type="text"]:focus, input[type="password"]:focus {
    border-color: #b81c40;
    outline: none;
  	box-shadow: 0 0 5px rgba(184, 28, 64, 0.5);
}

button {
    width: 100px;
    height: 40px;
    background-color: #b81c40;
    border: none;
    border-radius: 5px;
    color: white;
    font-size: 16px;
    cursor: pointer;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #a01536; /* 버튼 호버 시 색상 변화 */
}

#menuBtn {
    margin-top: 20px;
    width: 100px;
    height: 40px;
}
</style>
</head>
<body>
<div id="wrap">
    <div id="Formwrap">
        <a href="/BitcampTinder/"><img src="../image/tlogo.png" width="50" alt="Tinder" /></a>BitcampTinder 회원탈퇴
        <div id="delete-header"><!-- BitcampTinder 회원탈퇴 --></div>
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
