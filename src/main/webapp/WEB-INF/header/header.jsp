<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/header/header.css">
</head>
<body>
    <header>
        <nav>
            <div class="logo">
                <a href="/BitcampTinder">
                    <img src="${pageContext.request.contextPath}/image/tlogo.png" alt="홈 로고">
                </a>
            </div>
        
            <div class="right-menu">
                <ul>
                    <%
                        // 세션에서 로그인 여부 확인
                        String memId = (String) session.getAttribute("memId");
                        if (memId == null) { // 로그인이 되어 있지 않으면
                    %>
                        <li><a href="${pageContext.request.contextPath}/user/loginForm">로그인</a></li>
                    <%
                        } else { // 로그인이 되어 있으면
                    %>
                        <li><a href="${pageContext.request.contextPath}/user/feedForm">${memId }님</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </nav>
    </header>
</body>
</html>