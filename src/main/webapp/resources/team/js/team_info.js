//화면 로딩 후 바로 실행
$(document).ready(function(){
	//$(function() {
	
	//checkTeamName 버튼을 클릭했을 때 
	 $(document).on('click', '#myTeamDelete', function() { 
		      //userTeamName 를 param.
		      confirm('탈퇴 하시겠습니가?');
		      location.href ='/team/myTeamDelete'
		      
		      
		      $.ajax({
		          async: true,
		          type : 'post',
		          data : {'teamName':userTeamName},
		          url : "/team/checkTeamName",
		          success : function(data) {
		              if (data == false) {
		                  
		                  alert("팀이름이 존재합니다. 다른 팀이름을 입력해주세요.");
		                  $("#inputTeamName").val("")
		                  $("#inputTeamName").focus();
		                  
		                  
		              
		              } else {
		              	
		              	 if(userTeamName == ''){
		              		alert("팀이름을 입력해 주세요");
		              	}
		              	 else{
		              		 
		                  alert("사용가능한 팀이름입니다.");
		                  $('#createTeam').remove()
		                  str = '<button class="btn btn-primary col-2 mx-auto" id="createTeam" type="submit">팀 등록</button>'
		                  $('#buttonDiv').prepend(str)
		              	 }
		                  
		              }
		          },
		          error : function(error) {
		              
		              alert("error : " + error);
		          }
		      });
		  });
		//});
});

//함수 선언 영역
(function($){
	
	
})(jQuery);


