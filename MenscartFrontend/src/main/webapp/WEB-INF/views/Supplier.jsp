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
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div style="font-size: 25px; text-align: center;"
						class="panel-title">Supplier Details</div>
				</div>
				<div style="padding-top: 30px" class="panel-body">
					<div style="display: none" id="login-alert"
						class="alert alert-danger col-sm-12"></div>
					<form id="loginform" class="form-horizontal" role="form">

						<!--Form-group -->
						<div class="form-group">
							<label for="supname" class="col-md-4 control-label">Supplier
								Name:</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="supname"
									placeholder="Supplier Name">
							</div>
						</div>

						<div class="form-group">
							<label for="supcontact" class="col-md-4 control-label">Contact:</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="supname"
									placeholder="Contact Number">
							</div>
						</div>

						<div class="form-group">
							<label for="supaddrress" class="col-md-4 control-label">Address:</label>
							<div class="col-md-8">
								<textarea class="form-control fixed"></textarea>
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-offset-5 col-md-3 col-md-offset-7">
								<button id="btn-signup" type="submit" class="btn btn-info">
									<i class="icon-hand-right"></i>Add Supplier
								</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>