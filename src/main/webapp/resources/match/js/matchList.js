//화면 로딩 후 바로 실행
$(document).ready(function(){
	var matchDetailModal = document.getElementById('matchDetailModal');
	//모달 닫히면 페이지 리로드
	//가끔 모달 닫고 메뉴바가 눌러지지 않아서 강제로 리로드 시킴
	matchDetailModal.addEventListener('hidden.bs.modal', function(event) {
	location.reload();
	})
	});
	$(document).ready(function() {
	var recruitDetailModal = document.getElementById('teamDetailModal');
	//모달 닫히면 페이지 리로드
	//가끔 모달 닫고 메뉴바가 눌러지지 않아서 강제로 리로드 시킴
	recruitDetailModal.addEventListener('hidden.bs.modal', function(event) {
	location.reload();
	})
});
