//화면 로딩 후 바로 실행
$(document).ready(function(){

});

//함수 선언 영역
(function($){
	//ID 중복 체크
	checkLogin = function(){
		var memberId = $('#memberId').val();
		var memberPw = $('#memberPw').val();

		$.ajax({
            url: '/member/checkLogin', //요청경로
            type: 'post',
            data:{'memberId':memberId, 'memberPw':memberPw}, //필요한 데이터
            success: function(result) {
            	if(result){
            		$('#loginForm').submit();
            	}
            	else{
            		alert('아이디와 비밀번호가 일치하지 않습니다.');
            		$('#memberId').val('');
            		$('#memberPw').val('');
            		$('#memberId').focus();
            	}
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            },
      });
		
	}
})(jQuery);