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
<title>edit expense</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
	<form:form action="/gifts/${expense.id}/edit" method="post" modelAttribute="expense" class="form">
   		<input type="hidden" name="_method" value="put" />
   		
   		<form:label path="name" class="form-label"> Expense Name </form:label>
   		<form:errors path="name" class="text-danger" />	
   		<form:input path="name" type="text" class="form-control" />
   		

   		<form:label path="vendor" class="form-label">Vendor</form:label>
   		<form:errors path="vendor" class="text-danger" />	
   		<form:input path="vendor" type="text" class="form-control" />
   		
   		
   		<form:label path="amount" class="form-label">Amount</form:label>
   		<form:errors path="amount" class="text-danger" />	
   		<form:textarea path="amount" class="form-control"></form:textarea>
   		
		<button class="btn btn-primary"> Submit</button>

	</form:form>

</div>
</body>
</html>