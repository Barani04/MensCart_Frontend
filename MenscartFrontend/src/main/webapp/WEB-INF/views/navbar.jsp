<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Bellefair" rel="stylesheet">

<title>FashionFactory-${title}</title>
<script>
	window.menu='${title}'
</script>

 <style type="text/css">
li a{height:50px;}
nav {
background-color: #94f9bc !important; 
color: #f7f7f7 !important;
font-family: 'Bellefair', serif;
font-weight:bold;
border-color: #07eaf5 !important;
}

nav .active>a{
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
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="home" id="home">FashionFactory</a>
            </div>
            
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                   
                   <li id="About">
						<a  href="About">About</a>
					</li>
					
					<li id="Contact">
						<a  href="Contact">Contact</a>
					</li>
                   
					<li id="Product">
						<a  href="Product">Product</a>
					</li>
					<li id="Category">
						<a  href="Category">Category</a>
					</li>
					<li id="Supplier">
						<a  href="Supplier">Supplier</a>
					</li>
                </ul>
                <ul style="font-family: 'Bellefair', serif;" class="nav navbar-nav navbar-right">
						<li class="pull-right" id="login">
							<a href="login"><span class="glyphicon glyphicon-log-in"></span> LogIn</a>
						</li>
						<li class="pull-right" id="signup">
							<a href="signup"><span class="glyphicon glyphicon-user"></span> SignUp</a>
						</li>
					</ul>
            </div>
        </div>
    </nav>
</body>
</html>