<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
</head>
<body>
<c:import url="/WEB-INF/header/header.jsp"></c:import>


<div class="introduction" id="section1">
    <img src="${pageContext.request.contextPath}/image/BA.jpg" alt="배너">
</div>

<div id="section2">
    <div class="gallery" id="gallery">

    </div>
</div>

<footer id="section3">
    <a>&copy; 2024 커플 매칭 웹 사이트. 모든 권리 보유.</a>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

// 스크롤 및 터치 이벤트 처리
const sections = ['section1', 'section2', 'section3'];
let currentSection = 0;
let isScrolling = false;

// wheel 이벤트 리스너 추가
window.addEventListener('wheel', function(event) {
    event.preventDefault();

    if (isScrolling) return;
    isScrolling = true;
    setTimeout(() => { isScrolling = false }, 1000);

    if (event.deltaY > 0 && currentSection < sections.length - 1) {
        currentSection++;
    } else if (event.deltaY < 0 && currentSection > 0) {
        currentSection--;
    }
    
    document.getElementById(sections[currentSection]).scrollIntoView({
        behavior: 'smooth'
    });
}, { passive: false });

// touchstart 이벤트 리스너 추가
window.addEventListener('touchstart', function(event) {
    const touch = event.touches[0];
    previousTouchY = touch.clientY; // 터치 시작 위치 저장
});

// touchmove 이벤트 리스너 추가
window.addEventListener('touchmove', function(event) {
    if (isScrolling) return;

    const touch = event.touches[0];
    const deltaY = previousTouchY - touch.clientY; // Y축 이동 거리 계산
    previousTouchY = touch.clientY; // 현재 위치 업데이트

    if (deltaY > 0 && currentSection < sections.length - 1) {
        currentSection++;
    } else if (deltaY < 0 && currentSection > 0) {
        currentSection--;
    }

    document.getElementById(sections[currentSection]).scrollIntoView({
        behavior: 'smooth'
    });
});

let previousTouchY = 0; // touchmove를 위해 추가된 변수

$(document).ready(function() {
	console.log("AJAX 요청 발송");
	$.ajax({
	    url: '/BitcampTinder/user/gallery',
	    type: 'GET',
	    dataType: 'json',
	    success: function(data) {
	    	console.log("AJAX 요청 성공", data);
	        var gallery = $('#gallery');
	        $.each(data, function(index, user) {
	            console.log("넌 뭐냐 ? " + user); // 각 user 객체 출력
	            console.log(user.user_id);
	            console.log("넌 뭐냐 픽 ? " + user.profile_pic); // 각 user 객체 출력	            
	            var profileImage = user.profile_pic ? user.profile_pic : 'http://localhost:8080/BitcampTinder/image/default.jpg';
	            console.log("사용할 이미지 경로:", profileImage); // 최종 이미지 경로 확인
	            var galleryItem = `
	                <div class="gallery-item">
	                    <a href="${pageContext.request.contextPath}/user/myPage?userId=${user.user_id}" target="_blank">
	                        <img src="http://localhost:8080/BitcampTinder/image/default.jpg" alt="${user.username}">
	                    </a>
	                </div>`;
	            gallery.append(galleryItem);
	        });
	           // AJAX 요청이 완료된 후 items를 초기화
            const items = document.querySelectorAll('.gallery-item');
            const itemCount = items.length;
            const itemsPerPage = 4; // 한 페이지에 보여줄 이미지 개수
            let currentIndex = 0; // 현재 인덱스

            function showNextItems() {
                currentIndex += itemsPerPage; // 인덱스 증가
                if (currentIndex >= itemCount) {
                    currentIndex = 0; // 인덱스가 마지막을 초과하면 처음으로 돌아감
                }
                const visibleItems = Array.from(items).slice(currentIndex, currentIndex + itemsPerPage);
                items.forEach(item => item.style.display = 'none'); // 모든 아이템 숨기기
                visibleItems.forEach(item => item.style.display = 'block'); // 현재 보이는 아이템만 표시
            }

            // 일정 시간 후에 슬라이드 변경
            setInterval(showNextItems, 3000); // 3초마다 변경

            // 처음 보일 때 초기 설정
            showNextItems();
        },
        error: function() {
            console.error("유저 데이터를 불러오는 중 오류 발생");
        }
    });
});
</script>
</body>
</html>