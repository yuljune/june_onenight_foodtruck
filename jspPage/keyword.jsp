<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>키워드 검색</title>
		<style>
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
		        
		        .ceoMyPage, .ceoTruckPage{padding-left:25px; padding-top:5px; cursor:pointer;}
		        .cusMyPage{padding-left:25px; padding-top:5px; cursor:pointer;}
		      	.logBtn{margin : 15px;}
		      	
		      	#back{background : url(http://kr.seaicons.com/wp-content/uploads/2015/11/Arrows-Left-Arrow-icon.png);
                width: 32px;
                height: 32px;
                cursor:pointer;
                background-size: cover;
                background-origin:padding-box;}
		      				
	      	
	      	#homeBtn{background :url(https://www.asty-moulin.be/j34/images/categories/batiment.png);
	      					background-size:cover;
	      					background-origin:padding-box;
	      					width:50px; height:50px;
	      					position: absolute;
	      					bottom : 20px;
	      					right : 20px;
	      					cursor : pointer;
	      					}											
		      #jb-header {
		        padding: 20px;
		        margin-bottom: 20px;
		        border: 1px solid #bcbcbc;
		      }
		      #jb-content {
		        width: 580px;
		        padding: 5px;
		        padding-left: 0px;
		        margin-bottom: 20px;
		        float: left;
		        border: 1px solid #bcbcbc;
		        list-style: none;
		        text-decoration: none;
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
		       li{
			         list-style: none;
			         margin: 5px;
		        }
		        a{
		        	text-decoration: none;
		        }
		        a:link{
		        	color:black;
		        }
		        a:visited{
		        	color:black;
		        }
		        a:active{
		        	color:red;
		        }
		        .condition{
		        	text-align: center;
		            display: inline;
		        	border: 1px solid black;
		        	padding: 2px;
		        	background: lightgreen;
		        }		    
		        h2{
		        	margin:3px;
		        }
		        #star{
		        	color: orangered;
		        }
		        #truck{
		        	float:left;
		        	width: 100px;
		        	height: 100px;
		        	margin-right: 25px;
		        	background: url(Transport-Interstate-Truck-icon.png);
		        	background-size: cover;
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
        	<h1>키워드 검색</h1>
        	<form action="keyword" method="post">
				<br>
				<input type = "text" name="keyword" placeholder="트럭명 또는 주소 입력"></input>
				<input type="submit" value="검색"/>
			</form>
      	</div>
					<c:forEach items="${list}" var="member">
   		<a href="detail?trucknum=${member.trucknum}">
	   		<div id="jb-content">
				<ul>
					<div id="truck"></div>
					<b><li id="star">별점 : ${member.starpoint}개</li></b>
					<h2><li>${member.comp_name}</li></h2>
					<li>영업시간 : ${member.comp_time} <br> 현 위치 : ${member.address}    </li>	
					<li><div class=condition>영업 ${member.condition}</div>     <div class=condition>카드 ${member.card}</div></li>	
				</ul>
			 </div>
			 </a>
			 <input type="hidden" value=${member.condition} id="cond">
			 <input type="hidden" value=${member.starpoint} id="stpt">
		 </c:forEach>
	          
      <div id="jb-footer">
        <p>Copyright</p>
      </div>
    </div>
	        
	</body>
	<script>
		$(document).ready(function(){
			
			$("#back").click(function(){
				location.href="index.jsp";
			});
			
		});
	</script>
</html>