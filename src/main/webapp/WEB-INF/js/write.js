$(function() {
    //아이디 중복체크
    $('#id').focusout(function() {
        $('#idDiv').empty();
        
        id = $('#id').val();
        
        if (id == '') {
            $('#idDiv').html("<span style='color: red;'>먼저 아이디 입력</span>");
        } else {
            $.ajax({
                type: 'post',
                url: '/spring/user/getExistId',
                data: { 'id': id },
                dataType: 'text',
                success: function(data) {
                    if (data == 'exist') {
                        $('#idDiv').html('사용 불가능');
                        $('#idDiv').css('color', 'red');
                    }
                    else {
                        $('#idDiv').html('사용 가능');
                        $('#idDiv').css('color', 'blue');
                    }
                },
                error: function(e) {
                    console.log(e);
                }
            });
        }
    });
    
    //등록
    $('#writeBtn').click(function(){
    
    	$('#nameDiv').empty();
    	$('#idDiv').empty();
    	$('#pwdDiv').empty();
    	
    	if($('#name').val() == '')
    		$('#nameDiv').html('이름 입력');
    	else if($('#id').val() == '')
    		$('#idDiv').html('아이디 입력');
    	else if($('#pwd').val() == '')
    		$('#pwdDiv').html('비밀번호 입력');
    	else
    		$.ajax({
    			type: 'post',
                url: '/springproject/user/write',
                data: $('#userWriteForm').serialize(),
                success: function() {
                    alert('회원가입 완료');
                    location.href = '/springproject/user/list';
                },
                error: function(e) {
                    console.log(e);
                }
    		});
    });
});




















