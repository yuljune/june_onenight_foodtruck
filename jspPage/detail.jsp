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
		      .goTop{cursor:pointer;}
		      .goMenu{cursor:pointer;}
		      .goInfo{cursor:pointer;}
		      .goReview{cursor:pointer;}
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
		        	<span id="tName"><h1 id="showTruckName">${list.comp_name }</h1></span>
		        	
		        	<div id="checkLocation">
		        		<form action="showlocation" method="post" name="showlocation">
							<input type="hidden" name="trucknum" value="${list.trucknum }" >
							<div id="map"></div>
						</form>
							<h2 >별점 : ${list.starpoint }</h2>
						
		        	</div>
		        	
		      </div>
		      
		      <div id="jb-content">
		        
		        <div id="photoWrap">
		        	
			        	<input type="hidden" id="text" value="">
						<h3 id="msg"></h3>
						<div id="table">
								
								<img src="upload/${list3.newfile}" id="photoDp"/>
						</div>
					</div>
				<table id="goBtn" class="overBtn">
	                        <tr>
	                            <td class="goMenu">메뉴</td>
	                            <td class="goInfo">정보</td>
	                            <td class="goReview">리뷰</td>
	                            <td></td>
	                            <td class="goTop">TOP</td>
	                        </tr>
				</table>
				
						        
				</div>
			      <div id="jb-sidebar">
			      	<div id="menuWrap">
				      	<table id="goBtn" class="menuTb">
	                        <tr>
	                            <td class="goMenu" style="background-color:grey">메뉴</td>
	                            <td class="goInfo">정보</td>
	                            <td class="goReview">리뷰</td>
	                            <td></td>
	                            <td class="goTop">TOP</td>
	                        </tr>
	                        <tr>
	                        	<td colspan="5">
	                        		<table id="menuTable">
	                        			<tr>
											<td>메뉴</td>
											<td style="width:80%; height:500px; text-align:left;">
											<textarea rows="20"  readonly
											style="font-size:30; resize:none;">${list.content}</textarea>
											</td>
										</tr>	
	                        		</table>
	                        	</td>
	                        </tr>
	                    </table>
                    </div>
                    
                    <div id="menuWrap">
                    <table id="goBtn" class="infoTb">
                        <tr>
                            <td class="goMenu">메뉴</td>
                            <td class="goInfo" style="background-color:grey">정보</td>
                            <td class="goReview">리뷰</td>
                            <td></td>
                            <td class="goTop">TOP</td>
                        </tr>
                        <tr>
                        	<td colspan="5">
                        		<table id="infoTable">
									<tr>
										<td>트럭번호</td>
										<td class="tdtd">${list.trucknum }</td>
									</tr>	
									<tr>
										<td>트럭이름</td>
										<td class="tdtd">${list.comp_name }</td>
									</tr>
									<tr>
										<td>운영시간</td>
										<td class="tdtd">${list.comp_time }</td>
									</tr>	
									<tr>
										<td>전화번호</td>
										<td class="tdtd">${list.comp_phone}</td>
									</tr>	
									<tr>
										<td>카드</td>
										<td class="tdtd">${list.card}</td>
									</tr>	
									<tr>
										<td>현재상태</td>
										<td class="tdtd">${list.condition}</td>
									</tr>	
									<tr>
										<td>게시일</td>
										<td class="tdtd">${list.reg_date}</td>
									</tr>	
									<tr>
										<td>조회수</td>
										<td class="tdtd">${list.bHit}</td>
									</tr>	
								</table>
                        		
                        	</td>
                        </tr>
                    </table>
                    </div>
                    <div id="menuWrap">
                    <table id="goBtn" class="reviewTb">
                        <tr>
                            <td class="goMenu">메뉴</td>
                            <td class="goInfo">정보</td>
                            <td class="goReview" style="background-color:grey">리뷰</td>
                            <td></td>
                            <td class="goTop">TOP</td>
                        </tr>
                        <tr>
                        	<td colspan="5">
                        		<h3>리뷰</h3>
								<table class="reviewList">
										<tr>
											<td>작성자</td>
											
											<td>내용</td>
											
											<td>별점</td>
											<td>삭제</td>
											
										</tr>
										<c:forEach items="${list2 }" var = "member">
											<tr>
												<td>${member.user_id}</td>
												
												<td style="width:450px;">${member.content }</td>
												
												<td>${member.starpoint }</td>
												<form action="deletereview" method="post">
													<input type="hidden" name ="loginId" value="${sessionScope.loginId}">
													<input type="hidden" name="revidx" value="${member.revidx}">
													<input type="hidden" name="trucknum" value="${member.trucknum}">
													<td><input type="submit" value="삭제"></td>
												</form>
											</tr>
										</c:forEach>
								</table>
								<br><br>
								<form action="addreview" method="post">
									<c:forEach items="${list2 }" var = "member">
										<input type="hidden" name="trucknum" value=${member.trucknum}>
									</c:forEach>
									<input type="hidden" name ="loginId" value="${sessionScope.loginId}">
										내용입력 : <input type="text" name="content" maxlength="13" placeholder="최대 13자"><br>
										별점입력 : <input type="number" max="10"  name="starpoint"><br>
									<input type="submit" value="리뷰작성하기"/>
								</form>
                        	</td>
                        </tr>
                    </table>
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
		var text = document.getElementById('text'); 
		text.value = "${list3.newfile}";
			$(document).ready(function(){
				if($('#text').val()!=""){
					$("#table").css("display","block");
				}else{
					$("#table").css("display","none");
					$("#msg").html("등록된사진이 없습니다.");
				}
			});
		
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
           
           $("#back").click(function(){
        	   location.href="list";
           	});
           
           $(".goTop").click(function(){
        	   $(window).scrollTop(0);
           });
           $(".goMenu").click(function(){
        	   $(window).scrollTop($('.menuTb').offset().top);
           });
           $(".goInfo").click(function(){
        	   $(window).scrollTop($('.infoTb').offset().top);
           });
           $(".goReview").click(function(){
        	   $(window).scrollTop($('.reviewTb').offset().top);
           });
           $("#map").click(function(){
        	  document.showlocation.submit(); 
           });
               
	</script>
</html>