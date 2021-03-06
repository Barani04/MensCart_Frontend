
<script src="resources/js/validate.js"></script>
<style type="text/css">
body {
	padding-top: 70px;
}
</style>
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
						<label for="firstname" class="col-xs-3 control-label">First
							Name</label>
						<div class="col-xs-9">
							<input type="text" class="form-control" id="firstName"
								name="firstName" placeholder="First Name" autofocus>
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-xs-3 control-label">Last
							Name</label>
						<div class="col-xs-9">
							<input type="text" class="form-control" id="lastName"
								name="lastName" placeholder="Last Name">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">UserName</label>
						<div class="col-xs-9">
							<input type="text" class="form-control" id="userName"
								name="userName" placeholder="User Name">
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="col-xs-3 control-label">Email</label>
						<div class="col-xs-9">
							<input type="text" class="form-control" id="emailId"
								name="emailId" placeholder="Email Address">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-xs-3 control-label">Password</label>
						<div class="col-xs-9">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="Password">
						</div>
					</div>


					<div class="form-group">
						<label for="email" class="col-xs-3 control-label">Contact</label>
						<div class="col-xs-9">
							<input type="text" class="form-control" id="contactNo"
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