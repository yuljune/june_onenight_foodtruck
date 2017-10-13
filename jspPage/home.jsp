<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta charset="UTF-8"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8">
		<title>Insert title here</title>
		<style>
			#jb-container {
		        width: 940px;
		        margin: 10px auto;
		        padding: 20px;
		        border: 1px solid #bcbcbc;
                
                height : 800px;
                background: url(mainpage.jpg);
                background-size: cover;
                position: relative;
                z-index: 1;
                overflow: hidden;
            }
	        #jb-header {
	        	padding: 20px;
	        	margin-bottom: 20px;
                min-height: 285px;
                text-align: center;
	        }
            #jb-content {
		        padding: 20px;
		        margin-bottom: 20px;
                min-height: 271px;
            }
	        #jb-sidebar {
		        width: 260px;
		        padding: 20px;
		        margin-bottom: 20px;
		        float: right;
		        border: 1px solid #bcbcbc;
            }
			#jb-footer {
		        clear: both;
		        padding: 20px;
                min-height: 52px;
            }
            #start{
                padding: 20px;
		        border: 1px solid #bcbcbc;
                text-align: center;
                color: white;
                cursor: pointer;
            }

            .bgBlur:before {
              content: '';
              position: absolute;
              top: 0; left:0; right:0; bottom:0;
              background: inherit;
              z-index:-1;
              filter: blur(1px); 
              -webkit-filter: blur(1px); 
              -moz-filter: blur(1px);
              -o-filter: blur(1px);
              -ms-filter: blur(1px);
              filter: url(#blur);
            }
            svg {
            height:0
            }




			@media ( max-width: 800px ) {
	        #jb-container {
	          width: auto;
	          height:auto;
	          
            }
	        #jb-content {
	          float: none;
	          width: auto;
            }
	        #jb-sidebar {
	          float: none;
	          width: auto;
            }
			}
		</style>
	</head>
	<body>
	
		<div id="jb-container" class="bgBlur">
			<div id="jb-header">
				<h1>원나잇 푸드트럭</h1>
			</div>
			
			<div id="jb-content">
				<h2></h2>
			
			</div>
			
			
			
			<div id="jb-footer">
				<div id="start">시작하기</div>
			</div>
		</div>
        <svg version="1.1" xmlns="http://www.w3.org/2000/svg">
            <filter id="blur">
                <feGaussianBlur stdDeviation="5" />
            </filter>
        </svg>
  
	</body>
	<script>
		$("#start").click(function(){
			location.href="loginPage.jsp";
		});
	</script>
</html>