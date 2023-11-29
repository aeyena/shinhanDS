<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../auth/logout.jsp" %>
	<h1>부서입력</h1>
	<!-- ${dept.department_id}==((DeptVO)request.getAttribute("dept")).getdepartment_id() -->
	<form action="${appPath}/dept/deptInsert.do" method="post">
		부서번호: <input type="number" name="department_id"><br>
		부서이름: <input type="text" name="department_name"><br>
		매니저번호: 
		<select name="manager_id" class="form-select">
			<c:forEach items="${mlist}" var="emp">
				<option ${dept.manager_id == emp.employee_id?"selected":"" } value="${emp.employee_id}">
					${emp.first_name},${emp.last_name} 
				</option>
			</c:forEach>		
			</select><br>
		지역번호: <input type="number" name="location_id"><br>
		<input type="submit" value="부서정보입력">
	</form>
</body>
</html>