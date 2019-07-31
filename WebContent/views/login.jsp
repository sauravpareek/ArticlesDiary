<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
<title>Login</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<script type="text/javascript">
        $(document).ready(function () {
            $('.form_validation').validate();
        });
    </script>



</head>


<style>
.error
{
	color:red;
}
.col-md-4{
margin-top:100px;
 background-color: #f8f8f8;
 height:300px;
}

</style>

<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Articles Diary</a>
    </div>
  </div>
</nav>

	<div class="container">
	<div class="row">
	<div class="col-md-4">
	<h1 style="text-align:center;">Admin Login</h1>
	
	<form id="adminform" action="adminLogin.html" method="POST">

		<div align="center">
			<table style="margin-top:10px;">
				<tr>
					<td> <label for="admin">Admin :</label></td>
					<td><input type="text" class="form-control" id="admin" name="admin" /></td>
					
				</tr>
				<tr>
					<td><label for="password">Password :</label></td>
					<td><input type="password" class="form-control" id="pass" name="password" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" style="margin-left:30px" class="btn btn-primary" value="Submit" /></td>
				</tr>
			</table>
			
			<div style="color: red">${msg1}</div>

		</div>
	</form>
	</div>
	<div class="col-md-4">
	<h1 style="text-align:center;">Login</h1>
	<form:form name="submitForm" id="userform" method="post">

		<div align="center">
			<table>
				<tr>
					<td><label for="email">Email:</label></td>
					<td><input type="email" class="form-control" id="usemail" name="email" /></td>
				</tr>
				<tr>
					<td><label for="password">Password:</label></td>
					<td><input type="password" class="form-control" id="uspass" name="password" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" style="margin-left:60px;" class="btn btn-primary" value="Submit" /></td>
				</tr>
			</table>
			
			<div style="color: red;margin-left:30px;">${msg}</div>

		</div>
	</form:form>
	</div>
	<div class="col-md-4">
	<h1 style="text-align:center;">Create Account</h1>
	
	<c:url var="addAction" value="newlogin.html" />
	
	<form id="myform" method="post" action="${addAction }">
	<table>
	<tr>
	<td>
	<label>User Name:</label>
	</td>
	<td>
	<input type="text" class="form-control" name="username" id="username" />
	</td>
	</tr>
	<tr>
	<td>
	<label>Email:</label>
	</td>
	<td>
	<input type="email" class="form-control" name="email" id="email" />
	</td>
	</tr>
	<tr>
<td><label for="password">Password:</label></td>

<td><input type="password" id="password" class="form-control" name="password" /></td>
</tr>
<tr><td><label for="password_again">Pass Again:</label></td>
<td><input class="left form-control" type="password" id="password_again"  name="password_again" /></td>
</tr>
<tr>
<td>
<!-- <p id="form_note">Password Must Be At Least 8 Digits Long And Contains One UpperCase, One LowerCase And One Special Character</p> -->
</td>
<td><input style="margin-left:30px;" class="btn btn-primary" type="submit" value="submit" /></td>
</tr>
</table>
</form>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script>
$( "#myform" ).validate({
  rules: {
    password: "required",
    password_again: {
      equalTo: "#password"
    },
    username: "required",
    email: "required",
  }
});
$( "#adminform" ).validate({
	  rules: {
	    admin: "required",
	    password: "required"
	  }
	});
$( "#userform" ).validate({
	  rules: {
	    email: "required",
	    password: "required",
	  }
	});
</script>
	</div>
	<div class="col-md-1">
	</div>
	</div>
	</div>

	
</body>
</html>