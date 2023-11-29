<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- bootstrap : 세계적으로 가장 유명한 css framework -->
	<!-- CDN(Content Delivery Network) -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<style>
	  @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	  #container{
	     border : 1px solid gray;
	     width : 80%;
	     margin: 0 auto;
	     background: url("../html5-css3-master/07/images/bg1.png");
	     background-repeat: repeat-x;
	     background-position: bottom;
	     font-family: 'Jeju Gothic', sans-serif;
	  }
	  h1 { text-align: center;}
	  input:focus { background-color: yellow;}
	   
	fieldset {
	  /* top right bottom left   */
	  margin: 20px;
	  border : 5px dotted green;
	  padding: 6px;
	}
	
	
	</style>
</head>

<body>
    <div id="container">
    <%@ include file="../auth/logout.jsp" %>
	<h1>~상세보기~</h1>
	<form name="empform" action="${appPath}/emp/empDetail.do" method="post">
	<c:if test="${emp.pic!=null}">
		<img src="${appPath}/uploads/${emp.pic}" width="200" height="200">
	</c:if>
	
		<fieldset>
			<legend>직원의 기본사항</legend>
			1.EMPLOYEE_ID: 
			<input name="employee_id" type="number" 
			value="${emp.employee_id}"
			 autofocus /> <br><br>
			2.FIRST_NAME: 
			<input name="first_name" type="text" 
			value="${emp.first_name}" /> <br><br>
			3.LAST_NAME: 
			<input name="last_name" 
			value="${emp.last_name}"
			type="text"   /> <br><br>
		</fieldset>	
		<fieldset>
			<legend>직원의 추가정보</legend>	
			4.EMAIL: 
			<input name="email" type="text" 
			value="${emp.email}" /> <br><br>
			5.PHONE_NUMBER: <input name="phone_number" 
			type="tel" pattern="[0-9]{3}.[0-9]{3}.[0-9]{4}"
			value="${emp.phone_number }" /> <br><br>
			6.HIRE_DATE: 
			<input name="hire_date" 
			type="date"  value="${emp.hire_date}"/> <br><br>
			7.JOB_ID선택: <select name="job_id">
			<c:forEach items="${jlist}" var="job">
				<option ${emp.job_id==job.job_id?"selected":""} value="${job.job_id}">
				${job.job_title}--${job.max_salary}
				</option>
			</c:forEach>
			</select> <br><br>
			8.SALARY: <input name="salary" type="number" 
			value="${emp.salary}" /> 
			<br><br>
			9.COMMISSION_PCT: 
			<input name="commission_pct"
			 type="number" step="0.01" 
			 value="${emp.commission_pct}"
			 /> <br><br>
			10.MANAGER_ID:		
			<select name="manager_id" >
				<c:forEach items="${mlist}" var="manager">
					<option ${emp.manager_id==manager.employee_id?"selected":""} value="${manager.employee_id}">
					${manager.first_name},${manager.last_name}
					</option>
				</c:forEach>
			</select>
			
			
			<br><br>
			11.DEPARTMENT_ID: 
			<select name="department_id">
				<c:forEach items="${dlist}" var="dept">
					<option ${emp.department_id==dept.department_id?"selected":""} value="${dept.department_id}">
					${dept.department_name}
					</option>
				</c:forEach>
			
			</select> <br><br>

			<input class="btn btn-success" type="submit" value="수정하기♥" />
			<input type="reset" class="btn btn-success" value="Reset Button">
		</fieldset>
	</form>
	</div>
</body>

</html>