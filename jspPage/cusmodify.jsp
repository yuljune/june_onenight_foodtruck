<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
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
				width : 206px;
				height : 30px;
				font-size: 18px;
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
		
		
		<div id="jb-container">
            <div id="headerMenu">
                <input type="button" id="back"/>
                <form name="ceolist" action="ceolist" method="post">
	         				<input type = "hidden" name="ceoinfo" value = ${sessionScope.loginId}>	
	         	</form>
            </div>
            <div id="jb-header">
            <h1>회원정보 수정</h1>
            </div>
            <div id="jb-content">
            <h2></h2>
                <div id="loginbox">
                	<form action="cusupdate" method="post">
						<table>
							<tr>
								<td>아이디</td>
								<td><input type="text" name="user_id" value="${member.user_id }" readonly/></td>
							</tr>
							<tr>
								<td>패스워드</td>
								<td><input type="text" name="user_pw" value="${member.user_pw }"/></td>
							</tr>
							<tr>
								<td>닉네임</td>
								<td><input type="text" name="nickname" value="${member.nickname }"/></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="email" value="${member.email }"/></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input type="text" name="phone" value="${member.phone }"/></td>
							</tr>
						</table>
						<input type="submit" id="submit" value="수정"/>
					</form>
                </div>
            </div>
            <div id="jb-footer">
		      <p>Copyright</p>
		    </div>
        </div>
		
	</body>
	<script>
		var msg = "${result}";
		if(msg != ""){
			alert(msg);
		}
		$(document).ready(function(){
			
			$("#back").click(function(){
	        	window.history.back();
	        });
			
		});
	</script>
</html>