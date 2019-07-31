<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Article list</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

	<form method="POST" action="searchlist.html">
		<table style="margin-top:50px;" class="table table-dark table-hover">
			<tr>
				<td><select name="mode" style="padding:7px;border-radius:5px;" >
						<!-- <option value="title">--Select--</option> -->
						<option value="both">Title or Article</option>
						<option value="title">Title</option>
						<option value="article">Article</option>
						<option value="category">Category</option>
				</select></td>
				<td><input class="form-control" name="searchtext" /></td>
				<td colspan="2"><input type="submit" class="btn btn-primary" value="Search Article" /></td>
			</tr>
		</table>
	</form>

</body>
</html>
