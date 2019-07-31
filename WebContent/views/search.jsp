<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
<title>Search Article</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>
<%@ include file="header1.jsp"%>

<div class="container">
<div class="row">
<div class="col-md-12">

	<%@ include file="searchPage.jsp"%>


<h2 style="font-style:italic;margin-top:50px;">List Article</h2>
	<c:if test="${empty articles}">
<div class="card" style="margin-top:50px;">
  			<div class="card-body">
    			<strong>You can search Articles here..</strong><br>
    			The Articles can be searched on basis of 
    			Title or Article or category name...
    			
    			  			</div>
		</div>
</c:if>
	
	
	
	<c:if test="${!empty articles}">
		
		<table class="table table-dark table-hover" border="1">
		<thead>
			<tr>
				<th>Article ID</th>
				<th>Date</th>
				<th>Category</th>
				<th>Title</th>
				<th>Actions on Row</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${articles}" var="article">
				<tr>
					<td><c:out value="${article.id}" /></td>
					<td><c:out value="${article.date}" /></td>
					<td><c:out value="${article.catname}" /></td>
					<td><c:out value="${article.title}" /></td>
					<td align="center"><a class="btn btn-outline-info" href="edit.html?id=${article.id}">Edit</a>
					<a class="btn btn-outline-primary"	href="view.html?id=${article.id}">View</a></td>
				</tr>

			</c:forEach>
			</tbody>
		</table>
	</c:if>
</div>
</div>
</div>
</body>
</html>