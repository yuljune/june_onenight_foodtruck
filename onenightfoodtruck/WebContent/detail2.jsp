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
                background-origin:padding-box;}
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
        <h1>등록된 사진 보기</h1>
      </div>
      <div id="jb-content">
		<table>
			<td>
				<img src="upload/${list.newfile}" width="450"/>
			</td>
		</table>
		</div>
		<div id="jb-footer">
        <p>Copyright</p>
      </div>
    </div>
    <form name="backlist" action="trucklist" method="post">
    	<input type ="hidden" name="truckinfo" value="${sessionScope.loginId}">
    </form>
	</body>
	<script>
	
		$("#back").click(function(){
        	document.backlist.submit();
        });
		
	</script>
</html>