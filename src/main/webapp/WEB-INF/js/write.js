$(function() {
    //아이디 중복체크
$('#username').focusout(function() {
    $('#idDiv').empty();
    
     if ($('#username').val() == '')
        $('#idDiv').html('먼저 아이디 입력');
   	else 
        $.ajax({
            type: 'post',
            url: '/BitcampTinder/user/getExistId',
           data: 'username='+$('#username').val(), 
    dataType: 'text',
    success: function(data){
			//alert(data);
			
	if(data == 'exist'){
	$('#idDiv').html('사용불가능');
	$('#idDiv').css('color','red');
	}else{
	$('#idDiv').html('사용가능');
	$('#idDiv').css('color','blue');
	}
	},
    error: function(e){
    console.log(e);
    }
    });

    
});

//등록

$('#writeBtn').click(function(){
 	$('#nameDiv').empty();
 	$('#idDiv').empty();
 	$('#pwdDiv').empty();
 	
 	if($('#name').val()=='')
 		$('#nameDiv').html('이름 입력');
 			else if($('#username').val()=='')
 		$('#idDiv').html('아이디 입력');
 			else if($('#pwd').val()=='')
 		$('#pwdDiv').html('비밀번호 입력');
		else
			$.ajax({
		    type:'post',
	        url: '/BitcampTinder/user/write',
	        data: $('#writeForm').serialize(), 
	        dataType: 'text',
	        success: function(){
					alert('회원가입완료');
					location.href = '/BitcampTinder'
			},
        error: function(e){
        console.log(e);
        }
		
		
});

});



});















