<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
		
		<title>환영합니다.</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8">
		
		<style>
		      #jb-container {
		        width: 940px;
		        margin: 10px auto;
		        padding: 20px;
		        border: 1px solid #bcbcbc;
		        background-image: url("mainpage.jpg");
		        background-size: cover;
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
		        .adminPage{padding-left:25px; padding-top:5px; cursor:pointer;}
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
	      	#local{background : url(http://img.phone.baidu.com/public/uploads/store_7/9/4/a/94a07897fcbbeafe2aac82e491e9a975_200x200.png) 0 -70px; 
	      					background-size: cover;
	      					background-origin:padding-box;}
      		#rank{background : url(http://cfs15.tistory.com/image/8/tistory/2009/02/21/16/52/499fb2b233a09) 0 0px; 
	      					background-size: cover;
	      					background-origin:padding-box;}
      		#keyword{background : url(http://farm4.static.flickr.com/3299/3345060816_22afdc311a.jpg) 0 0px; 
	      					background-size: cover;
	      					background-origin:padding-box;}
      		#location{background : url(http://cfd.tourtips.com/@cms_800/2014062357/gjdn5l/%ED%91%B8%EC%B9%B4%EC%89%98%EB%B9%84%EC%B9%98.jpg) 0 0px; 
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
		        text-align: center;
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
	         
	         
	         <%if(session.getAttribute("loginId").equals("admin")){%>
									<div class="adminPage">
										<form name="adminPage" action="admin" method="post">
											<div id="adminPage">관리자페이지</div>
										</form>
									</div>
									<hr/>
								<%} %>
	         
	         
	         
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
	         
	         <%if(session.getAttribute("position").equals("cus")){%>
	         
	         <div class="cusMyPage">
	         	<form name="cuslist" action="cuslist" method="post">
					<input type = "hidden" name="cusinfo" value = ${sessionScope.loginId}>
					<div id="cusPage">마이페이지</div>
				</form>
				<%}	%>
	         </div>
	         <hr/>
	         <%}	%>
	    </div>
	   
	   
			<div id="jb-container">
        <div id="headerMenu">
            <input type="button" id="openSlide"/>
        </div>
        <div id="jb-header">
        	<h1> 원나잇 푸드트럭</h1>
      </div>
      <div id="jb-content">
        <h2>검색</h2>
	        <div class="search" id="local" onclick="location.href='mylocation.jsp'"><b>내주변검색</b></div>
	        <div class="search" id="rank" onclick="location.href='./list'"><b>랭킹검색</b></div>
	        <div class="search" id="keyword" onclick="location.href='keyword.jsp'"><b>키워드검색</b></div>
	        <div class="search" id="location" onclick="location.href='select.jsp'"><b>지역별검색</b></div>
        </div>
      
      <div id="jb-footer">
        <p>Copyright</p>
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
            
            $("#ceoPage").click(function(){
            	document.ceolist.submit();
            });
            $("#truckPage").click(function(){
            	document.trucklist.submit();
            });
            $("#cusPage").click(function(){
            	document.cuslist.submit();
            });
            $("#adminPage").click(function(){
            	document.adminPage.submit();
            });
 
        }); 
	</script>
</html>