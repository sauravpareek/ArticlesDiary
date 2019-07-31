<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>View Article</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
#front{
	background-color: #2e3b4f;
    border-radius:10px;
    color:white;
}
</style>
</head>

<body>
	<%@ include file="header1.jsp"%>
	<h1 style="text-align:center;margin-top:50px;">VIEW PAGE</h1>
	<div class="container">
	<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
	<form:form method="POST" action="/edit.html" commandName="article">
	
		<table  style="margin-top:40px;" class="table table-dark table-hover">
			<tr>
				<td><form:label for="category" path="id">Category:</form:label></td>
				<td><form:input path="catname" class="form-control" value="${article.catname}" readonly="true"/></td>
			</tr>
			<tr>
				<td><form:label for="id" path="id">ID:</form:label></td>
				<td><form:input class="form-control" path="id" value="${article.id}" readonly="true" /></td>
				</tr>
				<tr>
				<td><label for="date">Date:</label></td><td><form:input class="form-control" path="date" value="${article.date}" readonly="true"/></td>				
			</tr>

			<tr>
				<td><form:label for="title" path="title">Title:</form:label></td>
				<td><form:input class="form-control" path="title" value="${article.title}" size="50" readonly="true"/></td>
		</tr>
		<tr>		<td> </td>									
				<td><span><a style="margin-left:100px;" href="htmlview.html?id=${article.id}" class="btn btn-outline-primary" target="_blank">View</a></span></td>																
			</tr>
		</table>
		
	</form:form>
	</div>
	<div class="col-md-2">
	</div>
	</div>
	</div>
</body>
</html>
