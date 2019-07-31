<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>



<div class="container">
<div class="row">
<div class="col-md-2">
</div>
<div class="col-md-8">
<div class="card" style="margin-top:50px;">
  			<div class="card-body">
    			<strong>${msg} have been logged Out Please Sign In Again ...</strong>
  				<a href="<%=request.getContextPath()%>/login1.html"><span class="btn btn-primary">Login</span></a>
  			</div>
		</div>
		</div>
		<div class="col-md-2">
		</div>
		</div>
		</div>


</body>
</html>