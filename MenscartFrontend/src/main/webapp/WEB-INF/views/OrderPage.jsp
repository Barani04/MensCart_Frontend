<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.cont {
	margin-top: 90px;
}
</style>
</head>
<body>
	<div class="container cont">
		<h3 align="center">Your Orders</h3>
		<table class="table table-stripped table-xs">
			<tr>
				<th></th>
				<th>Product</th>
				<th class="text-right">Quantity</th>
				<th class="text-right">Price</th>
				<th class="text-right">SubTotal</th>
			</tr>
			<c:forEach items="${cartitems}" var="cartitem">
				<tr style="margin-top: 5px; margin-right: 20px;!important"
					class="item-row">
					<td></td>
					<td style="text-align: left;">${cartitem.productName}</td>
					<td style="text-align: right;">${cartitem.qty}</td>				
					<td style="text-align: right;">${cartitem.price}</td>
					<td style="text-align: right;">${cartitem.price * cartitem.qty}</td>

				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>