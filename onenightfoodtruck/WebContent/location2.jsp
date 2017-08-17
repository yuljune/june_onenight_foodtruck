<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <title>마커 생성하기</title>
    <style>
    	 .map_wrap {position:relative;width:100%;height:350px;}
	    .title {font-weight:bold;display:block;}
	    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
	    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
	    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
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
		        <input type="button" id="back">
		    </div>
		    <div id="jb-header">
		    	<h1>트럭위치</h1>
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				</div>
	    </div>
	
<c:forEach items="${list }" var = "member">
	<input type="hidden" id="wido" value="${member.wido}">
	<input type="hidden" id="gyoungdo" value="${member.gyoungdo}">
</c:forEach>



<div id="map" style="width:100%;height:350px;"></div>
<script>
<c:forEach items="${list }" var = "member">
	var wido = ${member.wido};
	var gyoungdo = ${member.gyoungdo};
</c:forEach>


</script>


<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=27e115b2911e64a881c38e9655a6c2ca"></script>

<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(wido, gyoungdo), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 

var markerPosition  = new daum.maps.LatLng(wido, gyoungdo); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});


// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);


// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);  

</script>
<script>
<c:forEach items="${list }" var = "member">
	var trucknum = ${member.trucknum};
</c:forEach>
$("#back").click(function(){
	location.href="detail?trucknum="+trucknum;
});
</script>
</body>
</html>