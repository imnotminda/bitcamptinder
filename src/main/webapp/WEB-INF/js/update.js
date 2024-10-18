$(function() {
    $('#updateBtn').click(function() {
        $('#pwdDiv').empty();

        // 비밀번호 체크
        if ($('#user_pwd').val() === '') {
            $('#pwdDiv').html('비밀번호 입력'); // 비밀번호 체크
        } else {
            $.ajax({
                type: 'POST', // Changed to uppercase for consistency
                url: '/BitcampTinder/user/update',
                data: $('#updateForm').serialize(), // Corrected syntax to serialize data
                success: function() {
                    alert('회원정보 수정 완료');
                    location.href = '/BitcampTinder'; // Redirect to the home page after successful update
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 오류 발생:", status, error); // 오류 상태와 메시지 출력
                    console.log("서버 응답:", xhr.responseText); // 서버 응답 내용 출력
                }
            });
        }
    });
});
