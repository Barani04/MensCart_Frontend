<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.cont {
	margin-top: 90px;
}
</style>
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