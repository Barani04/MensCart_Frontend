<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="resources/js/validate.js"></script>
<style type="text/css">
body {
	padding-top: 70px;
}
</style>
<div class="container">
	<c:if test="${not empty error}">
		<div
			class="col-lg-12 alert alert-danger alert-dismissable text-center">
			<b>${error}</b>
		</div>
	</c:if>
	<c:if test="${not empty logout}">
		<div class="col-lg-12 alert alert-success text-center">
			<b>${logout}</b>
		</div>
	</c:if>
	<form action="perform_login" method="post" class="form-horizontal">
		<div style="margin-top: 50px;"
			class="mainbox col-xs-6 col-xs-offset-3">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div style="font-size: 25px;" class="panel-title">Sign In</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<div style="display: none" id="login-alert"
						class="alert alert-danger col-sm-12"></div>

					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input id="userName"
							type="text" class="form-control" name="userName" value=""
							placeholder="username or email" autofocus>
					</div>

					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-lock"></i></span> <input id="password"
							type="password" class="form-control" name="password"
							placeholder="password">
					</div>

					<div class="form-group">
						<!-- Button -->
						<div class="col-xs-offset-5 col-xs-2 col-xs-offset-5">
							<button type="submit" class="btn btn-info">
								<span class="icon-hand-right"></span> Log In
							</button>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12 control">
							<div
								style="margin-top: 5px; height border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
								Don't have an account! <a href="signup"> Sign Up Here </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	var $alert = $('.alert');
	if ($alert.length) {
		setTimeout(function() {
			$alert.fadeOut('slow');
		}, 4000)
	}
</script>