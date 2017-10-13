<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta charset="UTF-8"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>
            #back{
                width: 5%;
                height: 3%;
            }
            #back, #head{
                display: inline;
            }
            #head{
                padding-left: 40%;
            }
            #photoZone{
                margin: 0 2%;
                width: 96%;
                height: 70%;
                border: 1px solid black;
                text-align: center;
            }
            #img_preview{
                
            }
            
            
		</style>
	</head>
	<body>
		<h4>메뉴관리</h4>
        <br/>
        <br/>
        <br/>
        <hr/>
        <div id="photoZone"><img id="img_preview" style="display:none;"/></div>
        <br/>
	<body>
		<form name="write" action="write" method="post" enctype="multipart/form-data">
			<%
			String id = request.getParameter("user_id");
			%>
			<input type="hidden" name="user_id" value=<%=id %>>
			<table>
				<tr>
					<td>사진</td>
					<td><input name="uploadFile" id="input_file" type="file"/><input type="hidden" name="userId" id="id"/></td>
				</tr>
			</table>
		</form>	
		<input type="button" id="upload" value="업로드"/>
		<input type="button" id="cancel" value="취소"/>
		
		<form name="trucklist" action="trucklist" method="post">
			<input type = "hidden" name="truckinfo" value = ${sessionScope.loginId}>
		</form>
			
	</body>
	<script>
	 $.fn.setPreview = function(opt){
	        "use strict"
	        var defaultOpt = {
	            inputFile: $(this),
	            img: null,
	            w: 100,
	            h: 100
	        };
	        $.extend(defaultOpt, opt);

	        var previewImage = function(){
	            if (!defaultOpt.inputFile || !defaultOpt.img) return;

	            var inputFile = defaultOpt.inputFile.get(0);
	            var img       = defaultOpt.img.get(0);

	            // FileReader
	            if (window.FileReader) {
	                // image 파일만
	                if (!inputFile.files[0].type.match(/image\//)) return;

	                // preview
	                try {
	                    var reader = new FileReader();
	                    reader.onload = function(e){
	                        img.src = e.target.result;
	                        img.style.width  = defaultOpt.w+'%';
	                        img.style.height = defaultOpt.h+'%';
	                        img.style.display = '';
	                    }
	                    reader.readAsDataURL(inputFile.files[0]);
	                } catch (e) {
	                    // exception...
	                }
	            // img.filters (MSIE)
	            } else if (img.filters) {
	                inputFile.select();
	                inputFile.blur();
	                var imgSrc = document.selection.createRange().text;

	                img.style.width  = defaultOpt.w+'%';
	                img.style.height = defaultOpt.h+'%';
	                img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";           
	                img.style.display = '';
	            // no support
	            } else {
	                // Safari5, ...
	            }
	        };

	        // onchange
	        $(this).change(function(){
	            previewImage();
	        });
	    };


	    $(document).ready(function(){
	        var opt = {
	            img: $('#img_preview'),
	            w: 100,
	            h: 100
	        };

	        $('#input_file').setPreview(opt);
	    });
	
		var msg="${result}";
		
		if(msg != ""){
			alert(msg);
		}
		
		$("#id").val("${sessionScope.loginId}");
		
		
		$("#cancel").click(function(){
			document.trucklist.submit();
		});
		$("#upload").click(function(){
			document.write.submit();
		});
		
	</script>
</html>