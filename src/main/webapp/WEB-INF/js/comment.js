$(document).ready(function() {
        // 댓글 작성 버튼 클릭 시
        $('#submitComment').click(function() {
            var userId = 1; // 마이페이지 유저 ID
            var commenterId = 2; // 댓글 작성자 ID
            var content = $('#commentContent').val();
            
            if (content.trim() === '') {
                alert('댓글 내용을 입력하세요');
                return;
            }

            $.ajax({
                url: '/BitcampTinder/comment/add', // 댓글 작성 요청
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    userId: userId,
                    commenterId: commenterId,
                    content: content
                }),
                success: function(response) {
                    alert('댓글이 성공적으로 등록되었습니다.');
                    $('#commentContent').val(''); // 입력란 비우기
                    loadComments(); // 댓글 리스트 다시 로드
                },
                error: function(error) {
                    console.log('댓글 작성 실패:', error);
                }
            });
        });

        // 댓글 리스트 로드 함수
        function loadComments() {
            var userId = 1; // 현재 마이페이지 유저 ID

            $.ajax({
                url: '/BitcampTinder/comment/list?userId=' + userId,
                type: 'GET',
                success: function(data) {
                    var commentsHtml = '';
                    $.each(data, function(index, comment) {
                        commentsHtml += `<div><strong>${comment.commenterName}</strong>: ${comment.content}</div>`;
                    });
                    $('#commentsList').html(commentsHtml);
                },
                error: function(error) {
                    console.log('댓글 목록 로드 실패:', error);
                }
            });
        }

        // 페이지 로드 시 댓글 리스트 로드
        loadComments();
    });