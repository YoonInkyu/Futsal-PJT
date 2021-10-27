//화면 로딩 후 바로 실행
$(document).ready(function(){
	//ID input 태그 클릭시 빨간 글자 지우기
   $(document).on('change', '#memberId', function() { 
		$('#comment').remove();
		$('#joinButt').addClass('disabled');
   });
   $(document).on('keyup', '#memberPw', function() { 
	   //비밀번호 정규식 -- 소대문자a~z,0~9로 4~12자리 만들기
	   var pwJ = /^[A-Za-z0-9]{4,12}$/;
	   if(pwJ.test($('#memberPw').val())){
		   $('#pwJDiv').text('');
		   $('#joinButt').removeClass('disabled');
	   }else{
		   $('#pwJDiv').text('숫자 및 영문 4~12자리 입력');
		   $('#joinButt').addClass('disabled');
	   }
   });
   $(document).on('keyup', '#memberPwCheck, #memberPw', function() { 
	   	//비밀번호 확인
		var p1 = $('#memberPw').val();
		var p2 = $('#memberPwCheck').val();
		if(p1 == p2){
			$('#pwCheckDiv').text('');
			$('#joinButt').removeClass('disabled');
		}else{
			$('#pwCheckDiv').text('비밀번호를 확인하시오.');
			$('#joinButt').addClass('disabled');
		}
   });
   $(document).on('keyup', '#memberName', function() {
	   //이름 정규식 -- 한글로 이뤄진 문자 2~6자리 만들기
	   var nameJ = /^[가-힣]{2,6}$/;
	   if(nameJ.test($('#memberName').val())){
		   $('#nameJDiv').text('');
		   $('#joinButt').removeClass('disabled');
	   }else{
		   $('#nameJDiv').text('한글 2~6자리 입력');
		   $('#joinButt').addClass('disabled');
	   }
   });
   $(document).on('keyup', '#memberBirth', function() { 
	   //생년월일 정규식 -- 숫자 6자리
	   var birthJ = /^([0-9]{2})?([0||1]{1})?([0-9]{1})?([0||1||2||3]{1})?([0-9]{1})$/;
	   if(birthJ.test($('#memberBirth').val())){
		   $('#birthJDiv').text('');
		   $('#joinButt').removeClass('disabled');
	   }else{
		   $('#birthJDiv').text('생년월일을 확인해주세요.');
		   $('#joinButt').addClass('disabled');
	   }
   });
   $(document).on('keyup', '.tells', function() { 
		//휴대번호 정규식
		var tell1J = /^01[0||1||6||7||8||9]{1}$/;
		var tell2J = /^[0-9]{3,4}$/;
		var tell3J = /^[0-9]{4}$/;
	   
		if(tell1J.test($('#tell1').val()) && tell2J.test($('#tell2').val()) && tell3J.test($('#tell3').val())){
		   $('#tellJDiv').text('');
		   $('#joinButt').removeClass('disabled');
	   }else{
		   $('#tellJDiv').text('휴대전화 번호를 확인하세요.');
		   $('#joinButt').addClass('disabled');
	   }
   });
});

//함수 선언 영역
(function($){
	//ID 중복 체크
	checkId = function(){
		var memberId = $('#memberId').val();
		if(memberId == ''){
			var comment = $('#checkIdDiv').next().attr('id');
			if(comment != 'comment'){
			$('#checkIdDiv').after('<div class="mt-2 mb-5" id = "comment" style="color: red; font-size: 12px; margin-top: 2px;">아이디를 입력하세요.</div>');
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
				//아이디 정규식 소문자a~z,0~9로 4~12자리 만들기
				var idJ = /^[a-z0-9]{4,12}$/;
               if(result){
					if(comment != 'comment'){
						$('#idButtCheck').remove();
						$('#checkIdDiv').after('<div class="mt-2 mb-5" Id = "comment" style="color: red; font-size: 12px; margin-top: 2px;">중복된 아이디입니다.</div>');
					}
					
				}
				else{
					if(comment != 'comment'){
						if(idJ.test($('#memberId').val())){
							$('#idButtCheck').remove();
							$('#checkIdDiv').after('<div class="mt-2 mb-5" id = "comment" style="color: green; font-size: 12px; margin-top: 2px;">사용가능한 아이디입니다.</div>');
							$('#joinButt').removeClass('disabled');
						}else{
							$('#idButtCheck').remove();
							$('#checkIdDiv').after('<div class="mt-2 mb-5" Id = "comment" style="color: red; font-size: 12px; margin-top: 2px;">소문자영문 및 숫자 4~12자리 입력!</div>');
						}
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