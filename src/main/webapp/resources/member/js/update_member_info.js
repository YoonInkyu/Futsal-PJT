//화면 로딩 후 바로 실행
$(document).ready(function(){
	//ID input 태그 클릭시 빨간 글자 지우기
   $(document).on('change', '#memberId', function() { 
		$('#comment').remove();
   });
});
//함수 선언 영역
(function($){
	
	//ID 중복 체크
	checkId = function(){
		var memberId = $('#memberId').val();
		if(memberId == ''){
			var aaa = $('#checkIdDiv').next().attr('id');
			if(aaa != 'aaa'){
			$('#checkIdDiv').after('<div id = "aaa" style="color: red; font-size: 12px; margin-top: 2px;">아이디를 입력하세요.</div>');
			}
			return ;
		}
		
		$.ajax({
            url: '/member/checkId', //요청경로
            type: 'post',
            data:{'memberId':memberId}, //필요한 데이터
            success: function(result) {
				//기존 가입 : true, 미가입 : false
				var comment = $('#checkIdDiv').next().attr('id');
               if(result){
					if(comment != 'comment'){
						$('#checkIdDiv').after('<div Id = "comment" style="color: red; font-size: 12px; margin-top: 2px;">중복된 아이디입니다.</div>');
					}
					
				}
				else{
					if(comment != 'comment'){
						$('#checkIdDiv').after('<div id = "comment" style="color: green; font-size: 12px; margin-top: 2px;">사용가능한 아이디입니다.</div>');
						$('#joinButt').removeClass('disabled');
					}
					
					
				}
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      });
		
	}
})(jQuery);