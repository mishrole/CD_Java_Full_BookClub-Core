<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- PUT -->
<%@ page isErrorPage="true" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Book Club</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>

	<jsp:include page="header.jsp" />
	
	<div class="pt-5">
		<div class="container pt-5">
			<div class="d-flex justify-content-end">
				<a href="/books">Go back</a>
			</div>
		</div>
	</div>
	
	<div class="container py-5">
		<div class="d-flex justify-content-center">
			<div class="container">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center py-2">Change your entry</h3>
						<form:form action="/books/${book.id}" method="POST" id="validate" modelAttribute="book">
						<input type="hidden" name="_method" value="PUT">
							<div class="row mx-auto">
							
								<div class="col-12">
									<div class="form-floating mb-3">
									  <form:input path="title" type="text" class="form-control requires-validation validate-save" name="title" id="title" />
									  <div class="invalid-feedback"></div>
									  <form:errors path="title" class="text-danger backend-validation" />
									  <form:label for="title" path="title">Title</form:label>
									</div>
								</div>
								
								<div class="col-12">
									<div class="form-floating mb-3">
									  <form:input path="author" type="text" class="form-control requires-validation validate-save" name="author" id="author" />
									  <div class="invalid-feedback"></div>
									  <form:errors path="author" class="text-danger backend-validation" />
									  <form:label for="author" path="author">Author</form:label>
									</div>
								</div>
								
								<div class="col-12">
									<div class="form-floating mb-3">
									  <form:textarea path="thoughts" class="form-control requires-validation validate-save" style="height: 200px" name="thoughts" id="thoughts" />
									  <div class="invalid-feedback"></div>
									  <form:errors path="thoughts" class="text-danger backend-validation" />
									  <form:label for="thoughts" path="thoughts">My Thoughts</form:label>
									</div>
								</div>
								
								<div class="col-12">
									<div class="d-flex align-items-center justify-content-end">
										<button class="btn btn-primary" type="submit" value="Submit">Edit</button>
									</div>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- jQuery (No necesario en Bootstrap 5) -->
	<!-- <script src="/webjars/jquery/jquery.min.js"></script> -->
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- Javascript Local -->
	<script src="/js/validateHelper.js"></script>
	<script src="/js/validateBookForm.js"></script>
</body>
</html>