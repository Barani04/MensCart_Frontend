<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="newUser" onsubmit="return formsignup()"class="form-horizontal">
			<div style="margin-top: 50px;"
				class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title">Sign Up</div>
						<div
							style="float: right; font-size: 80%; position: relative; top: -10px">
							Already have an Account? <a href="login"> SignIn</a>
						</div>
					</div>

					<div style="padding-top: 30px" class="panel-body">

						<div style="display: none" id="login-alert"
							class="alert alert-danger col-sm-12"></div>

						<div class="form-group">
							<label for="email" class="col-md-3 control-label">UserName</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="userName"
									placeholder="User Name">
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="col-md-3 control-label">Email</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="emailId"
									placeholder="Email Address">
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-md-3 control-label">First
								Name</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="firstName"
									placeholder="First Name">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-md-3 control-label">Last
								Name</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="lastName"
									placeholder="Last Name">
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="col-md-3 control-label">Contact</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="contactNo"
									placeholder="Mobie Number">
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="col-md-3 control-label">Address</label>
							<div class="col-md-6">
								<input id="description" name="address" type="text" placeholder="Descripton" class="form-control input-md" >
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-md-3 control-label">Password</label>
							<div class="col-md-9">
								<input type="password" class="form-control" name="password"
									placeholder="Password">
							</div>
						</div>

						<div class="form-group">
							<!-- Button -->
							<div class="col-md-offset-5 col-md-2 col-md-offset-5">
								<button id="btn-signup" type="button" class="btn btn-info">
									<i class="icon-hand-right"></i> Sign Up
								</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>