<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>project</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="container mt-5">
		<table class="table table-striped">
   			<tr>
   				<th> Expense </th>
   				<th> Vendor </th>
   				<th> Amount </th>
   			</tr>			
			<c:forEach var="expense" items="${expenses}"> 
				<tr>
					<td>${expense.name }</td>
					<td>${expense.vendor} </td>
					<td>${expense.amount}</td>
				</tr>
			</c:forEach>
		</table>	
	
	
	</div>
	<div class="container mt-5">
	<form:form action="/expense/create" method="post" modelAttribute="newExpense" class="form">
   		<form:label path="name" class="form-label"> Expense Name </form:label>
   		<form:errors path="name" class="text-danger" />	
   		<form:input path="name" type="text" class="form-control" />
   		

   		<form:label path="vendor" class="form-label">Vendor</form:label>
   		<form:errors path="vendor" class="text-danger" />	
   		<form:input path="vendor" type="text" class="form-control" />
   		
   		
   		<form:label path="amount" class="form-label">Amount</form:label>
   		<form:errors path="amount" class="text-danger" />	
   		<form:textarea path="amount" type="number" class="form-control"></form:textarea>
   		
		<button class="btn btn-primary"> Submit</button>

	</form:form>

</div>
</body>
</html>