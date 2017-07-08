<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Bellefair"
	rel="stylesheet">

<title>FashionFactory-${title}</title>
<script>
	window.menu = '${title}'
</script>

<style type="text/css">
li a {
	height: 50px;
}

nav {
	background-color: #94f9bc !important;
	color: #f7f7f7 !important;
	font-family: 'Bellefair', serif;
	border-color: #07eaf5 !important;
}

nav .active>a {
	background-color: #85d8a2 !important;
	color: #f7f7f7 !important;
}

nav a:hover {
	background-color: #87e8a9 !important;
	color: #2d2b2b !important;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home" id="home">FashionFactory</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				<li id="About"><a href="About">About</a></li>

				<li id="Contact"><a href="Contact">Contact</a></li>
				<c:if test="${adminLoggedIn}">
					<li id="Product"><a href="Product">Product</a></li>
					<li id="Category"><a href="Category">Category</a></li>
					<li id="Supplier"><a href="Supplier">Supplier</a></li>
				</c:if>
				<c:if test="${userLoggedIn}">
					<li id="History"><a href="#">History</a></li>
						
				</c:if>
				
			</ul>
			<ul class="nav navbar-right navbar-nav">
				<c:if test="${username != null}">
					<li><a>Welcome! ${username}</a></li>
						<li style="font-family: 'Bellefair', serif;" class="pull-right"
						id="login"><a href="logout"> <span
						class="glyphicon glyphicon-log-out"></span> LogOut
					</a></li>
				</c:if>
				<c:if test="${userLoggedIn}">
					<li><a href="myCart"><span
								class="fa fa-shopping-cart fa-lg " aria-hidden="true"></span>Cart</a></li>
				</c:if>
				<c:if test="${username == null}">
					<li style="font-family: 'Bellefair', serif;" class="pull-right"
					id="login"><a href="login"> <span
						class="glyphicon glyphicon-log-in"></span> LogIn
					</a></li>
					<li style="font-family: 'Bellefair', serif;" id="login"><a
						href="signup"> <span class="glyphicon glyphicon-user"></span>
						Signup</a>
					</li>
					</c:if>
			</ul>



			<%-- <c:choose>
				<c:when test="${adminLoggedIn}">
					<ul class="nav navbar-nav">

						<li id="Product"><a href="Product">Product</a></li>
						<li id="Category"><a href="Category">Category</a></li>
						<li id="Supplier"><a href="Supplier">Supplier</a></li>

						<li><a>Welcome! ${username}</a></li>
						<li
							style="font-family: 'Bellefair', serif; float: right; position: relative;"
							class="pull-right"><a href="logout"><span
								class="glyphicon glyphicon-log-out"></span>Log Out</a></li>
					</ul>
				</c:when>
				<c:when test="${userLoggedIn}">
					<ul class="nav navbar-nav">

						<li id="About"><a href="About">About</a></li>

						<li id="Contact"><a href="Contact">Contact</a></li>

						<li id="History"><a href="#">History</a></li>
						<li class="navbar-right"><a href="Cart"><span
								class="fa fa-shopping-cart fa-lg"></span>Cart</a></li>
					</ul>
					<li><a>Welcome! ${username}</a></li>
					<ul class="navbar-right">
						<li
							style="font-family: 'Bellefair', serif; float: right; position: relative;"
							class="navbar-right" id="login"><a href="logout"> <span
								class="glyphicon glyphicon-log-out"></span> LogOut
						</a></li>
					</ul>
				</c:when>
			</c:choose> --%>




		</div>
	</div>
	</nav>
</body>
</html>