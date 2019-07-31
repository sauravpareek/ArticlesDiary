<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" /></script>
	<script type="text/javascript">
        $(document).ready(function () {
            $('.form_validation').validate();
        });
    </script>
    
</head>
<body>
<h2>Hello World!</h2>
<%@ include file="validation.jsp" %>
    <form class="form_validation">
    	<!-- single rule -->
        	<input name="name" type="text" data-rules="First Name-required"/>
        <!-- multi-rules -->
        	<input name="email" type="text" data-rules="Email Address-required" />
        <input type="submit" value="Submit"  />
    </form>
</body>
</html>
