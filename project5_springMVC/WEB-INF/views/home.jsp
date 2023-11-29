<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=utf-8"%>
<html>
<head>
	<title>Home</title>
	<meta charset="utf-8">
</head>
<body>
<h1>
	Hello world!  
</h1>
<img alt="" src="image/mymelody.jpg" width="200" height="150">
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<form action="${path}/day1/hello3" method="post">
<input type="text" name="userid" value="yen">
<input type="submit" value="서버전송">

</form>
<hr>
<h1>요청문서 파라메터 연습</h1>
<form action="${path}/day1/hello6">
아이디: <input type="text" name="userid" value="good">
비밀번호: <input type="password" name="userpass" value="1234">
이메일: <input type="text" name="email2" value="aa@naver.com">
<input type="submit" value="서버전송"> 
</form>
<hr>
<h1>파라메터 전달하기</h1>
<form action="${path}/custInfo">
custid: <input type="text" name="custid" value="good">
custname: <input type="text" name="custname" value="goodname">
<input type="submit" value="서버전송"> 
</form>


<c:forEach begin="1" end="10" step="1" var="su">
	<p>su는 ${su }</p>
</c:forEach>
<P>  The time on the server is ${serverTime}. </P>
<p> 나의 이름은 ${myname} </p>

</body>
</html>
