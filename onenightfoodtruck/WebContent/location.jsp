<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="utf-8">
    <title>mylocation</title>
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
		        <input type="button" id="back" onclick="location.href='index.jsp'"/>
		    </div>

<div id="jb-header">
<%String trucknum = request.getParameter("trucknum"); 
  String id = request.getParameter("user_id");
%>
<div id="map" style="width:100%;height:350px;"></div>
	<p><em>자신의 위치를 지도에 클릭해주세요!</em></p> 
	<div id="clickLatlng"></div>
	<form action="location" method="post">
		<input type = "hidden" name="trucknum" value=<%=trucknum %>>
		<input type="hidden" id="lat" name = "lat">
		<input type="hidden" id="lng" name = "lng">
		<input type="hidden" name="user_id" value=<%=id %>>
		<input type="submit" value="등록">
	</form>
</div>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=27e115b2911e64a881c38e9655a6c2ca"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new daum.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
    
    var lat = document.getElementById('lat'); 
    lat.value = latlng.getLat();
    
    var lng = document.getElementById('lng'); 
    lng.value = latlng.getLng();
    
    
});
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">gps기준점 입니다.</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}
// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
</script>
</body>
</html>