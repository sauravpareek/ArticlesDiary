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
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file = "header1.jsp" %>


<div class="container-fluid">
<div class="col-md-1">
</div>

<div class="col-md-10" style="margin-left:80px;margin-top:50px;">
<c:if test="${!empty articles}">
		<h1><strong style="text-align:center;">Published Articles</strong></h1>
	<table style="padding:5px;" class="table table-dark table-hover" border="1">
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
				<td align="center"><a class="btn btn-outline-info" href="edit.html?id=${article.id}">Edit</a>  <a class="btn btn-outline-primary" href="view.html?id=${article.id}">View</a></td>
			</tr></c:if>														
			<c:if test="${article.date!=now}">			
			<tr>
				<td><c:out value="${article.id}"/></td>
				<td><c:out value="${article.date}"/></td>
				<td><c:out value="${article.catname}"/></td>
				<td><c:out value="${article.title}"/></td>								
				<td align="center"><a class="btn btn-outline-info" href="edit.html?id=${article.id}">Edit</a>  <a class="btn btn-outline-primary" href="view.html?id=${article.id}">View</a></td>
			</tr>
			</c:if>			
		</c:forEach>
		</tbody>
	</table>
</c:if> 
</div>
<div class="col-md-1">
</div>
</div>
</body>
</html>
