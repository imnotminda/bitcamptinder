$(function(){
	
	//수정
	$('#updateBtn').click(function(){
		$('#nameDiv').empty();
		$('#pwdDiv').empty();
		
		if($('#name').val() == '')
    		$('#nameDiv').html('이름 입력');
    	else if($('#pwd').val() == '')
    		$('#pwdDiv').html('비밀번호 입력');
    	else
    		$.ajax({
    			type: 'post',
                url: '/spring/user/update',
                data: $('#userUpdateForm').serialize(),
                success: function() {
                    alert('회원정보수정 완료');
                    location.href = '/spring/user/list?pg=' + $('#pg').val();
                },
                error: function(e) {
                    console.log(e);
                }
    		});
	});
});







