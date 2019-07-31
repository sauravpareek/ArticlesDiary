<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>Html View for Id: ${article.id}</title>
<meta charset="utf-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
</head>
<body>
<%@ include file="header1.jsp"%>
	<div class="container">
	<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		
		<div class="card" style="margin-top:50px;">
  			<div class="card-body">
    			<strong>TITLE : </strong>${article.title}
  			</div>
		</div>
		
		<div class="card" style="margin-top:80px;">
  			<div class="card-body">
    			<c:out value="${article.articletext}"/>
  			</div>
		</div>
	</div>
	<div class="col-md-2">
	</div>	
	</div>		      		 				
	</div>
</body>
</html>