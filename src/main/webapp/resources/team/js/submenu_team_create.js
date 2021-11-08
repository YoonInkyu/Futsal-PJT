//화면 로딩 후 바로 실행
$(document).ready(function(){
	//$(function() {
	
	//checkTeamName 버튼을 클릭했을 때 
	 $(document).on('click', '#checkTeamName', function() { 
		      //userTeamName 를 param.
		      var userTeamName =  $("#inputTeamName").val(); 
		      
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
		                  
		                  str = '<button style="width: 10rem;" class="btn btn-outline-primary" id="createTeam" type="submit">등 록</button>'
		                	  
		                  $('#buttonDiv').prepend(str)
		              	 }
		                  
		   
		              	 
//		              	 영준씨 확인 하고 정리 부탁드립니다.

//							<div class="d-flex justify-content-around" id="buttonDiv">
//								<button style="width: 10rem;" class="btn btn-outline-primary" id="createTeam" type="submit" disabled>등 록</button>
//								<button style="width: 10rem;" class="btn btn-danger" type="button">취 소</button>
//							</div>

		              	 
		              	 
		              	 
		              	 
		              	 
		              	 
		              	 
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


