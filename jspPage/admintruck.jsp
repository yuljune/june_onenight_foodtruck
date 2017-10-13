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
	      	#conTb{
	      		min-width: 665px;
	      	}		
		      #jb-header {
		        padding: 20px;
		        margin-bottom: 20px;
		        border: 1px solid #bcbcbc;
		        min-height: 100px;
		      }
		      #jb-content {
		        width: auto;
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
		      table{
		      	
		      }
		      #cont{
		      	
			    white-space: nowrap;
			    overflow: hidden;
		      	text-overflow: ellipsis;
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
		table{
			border: solid 1px black;
			
		}
		td{
			border: solid 1px black;
		}
		</style>
	</head>
	<body>
	<form action="basicreview" method="post">
	<div id="jb-container">
		        <div id="headerMenu">
		            <input type="button" id="back"/>
		        </div>
		        <div id="jb-header">
		        <h1>트럭관리 페이지</h1>
		        </div>
	 <div id="jb-content">
		<table id="conTb" style="table-layout: fixed;">
			<tr>
				<td>트럭번호</td>
				<td>아이디</td>
				<td>트럭이름</td>
				
				<td>전화번호</td>
				<td>내용</td>
				<td>카드</td>
				<td>현재상태</td>
				
				<td>주소</td>
				
				<td></td>
			</tr>
		
			<c:forEach items="${list }" var = "member">
				<tr>
					<td>${member.trucknum }</td>
					<td>${member.user_id }</td>
					<td>${member.comp_name }</td>
					
					<td>${member.comp_phone}</td>
					<td><div id="cont" style="width:100px;">${member.content}</div></td>
					<td>${member.card}</td>
					<td>${member.condition}</td>
					
					<td>${member.address}</td>
					
					<td><a href = "byetruck?user_id=${member.user_id }">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		</form>
		</div>
		<div id="jb-footer">
			        <p>Copyright</p>
			     </div>
		</div>
	</body>
	<script>
		$("#back").click(function(){
	    	location.href="admin";
	    });
	</script>
</html>