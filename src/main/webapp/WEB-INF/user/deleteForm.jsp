<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<div id="wrap">
    <div id="Formwrap">
        <a href="/BitcampTinder/"><img src="../image/tlogo.png"
                width="50" alt="Tinder" /></a> 
        <div id="container">
            <div id="delete-header">회원탈퇴</div>
            <form name="DeleteForm" id="DeleteForm">
                <input type="text" id="user_username" value="${userDTO.user_username }" />
                <table>
                    <tbody>
                    <tr>
                        <th class="label">비밀번호</th>
                        <td class="input">
                           <input type="password" name="user_pwd" id="user_pwd" placeholder="비밀번호를 입력하세요" />
                           <div id="pwdDiv"></div>
                        </td>
                    </tr>
                    </tbody>
                    <tr align="center">
                        <td colspan="2" height="20">
                            <button type="button" id="deleteBtn">회원탈퇴</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <button type="button" id="menuBtn" onclick="location.href='/BitcampTinder'">메인</button>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
<script type="text/javascript" src="../js/delete.js"></script>
</body>
</html>