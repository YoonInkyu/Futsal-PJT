//화면 로딩 후 바로 실행
$(document).ready(function(){
	$(document).on('change', '.mercBoardEndTime', function() {
		var mercBoardStartTime = $('.mercBoardStartTime').val();
		var mercBoardEndTime = $('.mercBoardEndTime').val();

		if (mercBoardEndTime < mercBoardStartTime) {
			alert('매치 끝나는 시간이 매치 시작보다 빠릅니다.')
			$('.mercBoardEndTime').val('');
		} else {
		}
	});

	$(document).on('click', '#mercReg', function() {
		var inputIntro = $('#inputIntro').val()

		if (inputIntro == '') {
			alert('자기 소개를 먼저 입력 해주세요.')
		} else {
			alert('용병 등록이 완료되었습니다.')
		}
	});
});	