<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

	<head>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style></style>
	</head>
	<body>
	
	<table>
			<tr>
				<td>리뷰번호</td>
				<td>별점</td>
				<td>내용</td>
				<td>트럭번호</td>
				<td>작성자</td>
				<td>삭제</td>
				
			</tr>
			<c:forEach items="${list }" var = "member">
				<tr>
					<td>${member.revidx }</td>
					<td>${member.starpoint }</td>
					<td>${member.content }</td>
					<td>${member.trucknum}</td>
					<td>${member.user_id}</td>
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
			<c:forEach items="${list }" var = "member">
				<input type="hidden" name="trucknum" value=${member.trucknum}>
			</c:forEach>
			<input type="hidden" name ="loginId" value="${sessionScope.loginId}">
				내용입력 : <input type="text" name="content"><br>
				별점입력 : <input type="number" max="10"  name="starpoint"><br>
			<input type="submit" value="리뷰작성하기"/>
			
		</form>
	</body>
	<script>
	var msg = "${result}";
	if(msg != ""){
		alert(msg);
	}
	</script>
</html>