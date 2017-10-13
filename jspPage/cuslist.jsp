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
		        #openSlide{background : url(https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/2000px-Hamburger_icon.svg.png);width: 32px;height: 32px;cursor:pointer;background-size: cover;background-origin:padding-box;}
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
		        #closeSlide{background : url(http://kr.seaicons.com/wp-content/uploads/2015/11/Arrows-Left-Arrow-icon.png);width: 32px;height: 32px;cursor:pointer;background-size: cover;background-origin:padding-box;}
		        #slideMenu li{list-style : none;}
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
	      	li{list-style: none; }
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
		        padding: 20px;
		        margin-bottom: 20px;
		        float: left;
		        border: 1px solid #bcbcbc;
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
		            width: 40%;
		          }
		        .search{
		        	
		        	width:85%;
		        	display:inline-block;
		        }  
		       
		</style>
	</head>
	<body>
		
		<div id="slideMenu">
		         <table>
		             <tr>
		             	<td></td>
		             	<td></td>
		             </tr> 
		             <tr>
		                 <td style="width:96%">
			                
			                	<%if(session.getAttribute("loginId")==null){%>
								<input type="button" class="logbtn" value="로그인" onclick="location.href='loginPage.jsp'"/>
							<%}%>
									
			               
			                	
			             	   <%if(session.getAttribute("loginId")!=null){%>
										안녕하세요 ${sessionScope.loginId}님
										<input id="logout" class="logbtn" type="button" value="로그아웃"/>
								<%}%>
								
					 		<div id="homeBtn" onclick="location.href='index.jsp'"></div>
		                 </td>
		                 <td><input type="button" id="closeSlide"/></td>
		             </tr>
		         </table>
		         <hr/>
		        	<%if(session.getAttribute("loginId")!=null){%>
		         
		         
		         <%if(session.getAttribute("position").equals("ceo")){%>
		         
		         <div class="ceoMyPage">
		         		<form name="ceolist" action="ceolist" method="post">
			         			<input type = "hidden" name="ceoinfo" value = ${sessionScope.loginId}>
								<div id="ceoPage">마이페이지</div>
		         		</form>
		         </div>
		         <hr/>
		         <div class="ceoTruckPage">
		         	<form name="trucklist" action="trucklist" method="post">
		         				<input type = "hidden" name="truckinfo" value = ${sessionScope.loginId}>
		         				<div id="truckPage">트럭페이지</div>	
		         	</form>	
		         </div>
		         <hr/>
		         <%}%>
		         
		         
		         <%}	%>
		         
		         
		    </div>
		   
		   
				<div id="jb-container">
	        <div id="headerMenu">
	            <input type="button" id="openSlide"/>
	        </div>
	        <div id="jb-header">
	        <h1>마이페이지</h1>
	      </div>
	      <div id="jb-content">
	        <h2>내 정보</h2>
		        <table>
			        <tr>
				        <td>
				        	<ul>
				        		<li>아이디</li>
				        		<li>비밀번호</li>
				        		<li>닉네임</li>
				        		<li>이메일</li>
				        		<li>전화번호</li>
				        		<li>수정</li>
				        	</ul>
				        </td>
				        <td>	
				        	<c:forEach items="${list }" var = "member">
				        	<ul>
				        		<li>${member.user_id }</li>
				        		<li>${member.user_pw }</li>
				        		<li>${member.nickname }</li>
				        		<li>${member.email}</li>
				        		<li>${member.phone}</li>
				        		<li><a href = "cusmodify?user_id=${member.user_id }">수정</a></li>
				        	</ul>
				        	</c:forEach>
				        </td>
			        </tr>	
				</table>
				
	        </div>
	      <div id="jb-sidebar">
	        <h2>부가기능</h2>
	        <ul>
	          <li></li>
	          <li></li>
	          <li></li>
	        </ul>
	      </div>
	      <div id="jb-footer">
	        <p>Copyright</p>
	      </div>
	    </div>
	</body>
		
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
		
		var ctn = 0;
	    $(document).ready(function(){
	        $("#closeSlide").click(function(){
	            if(ctn == 1){
	                $("#slideMenu").animate({"left":"-=500"},500,"swing");
	                setTimeout(function(){
	                    $("#slideMenu").css("display","none");
	                    ctn = 0;
	                    console.log(ctn);
	                    },500);
	            }
	        });
	        
	        $("#openSlide").click(function(){
	            if(ctn == 0){
	                $("#slideMenu").animate({"left":"+=500"},500,"swing");
	                $("#slideMenu").css("display","inline");
	                ctn = 1;
	                console.log(ctn);
	            }
	        });
	        
	        $("#cusPage").click(function(){
	        	document.cuslist.submit();
	        });
	        
	        
	
	    }); 
		
	</script>
</html>