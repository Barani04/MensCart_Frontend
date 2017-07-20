<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
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
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<security:authorize access="isAnonymous() ">
				<a class="navbar-brand" href="home" id="home">FashionFactory</a>
			</security:authorize>
			<security:authorize access="hasRole('ROLE_USER')">
				<a class="navbar-brand" href="home" id="home">FashionFactory</a>
			</security:authorize>
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<a class="navbar-brand" href="admin" id="home">FashionFactory</a>
			</security:authorize>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				<li id="About"><a href="About">About</a></li>

				<li id="Contact"><a href="Contact">Contact</a></li>
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li id="Product"><a href="Product">Product</a></li>
					<li id="Category"><a href="Category">Category</a></li>
					<li id="Supplier"><a href="Supplier">Supplier</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_USER')">
					<li id="History"><a href="History">History</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_ADMIN')">
						<li id="cart"><a href="adminCart"><span
								class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>Orders</a>
						</li>
					</security:authorize>


			</ul>
			<ul class="nav navbar-right navbar-nav">
				<security:authorize access="isAnonymous()">
					<li style="font-family: 'Bellefair', serif;" id="login"><a href="login"> <span
							class="glyphicon glyphicon-log-in"></span> LogIn
					</a></li>
					<li style="font-family: 'Bellefair', serif;" id="signup"><a
						href="signup"> <span class="glyphicon glyphicon-user"></span>
							Signup
					</a></li>
				</security:authorize>
				<security:authorize access="isAuthenticated()">
					<li><a>Welcome! ${username}</a></li>
					<li style="font-family: 'Bellefair', serif;" class="pull-right"
						id="login"><a href="logout"> <span
							class="glyphicon glyphicon-log-out"></span> LogOut
					</a></li>
					<security:authorize access="hasRole('ROLE_USER')">
						<li id="cart"><a href="myCart"><span
								class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Cart</a>
						</li>
					</security:authorize>
				</security:authorize>
			</ul>

		</div>
	</div>
</nav>