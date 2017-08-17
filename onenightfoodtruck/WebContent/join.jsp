<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8">
		<title>Insert title here</title>
		<style>
			#loginbox{
                position: relative;
                top: 10%;
				border : 1px solid lightgray;
				text-align : center;
			}
			#loginbox table, td{
				text-align : center;
                
			}
			#submit{
				background-color : gray;
				color : white;
				width : 186px;
				height : 30px;
				font-size: 18px;
				cursor:pointer;
			}
            
            
            #jb-container {
                width: 940px;
                margin: 10px auto;
                padding: 20px;
                border: 1px solid #bcbcbc;
              }
            #headerMenu{
                padding: 20px;
                margin-bottom: 20px;
                border: 1px solid #bcbcbc;
                background-repeat: 
            }
            #back{background : url(http://kr.seaicons.com/wp-content/uploads/2015/11/Arrows-Left-Arrow-icon.png);
                width: 32px;
                height: 32px;
                cursor:pointer;
                background-size: cover;
                background-origin:padding-box;}
		    #checker{
		        border: 1px solid black; 
		        position: absolute; 
		        width: 40%; 
		        height: 23%; 
		        min-height: 150px;
		        background-color: white;
		        top : -300.6;
                right : 10;
		        z-index: 1;
                display: none;
		    }
            table, td{
                text-align: center;
            }
            table{
                margin-left: auto;
                margin-right: auto;
                margin-top : auto;
                padding: 15px;
            }
            #checker table{
            	margin-top : 18px;
            	margin-bottom : auto;
            }

            #jb-header {
                padding: 20px;
                margin-bottom: 20px;
                border: 1px solid #bcbcbc;
            }
            #jb-content {
                padding: 20px;
                margin-bottom: 20px;
                border: 1px solid #bcbcbc;
            }
            #jb-footer {
		        clear: both;
		        padding: 20px;
		        border: 1px solid #bcbcbc;
		      }
            
        @media ( max-width: 800px ) {
            #jb-container {
                width: auto;
            }
            #jb-content {
                float: none;
                width: auto;
            }
            #checker{
                width: 70%;
            }
        }
		</style>
	</head>
	<body>
			<div id="checker">
            	<div>
						<table>
							<tr>
								<td>아이디</td>
								<td><input type="text" name="userId" placeholder="최대 20글자" maxlength="20" id="checkId"/></td>
								<td><input type="button" id="check1" value="중복검사"/></td>
								
							</tr>
							
							<tr>
								<td>닉네임</td>
								<td><input type="text" name="userNick" placeholder="최대 8글자" maxlength="8" id="checkNick"/></td>
								<td><input type="button" id="check2" value="중복검사"/></td>
								
							</tr>
							<tr>
                                <td colspan="3">
                                    <b id="test1"></b>
                                    <br/>
                                    <hr/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                	<button id="checkOk">확인</button>
                                	<button id="closePop">닫기</button>
                                </td>
                            </tr>
						</table>
                        
                </div>
            
        </div>
        
        
		<div id="jb-container">
            <div id="headerMenu">
                <input type="button" id="back"/>
            </div>
            <div id="jb-header">
            <h1>회원가입</h1>
            </div>
            <div id="jb-content">
            <h2></h2>
                <div id="loginbox">
                    <form name="joinForm" action="join" method="post">
                        <input type="radio" id="radio1" name="user" value="ceo"/>사장님
                        <input type="radio" id="radio2" name="user" value="customer"/>개인
						<table>
							<tr>
								<td>아이디</td>
								<td><input type="text" name="userId" id="Id" readonly /></td>
								<td><input type="button" id="checkUp" value="중복검사"/></td>
								
							</tr>
							<tr>
								<td>닉네임</td>
								<td><input type="text" name="userNick" id="Nick" readonly/></td>
							</tr>
                            <tr>
								<td>비밀번호</td>
								<td><input type="password" name="userPw"/></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="email"/></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input type="text" name="phoneNum" maxlength="13"/></td>
							</tr>
							
							<tr>
								<td></td>
								<td colspan="5">
									<div id="submit">회원가입</div>
								</td>
							</tr>
						</table>
                    </form>    
                </div>
            </div>
            <div id="jb-footer">
		      <p>Copyright</p>
		    </div>
        </div>
		
		
	</body>
	<script>
		var count = 0;
		var ctn = 0;
	    var checkedId = "";
	    var checkedNick = "";
	    
		$(document).ready(function(){
			$("#check1").click(function(){
				if($("#checkId").val() == ""){
					count = 0;
					$("#test1").html("아이디를 입력해 주세요.");
				}else{
				
				$.ajax({
					type:"post",
					url:"./check1",
					data:{
						id: $("#checkId").val(),
					},				
					dataType:"json",
					success:function(data){
						count += 1;
						$('#test1').empty();
						$('#test1').html(data.result);
						
					},
					error:function(req,stat,err){
						console.log(err);
					}
				});
				
			}
				
			});
			
			
			
			$("#check2").click(function(){
				if($("#checkNick").val() == ""){
					count = 0;
					$("#test1").html("닉네임을 입력해 주세요.");
				}else{
					$.ajax({
						type:"post",
						url:"./check2",
						data:{
							nick: $("#checkNick").val(),
						},				
						dataType:"json",
						success:function(data){
							count += 1;
							$('#test1').empty();
							$('#test1').html(data.result);
							
							
						},
						error:function(req,stat,err){
							console.log(err);
						}
					});
				}
			});
	        
	        $("#checkUp").click(function(){
	            if(ctn == 0){
	                $("#checker").animate({"top":"+=300"},500,"swing");
	                $("#checker").css("display","block");
	                ctn = 1;
	            }
	        });
	        
	        
	        $("#checkOk").click(function(){
	            
	            if(count < 2){
	            	alert("중복검사를 해 주세요");
	            }else{
	            	if(ctn == 1){
		                $("#checker").animate({"top":"-=300"},500,"swing");
		                setTimeout(function(){
		                    $("#checker").css("display","none");
		                    ctn = 0;
		                    },500);
		            }
		            checkedId = $("#checkId").val();
		            checkedNick = $("#checkNick").val();
		            $("#Id").val(checkedId);
		            $("#Nick").val(checkedNick);
		            $('#test1').empty();
		            count = 0;
	            }
	        });
	        
	        $("#closePop").click(function(){
	        	if(ctn == 1){
	                $("#checker").animate({"top":"-=300"},500,"swing");
	                setTimeout(function(){
	                    $("#checker").css("display","none");
	                    ctn = 0;
	                    },500);
	            }
	            $('#test1').empty();
	            count = 0;
	        });
	        
	        $("#back").click(function(){
	        	location.href="index.jsp";
	        });
	        
	        $("#submit").click(function(){
	        	if(!$(':input:radio[name=user]:checked').val()){
	        		alert("회원유형을 선택해 주세요.");
	        	}else{
	        		document.joinForm.submit();
	        	}
	        });
	    
	    });
		
	    
	    
			var msg = "${result}";
			if(msg != ""){
				alert(msg);
			}
	</script>
</html>