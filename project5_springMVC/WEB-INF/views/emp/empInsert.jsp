<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Insert title here</title>



<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

#container {
	border: 1px solid gray;
	width: 80%;
	margin: 0 auto;
	font-family: 'Hanna', sans-serif;
}

h1 {
	text-align: center;
}

fieldset{
	margin: 20px;
	border: 5px dotted green;
	padding: 6px;
	background: url("../html5-css3-master/07/images/bg1.png");
	background-size: contain;
	
}

legend{
	text-align: center;
}

</style>
</head>

<body>
<%@ include file="../auth/logout.jsp" %>
	<div id="container">
		<h1>직원등록</h1>
		<form action="empInsert.do" method="post" enctype="multipart/form-data">
		<input type="file" name="uploadFile">
			<fieldset>
				<legend>직원의 기본사항</legend>
				1.employee_id: <input type="number" name="employee_id" required><br> 
				2.first_name: <input type="text" name="first_name"><br>
				3.last_name: <input type="text" name="last_name" required><br>
			</fieldset>
			<fieldset>
				<legend>직원의 추가정보</legend>
				4.email: <input type="text" name="email" required><br>
				5.phone_number: <input type="tel" name="phone_number" pattern="[0-9]{3}.[0-9]{3}.[0-9]{4}" required><br>
				6.hire_date: <input type="date" name="hire_date" required><br>
				7.job_id: <select name="job_id">
				<c:forEach items="${jlist}" var="job">
					<option value="${job.job_id}">
						${job.job_title}
					</option>
				</c:forEach>
				</select><br> 
				8.salary: <input type="number" name="salary"><br>
				9.commission_pct: <input type="number" step="0.01" name="commission_pct"><br> 
				10.manager_id: 
				<select name="manager_id" >
					<option value="0">매니저없음</option>
				<c:forEach items="${mlist}" var="manager">
					<option value="${manager.employee_id}">
					${manager.first_name},${manager.last_name}
					</option>
				</c:forEach>
			</select>
				<br> 
				11.department_id: <select name="department_id">
					<option value="0">부서없음</option>
					<c:forEach items="${dlist}" var="dept">
					<option value="${dept.department_id}">
					${dept.department_name}
					</option>
				</c:forEach>
				</select><br>
			</fieldset>
			<input class="btn btn-success" type="submit" value="등록하기">
			<input type="reset" class="btn btn-success">
		</form>
	</div>
</body>

</html>