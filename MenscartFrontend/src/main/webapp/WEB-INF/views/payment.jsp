
<title>Payment</title>
<style type="text/css">
.c1 {
	margin-top: 100px;
}

.panel-title {
	display: inline;
	font-weight: bold;
}

.checkbox.pull-right {
	margin: 0;
}

.pl-ziro {
	padding-left: 0px;
}

#myDIV {
	margin-top: 20px;
	display: none;
}
</style>
<div class="container c1">
	<a href="ThankYou" class="btn btn-success btn-default">Cash On
		Delivery</a> <a onclick="myFunction()" id="app"
		class="btn btn-success btn-default">Card</a>

	<div id="myDIV">
		<div class="row">
			<div class="col-xs-12 col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Payment Details</h3>
					</div>
					<div class="panel-body">
						<form role="form">
							<div class="form-group">
								<label for="cardNumber"> CARD NUMBER</label>
								<div class="input-group">
									<input type="text" class="form-control" id="cardNumber"
										placeholder="Valid Card Number" required autofocus /> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-7 col-md-7">
									<div class="form-group">
										<label for="expityMonth"> EXPIRY DATE</label>
										<div class="col-xs-6 col-lg-6 pl-ziro">
											<input type="text" class="form-control" id="expityMonth"
												placeholder="MM" required />
										</div>
										<div class="col-xs-6 col-lg-6 pl-ziro">
											<input type="text" class="form-control" id="expityYear"
												placeholder="YY" required />
										</div>
									</div>
								</div>
								<div class="col-xs-5 col-md-5 pull-right">
									<div class="form-group">
										<label for="cvCode"> CV CODE</label> <input type="password"
											class="form-control" id="password" placeholder="CCV" required />
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#"><span
							class="badge pull-right"><span class="fa fa-inr"></span>&#8377;${subtotal}</span>
							Final Payment</a></li>
				</ul>
				<br /> <a href="ThankYou" class="btn btn-success btn-lg btn-block"
					role="button">Pay</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	document.getElementById('app').onclick = function() {
		myFunction()
	};
	function myFunction() {
		var x = document.getElementById('myDIV');
		x.style.display = 'block';
	}
</script>
