<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<style>
body {
	margin: 0;
}
ul.topnav {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}
ul.topnav li {
	float: left;
}
ul.topnav li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}
ul.topnav li a:hover:not(.active){background-color:#b0cad9;color:#1703F7; height:48px;}
ul.topnav li a.active {
	background-color: #F9FBFC;
	color: #1703F7;
}
ul.topnav li.right {
	float: right;
}
@media screen and (max-width: 600px) {
	ul.topnav li.right, ul.topnav li {
		float: none;
	}
}
</style>
</head>
<body>
	<ul style="margin-bottom: 2px" class="topnav">
		<li><a class="active " href="home">Home</a></li>
		<li><a  href="Product">Product</a></li>
		<li><a  href="Category">Category</a></li>
		<li><a  href="Supplier">Supplier</a></li>
		
		<!-- <li><a  href="newProduct">NewProduct</a></li> -->
		
		<li class="right"><a href="login"><span class="glyphicon glyphicon-log-in" > LogIn</span></a></li>
		<li class="right"><a href="signup"><span class="glyphicon glyphicon-user"> SignUp</span></a></li>
	</ul>
</body>

</html>