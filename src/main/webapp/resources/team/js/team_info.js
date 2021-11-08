//화면 로딩 후 바로 실행
$(document).ready(function(){
	//$(function() {
	
	//checkTeamName 버튼을 클릭했을 때 
	 $(document).on('click', '#myTeamDelete', function() { 
		      //userTeamName 를 param.
		      var myTeamDelete = confirm('탈퇴 하시겠습니가?');
		      
		      if(myTeamDelete == true){
		    	  alert('팀탈퇴가 완료 되었습니다.')
		    	  
		    	  location.href ='/team/myTeamDelete'
		    	  
		      }
		      else{
		    	  location.href ='/team/teamInfo'
		    	  
		      }
		      
		  });
		//});
});

//함수 선언 영역
(function($){
	
	
})(jQuery);


