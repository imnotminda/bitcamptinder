<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring: 회원 정보 수정</title>
<link rel="stylesheet" href="../css/user.css">
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

div {
    margin-bottom: 15px;
}

div label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

input[type="text"], input[type="password"], input[type="submit"], input[type="reset"] {
    width: calc(100% - 20px);
    padding: 8px 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="text"]:hover, input[type="password"]:hover, input[type="submit"]:hover, input[type="reset"]:hover {
    border-color: #888;
}

input[type="text"]:focus, input[type="password"]:focus {
    border-color: #5a9;
    outline: none;
    box-shadow: 0 0 5px rgba(90, 153, 90, 0.5);
}

#idwrap, #namewrap, #pwdwrap, #btnwrap, #resetwrap {
    font-family: Arial, sans-serif;
    font-size: 14px;
    color: #333;
}
</style>
</head>
<body>
<div id="wrap">
    <div id="Formwrap">
        <a href="/Spring/"><img src="../image/3.png" width="30" alt="푸바오" /></a> 회원 정보 수정
        <form id="updateForm">
        <input type="hidden" id="pg" value="${pg }" />
            <div id="inputwrap">
                <div id="namewrap">
                    <div>이름 : </div>
                    <!-- 기존 값 자동 입력 -->
                    <input type="text" id="name" name="name" value="${userDTO.name}" />
                    <div id="nameDiv"></div>
                </div>
                <div id="idwrap">
                    <div>아이디 : </div>
                    <!-- 아이디는 수정 불가 -->
                    <input type="text" id="id" name="id" value="${userDTO.id}" readonly />
                    <div id="idDiv"></div>
                </div>
                <div id="pwdwrap">
                    <div>비밀번호 : </div>
                    <!-- 비밀번호 수정 가능 -->
                    <input type="password" id="pwd" name="pwd" value="${userDTO.pwd}" />
                    <div id="pwdDiv"></div>
                </div>
                <div id="btnwrap">
                    <button type="button" onclick="location.href='/Spring/user/list?pg=${pg}'">목록</button>
                
                    <button type="button" id="updateBtn">회원정보정보수정</button>
                    <button type="button" id="deleteBtn">회원탈퇴</button>
                    <input type="hidden" id="userId" value= "${userDTO.id}" />
                </div>
                <div id="resetwrap">
                    <button type="reset" id="resetBtn">초기화</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/update.js"></script>
</body>
</html>
