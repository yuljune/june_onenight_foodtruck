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
			#loginBtn{
				background-color : gray;
				color : white;
				width : 206px;
				height : 30px;
				font-size: 18px;
			}
            #idpw{
                text-align: center;
                display: inline-block;
            }
            .submit{
                position: absolute;
                display: inline-block;
            }
            #jb-container {
                width: 940px;
                margin: 10px auto;
                padding: 20px;
                border: 1px solid #bcbcbc;
                height : 800px;
                background-image: url("mainpage.jpg");
		        background-size: cover;
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
            	background-origin:padding-box;
            	}
		    #slideMenu{
		        border: 1px solid black; 
		        position: absolute; 
		        width: 30%; 
		        height: 70%; 
		        min-height: 500px;
		        background-color: white;
		        left: -500;
		        display: none;
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
            #slideMenu{
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
            	<h1>로그인</h1>
            </div>
            <div id="jb-content">
            	<h2></h2>
                <div id="loginbox">
                    <form name="login" action="login" method="post">
                        <div id="radiobtn">
                            <input type="radio" name="user" value="ceo"/>사장님
                            <input type="radio" name="user" value="cus"/>개인
                            <br/><br/>
                        </div>
                        <div id="idpw">
                        <table>
                            <tr>
                                <td rowspan="">ID </td>
                                <td rowspan=""><input type="text" name="userId"/></td>

                            </tr>
                            <tr>
                                <td rowspan="2">PW</td>
                                <td rowspan="2"><input type="password" name="userPw"/></td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                                <td colspan="3"><input type="button" value="로그인" id="loginBtn"/></td>
                            </tr>
                            <tr>

                                <td colspan="3">
                                    <input type="button" value="회원가입" onclick="location.href='join.jsp'"/>
                                    <input type="button" value="ID/PW 찾기" onclick="location.href='find.jsp'"/>
                                </td>
                            </tr>
                        </table>
                        </div>
                    </form>
                </div>
            </div>
            
        </div>
	</body>
	<script>
		var session = "${sessionScope.loginId}";

		$("#logout").click(function(){
			location.href="logout";
		})
		
		var msg = "${result}";
		if(msg != ""){
			alert(msg);
		}
		
		
        $(document).ready(function(){
            $("#back").click(function(){
            	location.href="home.jsp";
            });
            
            $("#loginBtn").click(function(){
	        	if(!$(':input:radio[name=user]:checked').val()){
	        		alert("회원유형을 선택해 주세요.");
	        	}else{
	        		document.login.submit();
	        	}
	        });
            
        }); 
	</script>
</html>
