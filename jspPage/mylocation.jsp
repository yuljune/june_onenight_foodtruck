<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<html>
<head>
	<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
    
    <title>위치를 지정해 주세요.</title>
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
		        <input type="button" id="back"/>
		    </div>
		    <div id="jb-header">
		    	<h1>내 위치 지정</h1>
				<p><em>자신의 위치를 지도에 클릭해주세요!</em></p>
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				    
				    
				    <div class="hAddr">
				        <span class="title">지도중심기준 행정동 주소정보</span>
				        <span id="centerAddr"></span>
				    </div>
				</div>
 	
	    </div>
	    <div id="jb-content">
	    	<h2></h2>
    			<form action="mylocation" method="post">
			    	<input type="hidden" id="detail" name = "mylocation">
			    	<input type="submit" value="위치지정">
			    </form>
	        
	    </div>



<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=27e115b2911e64a881c38e9655a6c2ca&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">GPS기준점</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}
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

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
        if (status === daum.maps.services.Status.OK) {
            var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : ' + result[0].roadAddress.name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].jibunAddress.name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title"> 주소정보</span>' + 
                            detailAddr + 
                        '</div>';
            var address = result[0].jibunAddress.name
           
			var detail = document.getElementById('detail'); 
			detail.value = address.substring(7,9);
            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }   
    });
});

// 중심 좌표0나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2addr(coords, callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2detailaddr(coords, callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(status, result) {
    if (status === daum.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');
        infoDiv.innerHTML = result[0].fullName;
    }    
}
	$("#back").click(function(){
		location.href="index.jsp";
	});

</script>

</body>
</html>