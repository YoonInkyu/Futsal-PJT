//화면 로딩 후 바로 실행
$(document).ready(function(){
   //$(function() {
   
   //checkTeamName 버튼을 클릭했을 때 
    $(document).on('click', '#addTeambutt', function() { 
            //userTeamName 를 param.
       var memberCode =  $("#memberCodeInput").val(); 
       var teamCode =  $("#teamCodeInput").val(); 
       var MyTeamCode =  $("#myTeamCodeInput").val(); 
       
       if(MyTeamCode != null && MyTeamCode != ''){
    	   alert('이미 팀이 있습니다.');
       }
       else{
    	   alert('가입신청이 되었습니다.');
          location.href='insertTeamApply?teamCode='+teamCode+'&memberCode='+memberCode;
       }
           
   });
});

//함수 선언 영역
(function($){
   
   
})(jQuery);