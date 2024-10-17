<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <% 
        // 세션에서 memId 가져오기
        String memId = (String) session.getAttribute("memId"); 
    %>

    <div>
        <label for="username">로그인 ID:</label>
        <input type="text" id="username" value="<%= memId != null ? memId : "" %>" readonly>
    </div>
</body>
</html>