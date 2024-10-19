$(document).ready(function() {
        $('#commentInput').click(function() {
        	var pageuser_id = $('#pageuser_id').val(); // 마이페이지 유저의 id
            var comment_id = $('#comment_id').val(); // 댓글 작성자 ID
            var comment_name = $('#comment_name').val();
            var content = $('#commentContent').val();
            
            if (content.trim() === '') {
                alert('댓글 내용을 입력하세요');
                return;
            }

            $.ajax({
                url: '/BitcampTinder/user/commentContent',
                type: 'POST',
                data: {
                    pageuser_id: pageuser_id,
                    content: content,
                    commenter_name : comment_name,
                    commenter_id: comment_id
                },
                success: function(response) {
                    alert('댓글이 성공적으로 등록되었습니다.');
                    $('#commentContent').val('');
                    loadComments();
                },
                error: function(error) {
                    console.log('댓글 작성 실패:', error);
                }
            });
        });
        
        function formatDate(dateString) {
            if (!dateString) return "날짜 없음"; // 유효하지 않은 경우 기본 메시지 반환
            
            var date = new Date(dateString);
            if (isNaN(date.getTime())) return "유효하지 않은 날짜"; // 유효하지 않은 날짜 형식 체크

            var year = date.getFullYear();
            var month = String(date.getMonth() + 1).padStart(2, '0');
            var day = String(date.getDate()).padStart(2, '0');

            return year + '-' + month + '-' + day; // YYYY-MM-DD 형식으로 반환
        }
        
        function loadComments() {
            var pageuser_id = $('#pageuser_id').val();

            $.ajax({
                url: '/BitcampTinder/user/getComment',
                type: 'GET',
                data: { pageuser_id: pageuser_id },
                success: function(response) {
                    console.log(response); // 응답 확인
                    displayComments(response);
                },
                error: function(error) {
                    console.log('댓글 로딩 실패:', error);
                }
            });
        }

        function displayComments(comments) {
            var commentList = $('#commentList');
            commentList.empty(); // 기존 댓글 제거

            comments.forEach(function(comment) {
                var commentItem = `
                    <div class="comment">
                        <p><strong>` + comment.commenter_name + `</strong>: ` + comment.content + `</p>
                        <span>` + formatDate(comment.created_AT) + `</span>
                    </div>
                `;
                commentList.append(commentItem); // 댓글 추가
            });
        }

        loadComments(); // 페이지 로드 시 댓글 로드
    });