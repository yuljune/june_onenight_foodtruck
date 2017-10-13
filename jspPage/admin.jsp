<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>
			
			#infoList table{
				border: solid 1px black;
			}
			#infoList td{
				border: solid 1px black;
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
		        }
	        #back{background : url(http://kr.seaicons.com/wp-content/uploads/2015/11/Arrows-Left-Arrow-icon.png);
           	width: 32px;
           	height: 32px;
           	cursor:pointer;
           	background-size: cover;
           	background-origin:padding-box;
           	}
	        li{list-style : none;}
	        .ceoMyPage, .ceoTruckPage{padding-left:25px; padding-top:5px; cursor:pointer;}
	        .cusMyPage{padding-left:25px; padding-top:5px; cursor:pointer;}
	      	.logBtn{margin : 15px;}
	      	.search{width:30%;
		      				height:80px; 
		      				border:1px solid #bcbcbc; 
		      				padding:20px; 
		      				margin :5px; 
		      				text-align:center;
		      				border-radius: 10px;
		      				cursor:pointer;
		      						
		      				}
	      	.search b{
		      				color:white;
		      				text-shadow: 2px 2px 4px #000000;
		      				font-size:24px;
		      				line-height:80px;
		      				vertical-align:middle;
		      				
		      				}
	      	
	      	#homeBtn{background :url(https://www.asty-moulin.be/j34/images/categories/batiment.png);
	      					background-size:cover;
	      					background-origin:padding-box;
	      					width:50px; height:50px;
	      					position: absolute;
	      					bottom : 20px;
	      					right : 20px;
	      					cursor : pointer;
	      					}	
	      	#map{background :url(pin.png);
	      					background-size:contain;
	      					background-repeat:no-repeat;
	      					width:50px; height:50px;
	      					
	      					cursor : pointer;
	      					
	      	}			
		      #jb-header {
		        padding: 20px;
		        margin-bottom: 20px;
		        border: 1px solid #bcbcbc;
		        min-height: 100px;
		      }
		      #jb-content {
		        width: 610px;
		        padding: 20px;
		        margin-bottom: 20px;
		        float: left;
		        border: 1px solid #bcbcbc;
		        height : 560px;
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
		        border: 1px solid #bcbcbc;
		      }
		      
		      #menuWrap{
		      	border : 1px solid #bcbcbc;
		      	height : 910px;
		      }
		      #photoWrap{
		      	border : 1px solid #bcbcbc;
		      	min-height: 500px;
		      	text-align: center;
		      }
		      #infoTable .tdtd{
		      	width:80%;
		      	height:40px;
		      }
		      #goBtn{
		      	border : 1px solid #bcbcbc;
		      	border-collapse : collapse;
		      }
		      #goBtn td{
		      	border : 1px solid #bcbcbc;
		      	width: 120px;
		      	text-align : center;
		      }
		      #checkLocation h2{
				color : orange;
			  }
		      #emptyB{height:450px;}
		      
		      .reviewList td{
		      	height: 40px;
		      }
		      #checkLocation{
		      	float : right;
		      	}
		      #tName{
		      	float : left;
		      }
		      .overBtn .goMenu:hover, .goInfo:hover, .goReview:hover, .goTop:hover{
		      	background-color: grey;
		      }
		      #photoDp{
		      	width: 80%;
		      	height: 400px;
		      	margin-top : 50px;
		      	margin-left: auto;
		      	margin-right: auto;
		      }
		      #table{text-align: center;}
		      table, td{
		       	border: 1px solid black;
		       	border-collapse: collapse;
		      	text-align: center;
		      }
		      #conTb td{
		      	width : 80px;
		      }
		     
		     	@media ( max-width: 800px ) {
		        #jb-container {
		          width: auto;
		        }
		        #jb-content {
		          float: none;
		          width: auto;
		        }
		        #jb-sidebar {
		          float: none;
		          width: auto;
		        }
		        #slideMenu{
		            width: 70%;
		          }
		        .search{
		        	
		        	width:85%;
		        	display:inline-block;
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
		        <h1>회원관리 페이지</h1>
		        </div>
	 <div id="jb-content">
	
		<table id="conTb">
			<tr>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>닉네임</td>
				<td>이메일</td>
				<td>전화번호</td>
				<td>회원종류</td>
				<td></td>
			</tr>
			<c:forEach items="${list }" var = "member">
				<tr>
					<td>${member.user_id }</td>
					<td>${member.user_pw }</td>
					<td>${member.nickname }</td>
					<td>${member.email}</td>
					<td>${member.phone}</td>
					<td>${member.position}</td>
					<td><a href = "bye?user_id=${member.user_id }">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		<br/><br/>
		<form action="admintruck" method="post">
			<input type="submit" value="트럭관리">
		</form>
		</div>
		<div id="jb-footer">
			        <p>Copyright</p>
			     </div>
		</div>
		
		
	</body>
	<script>
	
		$("#back").click(function(){
	    	location.href="index.jsp";
	    });
	</script>
</html>