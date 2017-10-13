<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8">
		<title>회원정보 찾기</title>
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
				margin : 15px;
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
            </div>
            <div id="jb-header">
            <h1>아이디 / 비밀번호 찾기</h1>
            </div>
            <div id="jb-content">
            <h2></h2>
                <div id="loginbox">
                	<form action="find" method="post">
						<div>
						<table>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="email"/></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input type="text" name="phone"/></td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" value="찾기" id="submit"/>
								</td>
							</tr>
						</table>
						<c:forEach items="${result }" var = "member">
							<h3>아이디는 ${member.user_id }이고 비밀번호는 ${member.user_pw }입니다.</h3>
						</c:forEach>
						</div>
					</form>
                </div>
            </div>
            <div id="jb-footer">
		      <p>Copyright</p>
		    </div>
        </div>
	</body>
	<script>
		$(document).ready(function(){
			
			$("#back").click(function(){
	        	location.href="loginPage.jsp";
	        });
			
		});
	</script>
</html>