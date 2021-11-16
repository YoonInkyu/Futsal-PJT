//화면 로딩 후 바로 실행
$(document).ready(function(){
	$(document).on('click', '#change', function() {
		var mercBoardCode = $(this).next().val()

		$.ajax({
			url : '/mercenary/recruitDetailAjax', //요청경로
			type : 'post',
			data : {'mercBoardCode' : mercBoardCode}, //필요한 데이터
			success : function(result) {
				//ajax 실행 성공 시 실행되는 구간
				//지역 수정 ajax
				$('.selectLocation').remove()
				var str = '';
				str += '<select class="form-select" name="mercBoardLocation" id="selectLocation">'
				if (result.mercBoardLocation == '서울') {
					str += '<option value="서울" selected>서울</option>';
					str += '<option value="인천">인천</option>';
					str += '<option value="대전">대전</option>';
					str += '<option value="대구">대구</option>';
					str += '<option value="부산">부산</option>';
					str += '<option value="광주">광주</option>';
					str += '<option value="울산">울산</option>';
				} else if (result.mercBoardLocation == '인천') {
					str += '<option value="서울">서울</option>';
					str += '<option value="인천" selected>인천</option>';
					str += '<option value="대전">대전</option>';
					str += '<option value="대구">대구</option>';
					str += '<option value="부산">부산</option>';
					str += '<option value="광주">광주</option>';
					str += '<option value="울산">울산</option>';
				} else if (result.mercBoardLocation == '대전') {
					str += '<option value="서울">서울</option>';
					str += '<option value="인천">인천</option>';
					str += '<option value="대전" selected>대전</option>';
					str += '<option value="대구">대구</option>';
					str += '<option value="부산">부산</option>';
					str += '<option value="광주">광주</option>';
					str += '<option value="울산">울산</option>';
				} else if (result.mercBoardLocation == '대구') {
					str += '<option value="서울">서울</option>';
					str += '<option value="인천">인천</option>';
					str += '<option value="대전">대전</option>';
					str += '<option value="대구" selected>대구</option>';
					str += '<option value="부산">부산</option>';
					str += '<option value="광주">광주</option>';
					str += '<option value="울산">울산</option>';
				} else if (result.mercBoardLocation == '부산') {
					str += '<option value="서울">서울</option>';
					str += '<option value="인천">인천</option>';
					str += '<option value="대전">대전</option>';
					str += '<option value="대구">대구</option>';
					str += '<option value="부산" selected>부산</option>';
					str += '<option value="광주">광주</option>';
					str += '<option value="울산">울산</option>';
				} else if (result.mercBoardLocation == '광주') {
					str += '<option value="서울">서울</option>';
					str += '<option value="인천">인천</option>';
					str += '<option value="대전">대전</option>';
					str += '<option value="대구">대구</option>';
					str += '<option value="부산">부산</option>';
					str += '<option value="광주" selected>광주</option>';
					str += '<option value="울산">울산</option>';
				} else if (result.mercBoardLocation == '울산') {
					str += '<option value="서울">서울</option>';
					str += '<option value="인천">인천</option>';
					str += '<option value="대전">대전</option>';
					str += '<option value="대구">대구</option>';
					str += '<option value="부산">부산</option>';
					str += '<option value="광주">광주</option>';
					str += '<option value="울산" selected>울산</option>';
				}
				str += '</select>';
				$('.selectLocationDiv').append(str);

				//경기일정 수정 ajax
				$('.mercBoardDate').remove()
				var str1 = '';
				str1 += '<input type="date" name="mercBoardDate" class="form-control" value="' + result.mercBoardDate + '">';
				str1 += '<input type="time" name="mercBoardStartTime" class="form-control" value="' + result.mercBoardStartTime + '" style="margin-top: 10px;">';
				str1 += '<input type="time" name="mercBoardEndTime" class="form-control" value="' + result.mercBoardEndTime + '" style="margin-top: 10px;">';
				$('.inputDateDiv').append(str1);

				//경기소개 수정 ajax
				$('.mercBoardIntro').remove()
				var str2 = '';
				str2 += '<textarea name="mercBoardIntro" id="mercBoardIntro" class="form-control" style="height: 10rem;">' + result.mercBoardIntro + '</textarea>';
				$('.inputIntroDiv').append(str2);

				//버튼 수정 ajax
				$('.change').val('수정')
				$('.formChange').attr('action', '/mercenary/detailUpdate?mercBoardCode=' + result.mercBoardCode)
				$('.change').attr('type', 'submit')
			},
			error : function() {
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
	});
});	