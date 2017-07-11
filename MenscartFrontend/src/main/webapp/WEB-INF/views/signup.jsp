<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<title></title>
<style type="text/css">
body {
	padding-top: 70px;
}
</style>
<script type="text/javascript">
	function formRegister() {
		// Make quick references to our fields

		var username = document.getElementById('username');
		var email = document.getElementById('email');
		var password = document.getElementById('pass');
		var phone = document.getElementById('contactnumber');
		var address = document.getElementById('address');
		var fname = document.getElementById('fname');
		var lname = document.getElementById('lname');
		// Check each input in the order that it appears in the form!

		if (notEmpty(username, "Username Should not be empty")) {
			if (isAlphanumeric(username,
					"Please enter only Alphanumerics for Username")) {
				if (notEmpty(email, "EmailId Should not be empty")) {
					if (emailValidator(email, "Please Enter a valid Email id")) {
						if (notEmpty(password, "password Should not be empty")) {
							if (isAlphanumeric(password,
									"Numbers and Letters Only for Passwords")) {
								if (notEmpty(phone,
										"PhoneNumber Should not be empty")) {
									if (isNumeric(phone,
											"Please enter only number for PhoneNumber")) {

										if (notEmpty(address,
												"Address Should not be empty")) {
											return true;
										}
									}
								}
							}
						}
					}
				}
			}
		}
		return false;
	}

	function notEmpty(elem, helperMsg) {
		if (elem.value.length == 0) {
			alert(helperMsg);
			elem.focus(); // set the focus to this input
			return false;
		}
		return true;
	}

	function isNumeric(elem, helperMsg) {
		var numericExpression = /^[0-9]+$/;
		if (elem.value.match(numericExpression)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}
	function isAlphabet(elem, helperMsg) {
		var alphaExp = /^[a-z A-Z]+$/;
		if (elem.value.match(alphaExp)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}
	function isAlphanumeric(elem, helperMsg) {
		var alphaExp = /^[0-9a-zA-Z]+$/;
		if (elem.value.match(alphaExp)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}
	function emailValidator(elem, helperMsg) {
		var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
		if (elem.value.match(emailExp)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
	
		<form action="newUser" method="post" onsubmit="return formRegister()"
			class="form-horizontal">
			<div style="margin-top: 50px;"
				class="mainbox col-xs-6 col-xs-offset-3">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div style="font-size: 25px;" class="panel-title">Sign Up</div>
						<div
							style="float: right; font-size: 80%; position: relative; top: -10px">
							Already have an Account? <a href="login"> SignIn</a>
						</div>
					</div>

					<div style="padding-top: 30px" class="panel-body">

						<div style="display: none" id="login-alert"
							class="alert alert-danger col-sm-12"></div>
							
						<div class="form-group">
							<label class="col-xs-3 control-label">UserName</label>
							<div class="col-xs-9">
								<input type="text" class="form-control" id="username"
									name="userName" placeholder="User Name" autofocus>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="col-xs-3 control-label">Email</label>
							<div class="col-xs-9">
								<input type="email" class="form-control" id="email"
									name="emailId" placeholder="Email Address">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-xs-3 control-label">Password</label>
							<div class="col-xs-9">
								<input type="password" class="form-control" id="pass"
									name="password" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-xs-3 control-label">First
								Name</label>
							<div class="col-xs-9">
								<input type="text" class="form-control" id="fname"
									name="firstName" placeholder="First Name">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-xs-3 control-label">Last
								Name</label>
							<div class="col-xs-9">
								<input type="text" class="form-control" id="lname"
									name="lastName" placeholder="Last Name">
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="col-xs-3 control-label">Contact</label>
							<div class="col-xs-9">
								<input type="text" class="form-control" id="contactnumber"
									name="contactNo" placeholder="Mobie Number">
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="col-xs-3 control-label">Address</label>
							<div class="col-xs-9">
								<input id="address" name="address" type="text"
									placeholder="address" class="form-control input-xs">
							</div>
						</div>
						<div class="form-group">
							<!-- Button -->
							<div class="col-xs-offset-5 col-xs-2 col-xs-offset-5">
								<button type="submit" class="btn btn-info">
									<span class="icon-hand-right"></span> Sign Up
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