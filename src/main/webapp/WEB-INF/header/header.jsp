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
               <input type="button" value="매칭" id="autoMatchBtn" />
               <input type="hidden" value="${sessionScope.memId}" id="memId"/>
                <ul>
                    <%
                        // 세션에서 로그인 여부 확인
                        Integer memId = (Integer) session.getAttribute("memId");
                   		String memName = (String) session.getAttribute("memName");
                    	out.println("세션에 저장된 memId: " + memId);
                    	out.println("세션에 저장된 memName: " + memName);
                        if (memId == null) { // 로그인이 되어 있지 않으면
                    %>
                        <li><a href="${pageContext.request.contextPath}/user/loginForm">로그인</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/writeForm">회원가입</a></li>
                    <%
                        } else { // 로그인이 되어 있으면
                    %>

                        <li><a href="${pageContext.request.contextPath}/user/feedForm">${memId }님</a></li>              
                        <li><a href="${pageContext.request.contextPath}/user/updateForm">회원정보 수정</a></li>
						<li><a href="${pageContext.request.contextPath}/user/myPage?user_id=${sessionScope.memId}">마이페이지</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/logout" id="logoutBtn">로그아웃</a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </nav>
    </header>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autoMatch.js"></script>
<script type="text/javascript">
$(function() {
    $('#logoutBtn').click(function(){
        if (confirm("정말 로그아웃 하시겠습니까?")) {
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/user/logout',
                success: function() {
                    alert('성공적으로 로그아웃 되었습니다.');
                    location.href = '${pageContext.request.contextPath}';
                },
                error: function(e){
                    console.log(e);
                }
            });
        }
    });
});
</script>
</body>
</html>