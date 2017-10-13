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
		        min-height: 650px;
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
		      #menu{
		      	margin: 10px 0; 
		      	border: 1px solid black;
		      	text-align: center;
		      	background: yellow;
		      	width:430px;
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
		        ul{
		        	margin: 0;
		        	padding: 0;
		        }
		        li{
		        	margin-right: 30px;
		        }
		        #addPhoto{
		        	cursor: pointer;
		        	border: 1px solid black;
		        	width: 75px;
		        	height: 75px;
		        	border-radius: 75px;
		        	text-align: center;
		        	background-color: lightblue;
		        	float:left;
		        	margin-right: 20px;
		        }
		        #deletelocation{
		        	cursor: pointer;
		        	border: 1px solid black;
		        	width: 75px;
		        	height: 75px;
		        	border-radius: 75px;
		        	text-align: center;
		        	background-color: lightblue;
		        	float:left;
		        	margin-right: 20px;
		        }
		        #detail2{
		        	cursor: pointer;
		        	border: 1px solid black;
		        	width: 75px;
		        	height: 75px;
		        	border-radius: 75px;
		        	text-align: center;
		        	background-color: lightblue;
		        	float:left;
		        	margin-right: 20px;
		        }
		        #truckmodify{
		        	cursor: pointer;
		        	border: 1px solid black;
		        	width: 75px;
		        	height: 75px;
		        	border-radius: 75px;
		        	text-align: center;
		        	background-color: lightblue;
		        	float:left;
		        	margin-right: 20px;
		        }
		        #basicreview{
		        	border: 1px solid black;
		        	text-align: center;
		        	width: 100px;
		        	height: auto;
		        	background: grey;
		        	color: white;
		        	padding: 3px;
		        	cursor: pointer;
		        }
		        #loc{
		        	border: 1px solid black;
		        	text-align: center;
		        	width: 150px;
		        	height: auto;
		        	background: grey;
		        	color: white;
		        	padding: 3px;
		        	cursor:pointer;
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
        <h1>트럭 정보 페이지</h1>
      </div>
      <div id="jb-content">
        <form name="basicreview" action="basicreview" method="post">
			<table>
				<tr>
					<td>
						<ul>
							<li>트럭번호</li>
							<li>아이디</li>	
							<li>상호명</li>	
							<li>운영시간</li>	
							<li>연락번호</li>	
							<li>카드</li>	
							<li>현재상태</li>	
							<li>게시일</li>	
							<li>주소</li>	
							<li>조회수</li>		
						</ul>
					</td>
					<td>
						<c:forEach items="${list }" var = "member">
							<ul>
								<li>${member.trucknum }</li>
								<li>${member.user_id }</li>
								<li>${member.comp_name }</li>
								<li>${member.comp_time }</li>
								<li>${member.comp_phone}</li>
								<li>${member.card}</li>
								<li>${member.condition}</li>
								<li>${member.reg_date}</li>
								<li>${member.address}</li>
								<li>${member.bHit}</li>	
					</td>
				</tr>
			</table>
								<li>
									<b>
										<div id="menu">
											메뉴
										</div>
									</b>
								</li>
								<li><textarea style="resize: none;" rows=10 cols="59">${member.content}</textarea></li>												
							</ul>
				<input type="hidden" name="trucknum" value="${member.trucknum}">
				<input type="hidden" name="user_id" value="${member.user_id}">
				<div id="basicreview"><b>등록확정</b></div>
			</c:forEach>
		</form>
				
		<form name="loc" action="location.jsp" method="post">
			<c:forEach items="${list }" var = "member">
				<input type="hidden" name="trucknum" value="${member.trucknum}">
                <input type="hidden" name="user_id" value="${member.user_id}">
			</c:forEach>
			<div id="loc"><b>(지도)트럭위치등록</b></div>
			<h5>트럭위치를 재등록 하시려면 삭제 후 다시 등록해 주세요</h5>
		</form>
		
		<form name="deletelocation" action="deletelocation" method="post">
			<c:forEach items="${list }" var = "member">
				<input type="hidden" name="trucknum" value="${member.trucknum}">
                <input type="hidden" name="user_id" value="${member.user_id}">
			</c:forEach>
			<div id="deletelocation"><div style="padding-top:18px;"><b>트럭위치삭제</b></div></div>
		</form>
		
		<form name="addPhoto" action="addPhoto.jsp">
                <c:forEach items="${list }" var = "member">
				    <input type="hidden" name="user_id" value="${member.user_id}">
			    </c:forEach>
			    <div id="addPhoto"><div style="padding-top:18px;"><b>사진 등록하기</b></div></div>
		</form>
		
		<form name="detail2" action="detail2" method="post">
			<c:forEach items="${list }" var = "member">
				<input type="hidden" name="trucknum" value="${member.trucknum}">		
			</c:forEach>
			<div id="detail2"><div style="padding-top:18px;"><b>내가 올린 사진 보기</b></div></div>
		</form>
		<form name="truckmodify" action="truckmodify" method="post">
			<c:forEach items="${list }" var = "member">
				<input type="hidden" name="user_id" value="${member.user_id}">		
			</c:forEach>
			<div id="truckmodify"><div style="padding-top:18px;"><b>트럭정보 수정</b></div></div>
		</form>
        </div>
    </div>
      
      <div id="jb-footer">
        <p>Copyright</p>
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
        

    });
    
    $("#addPhoto").click(function(){
    	document.addPhoto.submit();
    });
    
    $("#deletelocation").click(function(){
    	document.deletelocation.submit();
    });
    
    $("#detail2").click(function(){
    	document.detail2.submit();
    });
    
    $("#truckmodify").click(function(){
    	document.truckmodify.submit();
    });
    
    $("#basicreview").click(function(){
    	document.basicreview.submit();
    });
    
    $("#loc").click(function(){
    	document.loc.submit();
    });
    
    
    
    
	</script>
</html>