<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>지역별 검색</title>
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
       	    <h1>지역별 검색</h1>
        	<form action="select" name="select" method="post">
				<select name="category1" onchange="setCategory2()" style="width:70px">
					<option value="">시 / 도</option>
					<option value="서울">서울</option>
					<option value="인천">인천</option>
					<option value="대구">대구</option>
					<option value="울산">울산</option>
					<option value="대전">대전</option>
				</select>
				<select name="category2" style="width:70px;">
					<option value="">동</option>
				</select>
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
	function setCategory2(){
		form = document.select;
		if(document.select.category1.value == "서울"){
			form.category2.length = 1;
			form.category2.options[1] = new Option("연희동");
			form.category2.options[1].value = "연희동";
			form.category2.options[2] = new Option("연남동");
			form.category2.options[2].value = "연남동";
			form.category2.options[3] = new Option("화곡동");
			form.category2.options[3].value = "화곡동";
			form.category2.options[4] = new Option("여의도동");
			form.category2.options[4].value = "여의도동";
		}
		if(document.select.category1.value == "인천"){
			form.category2.length = 1;
			form.category2.options[1] = new Option("연수동");
			form.category2.options[1].value = "연수동";
			form.category2.options[2] = new Option("학익동");
			form.category2.options[2].value = "학익동";
			form.category2.options[3] = new Option("용현동");
			form.category2.options[3].value = "용현동";
			form.category2.options[4] = new Option("선학동");
			form.category2.options[4].value = "선학동";
		}
		if(document.select.category1.value == "대구"){
			form.category2.length = 1;
			form.category2.options[1] = new Option("삼덕동");
			form.category2.options[1].value = "삼덕동";
			form.category2.options[2] = new Option("도평동");
			form.category2.options[2].value = "도평동";
			form.category2.options[3] = new Option("동촌동");
			form.category2.options[3].value = "동촌동";
			form.category2.options[4] = new Option("칠성동");
			form.category2.options[4].value = "칠성동";
		}
		if(document.select.category1.value == "울산"){
			form.category2.length = 1;
			form.category2.options[1] = new Option("남외동");
			form.category2.options[1].value = "남외동";
			form.category2.options[2] = new Option("개운동");
			form.category2.options[2].value = "개운동";
			form.category2.options[3] = new Option("대송동");
			form.category2.options[3].value = "대송동";
			form.category2.options[4] = new Option("구유동");
			form.category2.options[4].value = "구유동";
		}
		if(document.select.category1.value == "대전"){
			form.category2.length = 1;
			form.category2.options[1] = new Option("대동");
			form.category2.options[1].value = "대동";
			form.category2.options[2] = new Option("성남동");
			form.category2.options[2].value = "성남동";
			form.category2.options[3] = new Option("판암1동");
			form.category2.options[3].value = "판암1동";
			form.category2.options[4] = new Option("대청동");
			form.category2.options[4].value = "대청동";
		}
	}
		$(document).ready(function(){
			
			$("#back").click(function(){
				location.href="index.jsp";
			});
			
		});
	</script>
</html>