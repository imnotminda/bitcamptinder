$(document).ready(function() {
    $('#deleteBtn').click(function() {
        const username = $('#user_username').val(); // 사용자 이름 가져오기
        const pwd = $('#user_pwd').val(); // 비밀번호 가져오기

        // 비밀번호가 입력되었는지 확인
        if (!pwd) {
            $('#pwdDiv').text('비밀번호를 입력하세요.').css('color', 'red');
            return;
        }

        // 비밀번호 확인 요청
        $.ajax({
    url: '/BitcampTinder/user/checkDeleteInfo',
    type: 'GET',
    data: {
        user_username: username, // 사용자 이름
        user_pwd: pwd // 비밀번호
    },
    success: function(response) {
        if (response === "비밀번호가 일치합니다.") {
            // 비밀번호가 일치하면 삭제 요청
            deleteAccount(username);
        } else {
            $('#pwdDiv').text(response).css('color', 'red'); // 비밀번호 불일치 메시지
        }
    },
    error: function(xhr) {
        console.log(xhr.status + ' ' + xhr.statusText); // 오류 로그 확인
        $('#pwdDiv').text('비밀번호가 틀렸습니다: ' + xhr.statusText).css('color', 'red');
    }
});
    });

 function deleteAccount(userUsername) {
    $.ajax({
        url: '/BitcampTinder/user/delete',
        type: 'POST',
        dataType: 'json',  // 서버 응답이 JSON일 경우
        data: {
            user_username: userUsername // 사용자 이름
        },
        success: function(response) {
            alert("회원탈퇴가 안됨 젭알.");  // 다시 수정-오류시 알럿
            window.location.href = "/BitcampTinder";
        },
        error: function(xhr, status, error) {
            console.error("Error:", error);
            alert("회원탈퇴 되었습니다");  // 성공시 알럿
              window.location.href = "/BitcampTinder";
        }
    });
}

});
