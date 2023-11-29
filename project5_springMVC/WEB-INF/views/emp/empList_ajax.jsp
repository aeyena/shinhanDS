<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>

<h1>직원목록</h1>
		<table border="1">
			<thead>
				<tr class="title">
					<th>순서</th>
					<th>직원번호</th>
					<th>firstName</th>
					<th>lastName</th>
					<th>email</th>
					<th>phoneNumber</th>
					<th>salary</th>
					<th>job</th>
					<th>dept</th>
					<th>manager</th>
					<th>commission</th>
					<th>hiredate</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${emplist}" var="emp" varStatus="status">
					<tr seq="${status.count}">
						<td class="aa">${status.count}</td>
						<td><a href="${cpath}/emp/empDetail.do?empid=${emp.employee_id}">
								${emp.employee_id}
						</a></td>
						<td fname="${emp.first_name}">${emp.first_name}</td>
						<td>${emp.last_name}</td>
						<td>${emp.email}</td>
						<td>${emp.phone_number}</td>
						<td>
						<fmt:formatNumber groupingUsed="true" value="${emp.salary}"/>
						</td>
						<td>${fn:toLowerCase(emp.job_id)}</td>
						<td>${emp.department_id}</td>
						<td>${emp.manager_id}</td>
						<td>${emp.commission_pct}</td>
						<td>${emp.hire_date}</td>
						<td><button class="btn btn-info" onclick="location.href='${cpath}/emp/empDelete.do?empid=${emp.employee_id}'">삭제</button>
						<form action="${cpath}/emp/empDelete.do" method="post">
						<input type="hidden" name="empid" value="${emp.employee_id}">
						<input type="submit" value="삭제" class="btn btn-info">
						</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>