<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Book Club</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	
	<jsp:include page="header.jsp" />
	
	<div class="pt-5">
		<div class="container pt-5">
			<div class="row">
				<div class="col-8">
					<h3>Welcome <c:out value="${user.name}"></c:out>!</h3>
					<p>Books from everyone's shelves</p>
				</div>
				<div class="col-4">
					<div class="d-flex justify-content-end">
						<a href="/books/new" class="btn btn-primary">
							<span class="d-flex gap-1">
								Add <span class="d-none d-sm-flex">Book</span>
							</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container py-5">
		<div class="d-flex justify-content-center">
			<div class="container">
				<!-- <div class="pt-2 pb-4"><a href="/">Go back</a></div> -->
				
				<!-- <div class="d-flex flex-column justify-content-between align-items-center pb-4">
					<h3 class="text-primary">Welcome!</h3>
					<p>This is your dashboard. Nothing to see here yet.<p>
					<div class="pt-2 pb-4"><a href="/logout" class="btn btn-danger">Logout</a></div>
				</div> -->
				
				<c:if test="${fn:length(books) > 0}">
					<div class="table-responsive">
						<table class="table table-hover">
						  <thead>
						    <tr>
						      <th scope="col">Id</th>
						      <th scope="col">Title</th>
						      <th scope="col">Author Name</th>
						      <th scope="col">Posted By</th>
						    </tr>
						  </thead>
						  <tbody>
							  <c:forEach var="book" items="${books}">
								<tr>
							      <th scope="row">${book.id}</th>
							      <td><a href="/books/${book.id}">${book.title}</a></td>
							      <td>${book.author}</td>
							      <td>${book.user.name}</td>
							      <!-- <td><a href="/dojos/${dojo.id}">See students</a></td> -->
							    </tr>
							</c:forEach>
						  </tbody>
						</table>
					</div>
				</c:if>
				
				<c:if test="${fn:length(books) == 0}">
					<div class="card">
						<div class="card-body">
							<p class="text-center">Oh no, there are no books 😢</p>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- Javascript Local -->
	<!-- <script src="/js/validateHelper.js"></script> -->
	<!-- <script src="/js/validateForm.js"></script> -->
</body>
</html>