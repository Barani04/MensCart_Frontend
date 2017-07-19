<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="resources/js/validate.js"></script>
<div style="margin-top: 100px;" class="container">
	<c:if test="${!flag}">
		<form action="addAddress" method="post" class="form-horizontal"
			onsubmit="return formShiping()">
	</c:if>
	<c:if test="${flag}">
		<form action="updateAdd" method="post" class="form-horizontal"
			onsubmit="return formShiping()">
	</c:if>
	<div style="margin-top: 50px;" class="mainbox col-xs-6 col-xs-offset-3">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div style="font-size: 25px;" class="panel-title">Shipping
					Address</div>
			</div>

			<div style="padding-top: 30px" class="panel-body">

				<div style="display: none" id="login-alert"
					class="alert alert-danger col-sm-12"></div>
				<c:if test="${flag }">
					<div class="form-group">
						<label class="col-xs-3 control-label">ShipId</label>
						<div class="col-xs-9">
							<input type="text" class="form-control"
								value="${ship.shipmentId}" name="shipmentId" readonly="readonly">
						</div>
					</div>
				</c:if>
				<div class="form-group">
					<label class="col-xs-3 control-label">Name</label>
					<div class="col-xs-9">
						<input type="text" class="form-control" id="userName"
							value="${ship.userName}" name="userName" placeholder="Enter Name"
							autofocus>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 control-label">ContactNo</label>
					<div class="col-xs-9">
						<input type="text" class="form-control" id="contactNo"
							value="${ship.contactNo }" name="contactNo"
							placeholder="Enter phoneNumber">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 control-label">Address</label>
					<div class="col-xs-9">
						<input type="address" id="address" class="form-control"
							value="${ship.address }" name="address"
							placeholder="Enter Address">
					</div>
				</div>
				<c:if test="${!flag}">
					<div class="form-group">
						<!-- Button -->
						<div class="col-xs-offset-5 col-xs-2 col-xs-offset-5">
							<button type="submit" class="btn btn-info">Add Address</button>
						</div>
					</div>
				</c:if>
				<c:if test="${flag}">
					<div class="form-group">
						<!-- Button -->
						<div class="col-xs-offset-5 col-xs-2 col-xs-offset-5">
							<button type="submit" class="btn btn-info">Update
								Address</button>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	</form>
</div>