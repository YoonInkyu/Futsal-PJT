//화면 로딩 후 바로 실행
$(document).ready(function(){
   $(document).on('keyup', '#tell', function() { 
		//휴대번호 정규식
		var tellJ = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
	   
		if(tellJ.test($('#tell').val())){
		   $('#tellJDiv').text('');
		   $('#joinButt').removeClass('disabled');
	   }else{
		   $('#tellJDiv').text('휴대전화 번호를 확인하세요.');
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
   $(document).on('keyup', '#memberPw', function() { 
	   //비밀번호 정규식 -- 소대문자a~z,0~9로 4~12자리 만들기
	   var pwJ = /^[A-Za-z0-9]{4,12}$/;
	   if(pwJ.test($('#memberPw').val())){
		   $('#pwJDiv').text('');
		   $('#joinButt').removeClass('disabled');
	   }else{
		   $('#pwJDiv').text('숫자 및 영문 4~12자리 입력');
		   $('#changePwButt').addClass('disabled');
	   }
   });
   $(document).on('keyup', '#memberPwCheck, #memberPw', function() { 
	   	//비밀번호 확인
		var p1 = $('#memberPw').val();
		var p2 = $('#memberPwCheck').val();
		if(p1 == p2){
			$('#pwCheckDiv').text('');
			$('#changePwButt').removeClass('disabled');
		}else{
			$('#pwCheckDiv').text('비밀번호를 확인하시오.');
			$('#changePwButt').addClass('disabled');
		}
   });
   //모달창 닫으면
   var changePwModal = document.getElementById('changePwModal');
   //var loginModal = $('#loginModal');위에거가 이거랑 같은거임
   changePwModal.addEventListener('hidden.bs.modal', function (event) {
        // do something...
      $('#oldMemberPw').text('');
      $('#memberPw').text('');
      $('#memberPwCheck').text('');
      $('.modal input[type="password"]').val('');
   })
});
//함수 선언 영역
(function($){
	 $(document).on('click', '#changePwButt', function() {
		 var oldMemberPw = $('#oldMemberPw').val();
		 var memberCode = $('#memberCode').val();
		 var memberPw = $('#memberPw').val();
		$.ajax({
            url: '/member/checkPw', //요청경로
            type: 'post',
            async: false,
            data:{'memberPw':oldMemberPw,'memberCode':memberCode}, //필요한 데이터
            success: function(result) {
            	if(oldMemberPw == memberPw){
            		alert('현재비밀번호와 새비밀번호가 일치합니다.');
            	      $('#memberPw').val('');
            	      $('#memberPwCheck').val('');
            	}
            	else{
            		if(result){
                		$.ajax({
                		url: '/member/changePw', //요청경로
                		type: 'post',
                		async: false,
                		data:{'memberPw':memberPw,'memberCode':memberCode}, //필요한 데이터
                		success: function(result) {
                			//기존 변경 : true, 변경못함 : false
                			if(result){
                				alert('비밀번호가 변경되었습니다.');
                				$('#changePwModal').modal("hide");
                				return;
                			}
                		},
                		error: function(){
                			//ajax 실행 실패 시 실행되는 구간
                			alert('실패');
                		}
                	});
                	}
                	else{
                		alert('현재 비밀번호가 틀립니다.')
                	}
            	}
            	//현재비번과 일치 : true, 불일치 : false
            	
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      });
		
	 });
	
})(jQuery);