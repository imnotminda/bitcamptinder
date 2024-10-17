$(function() {
	$('#autoMatchBtn').click(function(){
		$.ajax({
			type: 'get',
			url: '/BitcampTinder/user/autoMatch',
			success: function(response){
				confirm('매칭이 완료되었습니다! 결과를 보시겠습니까?');
				location.href = '/BitcampTinder/user/autoMatchResult';
			},
			error: function(e){
				console.log(e);
			}
		});
	});

});