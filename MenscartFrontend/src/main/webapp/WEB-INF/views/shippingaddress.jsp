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
		<form action="newAddress" method="post"
			class="form-horizontal">
			<div style="margin-top: 50px;"
				class="mainbox col-xs-6 col-xs-offset-3">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div style="font-size: 25px;" class="panel-title">Shipping Address</div>
					</div>

					<div style="padding-top: 30px" class="panel-body">

						<div style="display: none" id="login-alert"
							class="alert alert-danger col-sm-12"></div>

						<div class="form-group">
							<label class="col-xs-3 control-label">Name</label>
							<div class="col-xs-9">
								<input type="text" class="form-control" 
									name="userName" placeholder="Enter Name" autofocus>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">ContactNo</label>
							<div class="col-xs-9">
								<input type="text" class="form-control" 
									name="contactNo" placeholder="Enter phoneNumber">
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">EmailId</label>
							<div class="col-xs-9">
								<input type="address" class="form-control" 
									name="address" placeholder="Enter Address">
							</div>
						</div>
						<div class="form-group">
							<!-- Button -->
							<div class="col-xs-offset-5 col-xs-2 col-xs-offset-5">
								<button type="submit" class="btn btn-info">Add Address</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>