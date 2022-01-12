$(function(){
	// 사용자의 자료 입력여부를 검사하는 함수
	$('#confirm').click(function(){
    	if( $.trim($("#ownerid").val()) == '' ){
            alert("아이디를 입력해 주세요.");
            $("#ownerid").focus();
            return;
        }
    	
    	if($.trim($('#ownerpass').val())==''){
    		alert("비번입력해주세요.");
    		$('#ownerpass').focus();
    		return;
    	}
    	
    	if($.trim($('#ownerpass').val()) != $.trim($('#ownerpass2').val())){
    		alert("비밀번호가 일치하지 않습니다..");
    		$('#ownerpass2').focus();
    		return;
    	}
    		
    	if($.trim($('#ownername').val())==''){
    		alert("이름입력해주세요.");
    		$('#ownername').foucs();
    		return;
    	}
       
        // 자료를 전송합니다.
        document.ownerinput.submit();
	});
	
	//아이디 중복체크
	$('#ownerid').keyup(function(){
        $.ajax({
        type: 'get',
        url: 'idCheck.do',
        data:{ownerid : $('#ownerid').val()},
        //한글 처리하는 부분
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success : function(result){
        	$('#idCheckResult').text(result);
        },
        error : function(err){
        	alert('fail');
        }
        })    
	})
})