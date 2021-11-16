//화면 로딩 후 바로 실행
$(document).ready(function(){
	var recruitDetailModal = document.getElementById('recruitDetailModal');
	//모달 닫히면 페이지 리로드
	//가끔 모달 닫고 메뉴바가 눌러지지 않아서 강제로 리로드 시킴
	recruitDetailModal.addEventListener('hidden.bs.modal', function(event) {
		location.reload();
	})
});	
//함수 선언 영역
(function($){
	addMemberBlack = function(){
		var blackMemberId = $('#memberMenuButt').val();
		var blackComment = $('#blackComment').val();
		
		if(blackComment == ''){
			alert('사유를 입력해주세요.');
			
		}
		else{
			$.ajax({
	            url: '/member/checkMemberBlack', //요청경로
	            type: 'post',
	            async: false,
	            data:{'blackMemberId':blackMemberId}, //필요한 데이터
	            success: function(result) {
					//블랙하기 : true, 이미 블랙되어있음 : false
	               if(result){
	            	   $.ajax({
	                		url: '/member/addMemberBlack', //요청경로
	                		type: 'post',
	                		async: false,
	                		data:{'blackMemberId':blackMemberId,'blackComment':blackComment}, //필요한 데이터
	                		success: function(result) {
	                			if(result){
	                				$('#addMemberBlackModal').modal("hide");
	                				return;
	                			}
	                			else{
	                				alert('블랙리스트 추가에 실패하였습니다. \n관리자에게 문의부탁드립니다.');
	                			}
	                		},
	                		error: function(){
	                			//ajax 실행 실패 시 실행되는 구간
	                			alert('실패');
	                		}
	                	});
					}
					else{
						alert('이미 등록된 아이디입니다.');
					}
	            },
	            error: function(){
	             //ajax 실행 실패 시 실행되는 구간
	               alert('실패');
	            }
	      });
		}
	}
})(jQuery);