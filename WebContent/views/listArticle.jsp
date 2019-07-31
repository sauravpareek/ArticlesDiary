<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.ParseException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
<title>List Article</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script></head>
<body>
<%@ include file = "adminheader.jsp" %>

<div class="container">
<div class="row">
<div class="col-md-2">
</div>
<div class="col-md-8">
<c:if test="${empty articles}">
<div class="card" style="margin-top:50px;">
  			<div class="card-body">
    			<strong>Welcome to the Admin Page</strong><br>
    			<br><strong>Admin Name:</strong>Saurav<br>
    			<strong>Admin Email :</strong>sauravpareek02@gmail.com<br>
    			If Any Inappropriate content found 
    			Please Click on Above List Article Link and
    			delete those Articles.
  			</div>
		</div>
</c:if>
</div>
</div>
</div>
<div class="col-md-2">
</div>
<c:if test="${!empty articles}">
	<table style="margin-top:100px;" class="table table-dark table-hover" border="1">
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
		<c:set var = "now" value = '<%=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>'/>     
		<c:if test = "${article.date==now}">
			<tr>
				<td><c:out value="${article.id}"/></td>
				<td><c:out value="${article.date}"/></td>
				<td><c:out value="${article.catname}"/></td>
				<td><c:out value="${article.title}"/></td>								
				<td align="center"><a href="delete.html?id=${article.id}" class="btn btn-danger" type="button">Delete</a></td>
			</tr></c:if>														
			<c:if test="${article.date!=now}">			
			<tr>
				<td><c:out value="${article.id}"/></td>
				<td><c:out value="${article.date}"/></td>
				<td><c:out value="${article.catname}"/></td>
				<td><c:out value="${article.title}"/></td>								
				<td align="center"><a href="delete.html?id=${article.id}" class="btn btn-danger" type="button">Delete</a> </td>
			</tr>
			</c:if>			
		</c:forEach>
		</tbody>
	</table>
</c:if> 
</body>
</html>
