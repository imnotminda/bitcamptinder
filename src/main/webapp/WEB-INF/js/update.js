$(function() {
    $('#updateBtn').click(function() {
        $('#pwdDiv').empty();

        // 비밀번호 체크
        if ($('#user_pwd').val() == '') {
            $('#pwdDiv').html('비밀번호 입력'); // 비밀번호 체크
        } else {
            $.ajax({
                type: 'post',
                url: '/BitcampTinder/user/update',
                data: {
                    user_username: $('#user_username').val(), // 사용자 이름 추가
                    user_pwd: $('#user_pwd').val(), // 비밀번호만 전송
                    user_mbti: $('#user_mbti').val(), // MBTI
                    user_religion: $('#user_religion').val(), // 종교
                    user_tel1: $('#user_tel1').val(), // 전화번호 1
                    user_tel2: $('#user_tel2').val(), // 전화번호 2
                    user_tel3: $('#user_tel3').val(), // 전화번호 3
                    user_email1: $('#user_email1').val(), // 이메일 앞부분
                    user_email2: $('#user_email2').val(), // 이메일 도메인
                    user_email3: $('#user_email3').val() // 이메일 선택
                },
                success: function() {
                    alert('회원정보 수정 완료');
                    location.href = '/BitcampTinder';
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 오류 발생:", status, error); // 오류 상태와 메시지 출력
                    console.log("서버 응답:", xhr.responseText); // 서버 응답 내용 출력
                }
            });
        }
    });
});
