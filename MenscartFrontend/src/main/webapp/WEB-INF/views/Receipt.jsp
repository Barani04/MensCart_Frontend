<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<title>Invoice</title>
</head>
<style type="text/css">
body {
	margin-top: 100px;
}
</style>
<body>

	<div class="container">
		<div class="row">
		
			<div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
						<address>
							<strong>${ship.userName}</strong>
							 <br>
							  <i style="word-wrap: break-word;">Address:${ship.address}</i> 
							  <br>
							 <i>Phone:${ship.contactNo}</i>
						</address>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 text-right">
						<p>
							<em>${date}</em>
						</p>
						<p>
							<em>Receipt #:${rid}</em>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="text-center">
						<h1>Receipt</h1>
					</div>
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Product</th>
								<th>#</th>
								<th class="text-center">Price</th>
								<th class="text-center">Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${kart}" var="cart">
							<tr>
								<td class="col-md-9"><em>${cart.productName}</em></td>
								<td class="col-md-1" style="text-align: center">${cart.qty}</td>
								<td class="col-md-1 text-center">&#8377;${cart.price}</td>
								<td class="col-md-1 text-center">&#8377;${cart.total}</td>
							</tr>
						</c:forEach>
							<tr>
								<td> </td>
								<td> </td>
								<td class="text-right">
									<p>
										<strong>SubTotal: </strong>
									</p>
									<p>
										<strong>DeliverCharge: </strong>
									</p>
								</td>
								<td class="text-right">
									<p>
										<strong>&#8377;${subtotal}</strong>
									</p>
									<p>
										<strong>&#8377;${deliver}</strong>
									</p>
								</td>
							</tr>
							<tr>
								<td> </td>
								<td> </td>
								<td class="text-right"><h4>
										<strong>Total: </strong>
									</h4></td>
								<td class="text-right text-success"><h4>
										<strong>&#8377;${subtotal + deliver}</strong>
									</h4></td>
							</tr>
						</tbody>
					</table>
					
					<a href="payment?shipmentId=${ship.shipmentId}" class="btn btn-success btn-lg btn-block">
						Pay Now   <span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>
		</div>
</body>
</html>