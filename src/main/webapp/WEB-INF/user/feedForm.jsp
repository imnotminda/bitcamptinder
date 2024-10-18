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
        Integer memId = (Integer) session.getAttribute("memId");
    %>

    <div>
        <input type="text" id="username" value="<%= memId %>" readonly>
    </div>
    
    <div>
		<label for="comment">댓글:</label>
        <input type="text" name="comment" id="comment">
    </div>

    <button id="submitComment">댓글 작성</button>
    
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // 댓글 작성 버튼 클릭 시
            $('#submitComment').click(function() {
                var memId = $('#username').val(); // 로그인 ID(memId)
                var comment = $('#comment').val(); // 작성한 댓글

                // Ajax로 데이터 전송
                $.ajax({
                    type: 'POST',
                    url: '/BitcampTinder/user/commentInput',  // 컨트롤러에서 처리할 URL
                    data: {
                        userId: memId,  // 세션에서 가져온 memId 값
                        commentContent: comment  // 작성한 댓글
                    },
                    success: function(response) {
                        alert('댓글이 성공적으로 작성되었습니다.');
                    },
                    error: function(error) {
                        alert('댓글 작성 중 오류가 발생했습니다.');
                    }
                });
            });
        });
    </script>
</body>
</html>