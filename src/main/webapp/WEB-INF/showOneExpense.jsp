<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<table class="table table-striped">
   			<tr>
   				<th> ID </th>
   				<th> Expense </th>
   				<th> Vendor </th>
   				<th> Amount </th>
   			</tr>			
				<tr>
					<td>${expense.id }</td>
					<td>${expense.name }</td>
					<td>${expense.vendor} </td>
					<td>${expense.amount }</td>
				</tr>
		</table>	
	<a href="/expense/${expense.id}/edit" class="btn btn-success"> Edit </a>
	
	<form action="/expense/${expense.id}/delete" method="post">
		<input type="hidden" name="_method" value="delete" />
		<button class="btn btn-danger"> Delete</button>
	</form>
	
	</div>
</body>
</html>