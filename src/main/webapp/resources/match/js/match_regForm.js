//화면 로딩 후 바로 실행
$(document).ready(function(){
	$(document).on('change', '.matchEndTime', function() {
		var matchStartTime = $('.matchStartTime').val();
		var matchEndTime = $('.matchEndTime').val();

		if (matchEndTime < matchStartTime) {
			alert('매치 끝나는 시간이 매치 시작보다 빠릅니다.')
			$('.matchEndTime').val('');
		} else {
		}
	});

	$(document).on('click', '#matchReg', function() {
		var inputIntro = $('#inputIntro').val()

		if (inputIntro == '') {
			alert('매치 소개를 먼저 입력 해주세요.')
		} else {
			alert('매치 등록이 완료되었습니다.')
		}
	});
});
