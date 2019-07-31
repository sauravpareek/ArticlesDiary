<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>INDEX</title>
<head>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://jqueryvalidation.org/files/demo/site-demos.css">


</head>
<body>
	<%@include file="js1.jsp"%>

	<div class="container-fluid">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">ARTICLES DIARY</a>
				</div>
				<ul class="nav navbar-nav">
				</ul>
			</div>
		</nav>

		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Sign In</div>
					<div
						style="float: right; font-size: 80%; position: relative; top: -10px">
						 <!-- <a href="#">Forgot password?</a> -->
					</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<div style="display: none" id="login-alert"
						class="alert alert-danger col-sm-12"></div>

					<form id="loginform" method="post" class="form-horizontal" role="form">

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span>
								 <input id="email2" type="email" class="form-control" name="email" value=""
								placeholder="Registered Email">
						</div>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input id="password1"
								type="password" class="form-control" name="password"
								placeholder="password">
						</div>

						<!--  <div class="input-group">
                                      <div class="checkbox">
                                        <label>
                                          <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                                        </label>
                                      </div>
                                    </div>
 -->

						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-12 controls">
								<button id="btn-signup" type="submit" class="btn btn-success" >SUBMIT</button>
							</div>
						</div>
						<div style="color:red;" >${error }</div>

						<div class="form-group">
							<div class="col-md-12 control">
								<div
									style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
									Don't have an account! <a href="#"
										onClick="$('#loginbox').hide(); $('#signupbox').show()">
										Sign Up Here </a>
								</div>
							</div>
						</div>
					</form>



				</div>
			</div>
		</div>
		<div id="signupbox" style="display: none; margin-top: 50px"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Sign Up</div>
					<div
						style="float: right; font-size: 85%; position: relative; top: -10px">
						<a id="signinlink" href="#"
							onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign
							In</a>
					</div>
				</div>
				<div class="panel-body">
				<c:url var="addAction" value="newlogin.html" />
					<form id="signupform" class="form-horizontal" method="post" action="${addAction }" >

						<div id="signupalert" style="display: none"
							class="alert alert-danger">
							<p>Error:</p>
							<span></span>
						</div>
						
						<div class="form-group">
							<label for="email" class="col-md-3 control-label">Email</label>
							<div class="col-md-9">
								<input type="email" class="form-control" name="email1"
									placeholder="Email Address">
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="col-md-3 control-label">Password</label>
							<div class="col-md-9">
								<input type="password" id="passwd" class="form-control" name="passwd"
									placeholder="Password">
		
							</div>
						</div>

						<div class="form-group">
							<label for="icode"  class="col-md-3 control-label">Confirm
								Password</label>
							<div class="col-md-9">
								<input type="password" id="confpasswd" class="form-control" name="confpasswd"
									placeholder="Confirm Password">
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-offset-3 col-md-9">
								<input type="submit" value="SIGNUP" style="margin-left:100px;" class="btn btn-success">
							</div>
						</div>

						<div style="border-top: 1px solid #999; padding-top: 20px"
							class="form-group"></div>
					</form>
					<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
					<script
						src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
					<script
						src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
					<script>
 $("#signupform").validate({
	  rules: {
	     passwd: {
	      required: true,
	      minlength: 10
	    }, 
	    email1:{
	    	required:true
	    	
	    },
	    confpasswd:{
	    	equalTo:"#passwd"
	    }
	  },
	  messages: {
	     passwd: {
	      required: "Choose a Strong Password",
	      minlength: jQuery.validator.format("At least {0} characters required!")
	     } 
	  }
	});
</script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>