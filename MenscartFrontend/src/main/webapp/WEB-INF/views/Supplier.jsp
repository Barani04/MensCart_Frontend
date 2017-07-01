<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<title>FashionFactory-${title}</title>
<style type="text/css">
html, body {
	background: url(resources/img/viewbac.jpg) !important;
	padding: 0px;
}
body{padding-top: 70px;}
	.custab {
	border: 1px solid #ccc;
	padding: 5px;
	margin: 5% 0;
	box-shadow: 3px 3px 2px #ccc;
	transition: 0.5s;
}

.custab:hover {
	box-shadow: 3px 3px 0px transparent;
	transition: 0.5s;
}

</style>
</head>
<body>
	<div class="container">
		
		<c:if test="${flag}">
			<form action="updatesupp" method="post" class="form-horizontal">
		</c:if>
		<c:if test="${!flag}">
			<form action="addsupp" method="post" class="form-horizontal">
		</c:if>
			<div style="margin-top: 50px;"
				class="mainbox col-xs-6 col-xs-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div style="font-size: 25px; text-align: center;"
							class="panel-title">Supplier Details</div>
					</div>
					<div style="padding-top: 30px" class="panel-body">

						<c:if test="${flag}">
							<!--Form-group -->
							<div class="form-group">
								<label class="col-xs-4 control-label">Supplier Name:</label>
								<div class="col-xs-8">
									<input type="text" name="supplierId"
										value="${supplier.supplierId}" placeholder="Supplier Id"
										class="form-control">
								</div>
							</div>
						</c:if>
						
						<div class="form-group">
								<label class="col-xs-4 control-label">Supplier Name:</label>
								<div class="col-xs-8">
									<input type="text" name="supplierName"
										value="${supplier.supplierName}" placeholder="Supplier Name"
										class="form-control">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-xs-4 control-label">Contact:</label>
								<div class="col-xs-8">
									<input type="text" class="form-control" name="contactNo"
										value="${supplier.contactNo}" placeholder="Contact Number">
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label">Address:</label>
								<div class="col-xs-8">
									<input name="address" type="text" value="${supplier.address}"
										placeholder="Address" class="form-control input-xs">
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-offset-5 col-xs-3 col-xs-offset-7">
									<input type="submit" value="Add Supplier" class="btn btn-info" />
								</div>
							</div>
					</div>
				</div>
			</div>
		</form>
		<!-- TABLE DETAILS -->
		<div class="row col-xs-offset-1 col-xs-10 custyle">
			<table class="table table-striped table-bordered custab">
				<thead style="color: white; font-weight: bold; font-size: 20px; background-color:green;"
					class="table-default active">
					<tr class="text-center">
						<td>S.No</td>
						<td>Supplier Id</td>
						<td>Supplier Name</td>
						<td>Contact Number</td>
						<td>Address</td>
						<td>Update</td>
						<td>Delete</td>
					</tr>
				</thead>
				<tbody style="color: #090df7; font-size: 15px;background-color: #64f153; font-family: serif;">
					<c:forEach items="${supdetail}" var="supplier" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${supplier.supplierId}</td>
							<td>${supplier.supplierName}</td>
							<td>${supplier.contactNo}</td>
							<td>${supplier.address}</td>
							<td class="text-center"><a class='btn btn-warning btn-sm'
								href="getUpdateSupplier?supId=${supplier.supplierId}"><span
									class="glyphicon glyphicon-pencil"></span></a></td>
							<td><a href="deleteSupplier?supId=${supplier.supplierId}"
								class="btn btn-danger btn-sm"><span
									class="glyphicon glyphicon-remove"></span></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>