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
<style type="text/css">
body{padding-top: 70px;}
</style>
</head>
<body>
	<div class="container">
		<form action="perform_login" method="post"class="form-horizontal">
			<div style="margin-top: 50px;"
				class="mainbox col-xs-6 col-xs-offset-3">
				<div class="panel panel-info">
					<div  class="panel-heading">
						<div style="font-size: 25px;" class="panel-title">Sign In</div>
						<div
							style="float: right; font-size: 80%; position: relative; top: -10px">
							<a href="#">Forgot password?</a>
						</div>
					</div>

					<div style="padding-top: 30px" class="panel-body">

						<div style="display: none" id="login-alert"
							class="alert alert-danger col-sm-12"></div>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input id="login-username"
								type="text" class="form-control" name="userName" value=""
								placeholder="username or email" autofocus>
						</div>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input id="login-password"
								type="password" class="form-control" name="password"
								placeholder="password">
						</div>



						<div class="input-group">
							<div class="checkbox">
								<label> <input id="login-remember" type="checkbox"
									name="remember" value="1"> Remember me
								</label>
							</div>
						</div>


						<div class="form-group">
							<!-- Button -->
							<div class="col-xs-offset-5 col-xs-2 col-xs-offset-5">
								<button  type="submit" class="btn btn-info">
									<span class="icon-hand-right"></span> Log In
								</button>
							</div>
						</div>


						<div class="form-group">
							<div class="col-xs-12 control">
								<div style="margin-top: 5px; height border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
									Don't have an account! <a href="signup"> Sign Up Here </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>