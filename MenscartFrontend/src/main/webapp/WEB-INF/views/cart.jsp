<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="navbar.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<style type="text/css">
.cont{
	margin-top: 100px;
}
</style>
</head>
<body>
	<div class="container cont">
		<h3 align="center">Shopping Cart</h3>
		<table class="table table-xs">
			 <form action="updateCartItem?${cartitem.citemId}" />
			<tr>
				<th></th>
				<th>Product</th>
				<th class="text-right">Quantity</th>
				<th class="text-right">Price</th>
				<th class="text-right">SubTotal</th>
				<th class="text-center">Action</th>
			</tr>
			<c:forEach items="${cartitems}" var="cartitem">
				<tr style="margin-top: 5px; margin-right: 20px;!important" class="item-row">
					<td><img alt="${cartitem.productName}"
						src="resources/images/${cartitem.productId}.jpg" width="80px"
						; height="80px;"></td>
					<td style="text-align: left;">${cartitem.productName}</td>
					<td style="text-align: right;"><input type="number" name="quantity" value="${cartitem.qty}" style="width: 36px; text-align: center;" /></td>
					<td style="text-align: right;">${cartitem.price}</td>
					<td style="text-align: right;">${cartitem.price * cartitem.qty}</td>
					<td><a href=""></a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4" class="text-right" style="font-weight: bold;">Total</td>
				<td style="text-align: right;">${grandtotal}</td>
				<td></td>				
			</tr>
			</form>
		</table>
	</div>
</body>
</html>