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
			#loginbox{
                position: relative;
                top: 10%;
				border : 1px solid lightgray;
				text-align : center;
			}
			#loginbox table, td{
				text-align : center;
                
			}
			#submit{
				background-color : gray;
				color : white;
				width : 206px;
				height : 30px;
				font-size: 18px;
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
                background-origin:padding-box;}
		    #checker{
		        border: 1px solid black; 
		        position: absolute; 
		        width: 40%; 
		        height: 18%; 
		        min-height: 150px;
		        background-color: white;
		        top : -200.6;
                right : 10;
		        z-index: 1;
                display: block;
		    }
            table, td{
                text-align: center;
            }
            table{
                margin-left: auto;
                margin-right: auto;
                padding: 15px;
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
            
        @media ( max-width: 800px ) {
            #jb-container {
                width: auto;
            }
            #jb-content {
                float: none;
                width: auto;
            }
            #checker{
                width: 70%;
            }
        }
		</style>
	</head>
	<body>
		
		
		<div id="jb-container">
            <div id="headerMenu">
                <input type="button" id="back"/>
                <form name="trucklist" action="trucklist" method="post">
	         				<input type = "hidden" name="truckinfo" value = ${sessionScope.loginId}>	
	         	</form>	
            </div>
            <div id="jb-header">
            <h1>트럭 정보 변경</h1>
            </div>
            <div id="jb-content">
            <h2></h2>
                <div id="loginbox">
                	<form action="truckupdate" name="select" method="post">
						<table>
							<tr>
								<td>아이디</td>
								<td><input type="text" name="user_id" value="${truck.user_id }" readonly/></td>
							</tr>
							<tr>
								<td>트럭이름</td>
								<td><input type="text" name="comp_name" value="${truck.comp_name }"/></td>
							</tr>
							<tr>
								<td>운영시간</td>
								<td><input type="text" name="comp_time" value="${truck.comp_time }"/></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input type="text" name="comp_phone" value="${truck.comp_phone}"/></td>
							</tr>
							<tr>
									<td>메뉴판 내용</td>
									<td>
										<textarea rows="20" name="content" >${truck.content}</textarea>
									</td>
								</tr>
							<tr>
									<td>주소</td>
									<td>
									
										<select name="category1" onchange="setCategory2()">
											<option value="">선택하세요</option>
											<option value="서울">서울</option>
											<option value="인천">인천</option>
											<option value="대구">대구</option>
											<option value="울산">울산</option>
											<option value="대전">대전</option>
										</select>
										<select name="category2">
											<option value="">선택하세요</option>
										</select>
								  </td>
								</tr>
							<tr>
								<td>카드</td>
								<td>
									<select name="selCard" onchange="sel1()">
										<option value="on">ON</option>
										<option value="off" selected="selected">OFF</option>
									</select>
									<input type="hidden" id="cd" name="card" value="${truck.card}"/>
								</td>
							</tr>
							<tr>
								<td>현재상태</td>
								<td>
									<select name="selCondition" onchange="sel2()">
										<option value="on">ON</option>
										<option value="off" selected="selected">OFF</option>
									</select>
									<input type="hidden" id="con" name="condition" value="${truck.condition}"/>
								</td>
							</tr>
						</table>
						<input type="submit" value="수정"/>
					</form>
                </div>
            </div>
        </div>
	
		
	</body>
	<script>
		var msg = "${result}";
		if(msg != ""){
			alert(msg);
		}
		
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
		
		function sel1(){
			var str = $("select[name=selCard]").val();
			$("#cd").val(str);
		};
		
		function sel2(){
			var str = $("select[name=selCondition]").val()
			$("#con").val(str);
		};
		
		$(document).ready(function(){
			$("#back").click(function(){
	        	document.trucklist.submit();
	        });
			
			
			
		});
	</script>
</html>