//화면 로딩 후 바로 실행
$(document).ready(function(){
	//수정 ajax
	$(document).on('click', '#change', function() {
		var matchCode = $(this).prev().prev().val()

		$.ajax({
			url : '/match/matchDetailAjax', //요청경로
			type : 'post',
			data : {
				'matchCode' : matchCode
			}, //필요한 데이터
			success : function(result) {
				//ajax 실행 성공 시 실행되는 구간
				$('.selectLocation').remove()
				var str = '';
				str += '<select class="form-select" name="matchLocation">'
				if (result.matchLocation == '서울') {
					str += '<option value="서울" selected>서울</option>';
					str += '<option value="인천">인천</option>';
					str += '<option value="대전">대전</option>';
					str += '<option value="대구">대구</option>';
					str += '<option value="부산">부산</option>';
					str += '<option value="광주">광주</option>';
					str += '<option value="울산">울산</option>';
				} else if (result.matchLocation == '인천') {
					str += '<option value="서울">서울</option>';
					str += '<option value="인천" selected>인천</option>';
					str += '<option value="대전">대전</option>';
					str += '<option value="대구">대구</option>';
					str += '<option value="부산">부산</option>';
					str += '<option value="광주">광주</option>';
					str += '<option value="울산">울산</option>';
				} else if (result.matchLocation == '대전') {
					str += '<option value="서울">서울</option>';
					str += '<option value="인천">인천</option>';
					str += '<option value="대전" selected>대전</option>';
					str += '<option value="대구">대구</option>';
					str += '<option value="부산">부산</option>';
					str += '<option value="광주">광주</option>';
					str += '<option value="울산">울산</option>';
				} else if (result.matchLocation == '대구') {
					str += '<option value="서울">서울</option>';
					str += '<option value="인천">인천</option>';
					str += '<option value="대전">대전</option>';
					str += '<option value="대구" selected>대구</option>';
					str += '<option value="부산">부산</option>';
					str += '<option value="광주">광주</option>';
					str += '<option value="울산">울산</option>';
				} else if (result.matchLocation == '부산') {
					str += '<option value="서울">서울</option>';
					str += '<option value="인천">인천</option>';
					str += '<option value="대전">대전</option>';
					str += '<option value="대구">대구</option>';
					str += '<option value="부산" selected>부산</option>';
					str += '<option value="광주">광주</option>';
					str += '<option value="울산">울산</option>';
				} else if (result.matchLocation == '광주') {
					str += '<option value="서울">서울</option>';
					str += '<option value="인천">인천</option>';
					str += '<option value="대전">대전</option>';
					str += '<option value="대구">대구</option>';
					str += '<option value="부산">부산</option>';
					str += '<option value="광주" selected>광주</option>';
					str += '<option value="울산">울산</option>';
				} else if (result.matchLocation == '울산') {
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

				$('.matchDate').remove()
				var str1 = '';
				str1 += '<input type="date" name="matchDate" class="form-control" value="' + result.matchDate + '">';
				str1 += '<input type="time" name="matchStartTime" class="form-control" value="' + result.matchStartTime + '" style="margin-top: 10px;">';
				str1 += '<input type="time" name="matchEndTime" class="form-control" value="' + result.matchEndTime + '" style="margin-top: 10px;">';
				$('.inputDateDiv').append(str1);

				$('.matchIntro').remove()
				var str2 = '';
				str2 += '<textarea rows="10px" name="matchIntro" class="form-control" >' + result.matchIntro + '</textarea>';
				$('.inputIntroDiv').append(str2);

				$('.change').val('수정')
				$('.formChange').attr('action', '/match/matchDetailUpdate?matchCode=' + result.matchCode)
				$('.change').attr('type', 'submit')
			},
			error : function() {
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
	});

	//결과 등록 ajax
	$(document).on('click', '#matchResult', function() {
		var matchCode = $(this).prev().val()

		$.ajax({
			url : '/match/matchDetailAjax', //요청경로
			type : 'post',
			data : {
				'matchCode' : matchCode
			}, //필요한 데이터
			success : function(result) {
				//ajax 실행 성공 시 실행되는 구간
				var str = '';
				str += '<span class="input-group-text">결과 입력(홈 : 어웨이)</span>';
				str += '<input type="number" name="matchResultHometeamScore" aria-label="First name" class="form-control" min="0" value="0">';
				str += '<input type="number" name="matchResultAwayteamScore" aria-label="Last name" class="form-control" min="0" value="0">';
				$('.inputScore').append(str);

				$('.formChange').attr('action', '/match/insertResult?matchCode=' + result.matchCode + '&teamCode=' + result.teamCode + '&teamCodeAway=' + result.teamCodeAway)
				$('.matchResult').val('결과 등록')
				$('.matchResult').attr('type', 'submit')

			},
			error : function() {
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
	});

	//매치 수락
	$(document).on('click', '#matchResponse', function() {
		var matchCode = $(this).next().val()
		var matchManageCode = $(this).next().next().val()
		var matchDateAll = $(this).next().next().next().val()
		var teamCodeAway = $(this).next().next().next().next().val()
		var applyMemberTell = $(this).next().next().next().next().next().val()
		var applyTeamName = $(this).next().next().next().next().next().next().val()
		var writerMemberTell = $(this).next().next().next().next().next().next().next().val()
		var writerTeamName = $(this).next().next().next().next().next().next().next().next().val()
		var str = '?matchCode=' + matchCode + '&matchManageCode=' + matchManageCode + '&matchDateAll=' + matchDateAll + '&teamCodeAway=' + teamCodeAway + '&applyMemberTell=' + applyMemberTell + '&applyTeamName=' + applyTeamName + '&writerMemberTell=' + writerMemberTell + '&writerTeamName=' + writerTeamName
		//alert(str)

		location.href = '/match/updateResponse' + str;
	});
});
