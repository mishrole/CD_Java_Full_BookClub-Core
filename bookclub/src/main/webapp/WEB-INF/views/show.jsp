<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
					<div class="card-header">
						<div class="d-flex justify-content-between">
							<h3><c:out value="${book.title}"></c:out></h3>
							<c:if test="${user.id == book.user.id}">
							<a href="/books/${book.id}/edit" class="btn btn-primary">Edit</a>
							</c:if>
						</div>
					</div>
					<div class="card-body">
						<p>
						<span class="fw-bold">
						<c:choose>
							<c:when test="${user.id == book.user.id}">
								You
							</c:when>
							
							<c:otherwise>
								<c:out value="${book.user.name}"></c:out>
							</c:otherwise>
						</c:choose>
						</span>
						 read 
						<span class="fw-bold"><c:out value="${book.title}"></c:out></span>
						 by
						<span class="fw-bold"><c:out value="${book.author}"></c:out></span>
						</p>
						
						<div class="py-2">
							<p>Here are 
							<c:choose>
								<c:when test="${user.id == book.user.id}">
									your
								</c:when>
								
								<c:otherwise>
									<c:out value="${book.user.name}"></c:out>
								</c:otherwise>
							</c:choose>
							 thoughts:</p>
							<hr />
						</div>
						
						<p><c:out value="${book.thoughts}"></c:out></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--Bootstrap -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>