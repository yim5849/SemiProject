	/* 로그인 입력시, 아이디/ 비밀번호 공란 입력시 안내문구 출력 */
      	const loginDo= ()=>{
      		if(document.getElementsByName("memberId")[0].value==""
      		||document.getElementsByName("memberPwd")[0].value==""){
      			alert("내용을 입력해주세요!");
      			return false;
      		}else{
				if($("#viewSaveId").prop("checked")){
					$("#saveId").val("true");				
				}
      			document.loginSubmit.submit();
      		}
      		
      	}
  

   		/* 메뉴바 선택 시, active값 자동변경 */
      	$(function () { 
	    	// actvie 활성화 
		    $(".nav-item > .active").css("color", "white"); 
		    
		    $('.nav-link').click(function () { 
		    	
		    // .nav-link 클릭시 이전의 active 값 해제
		    $(".nav-item > .active").css("color", "#007bff");  
		    $('.nav-link').removeClass('active'); 
		    
		    // 클릭한 위치 active 적용 
		    $(this).addClass('active'); 
		    $(".nav-item > .active").css("color", "white"); 
	    
	    	}); 
	  }); 