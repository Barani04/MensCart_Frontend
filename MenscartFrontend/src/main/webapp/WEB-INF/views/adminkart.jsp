<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.cont {
	margin-top: 90px;
}
</style>
<div class="container cont">
	<h3 align="center">Orders</h3>
	<table class="table table-stripped table-xs">
		<tr>
			<th></th>
			<th>UserName</th>
			<th class="text-left">CartId</th>
			<th class="text-left">ProductName</th>
			<th class="text-left">addDate</th>
			<th class="text-left">#</th>
			<th class="text-left">Price</th>
			<th class="text-left">Total</th>
			<th class="text-left">delivery</th>
			<th class="text-left">Status</th>
		</tr>
		<c:forEach items="${cartitems}" var="cartitem">
			<tr style="margin-top: 5px; margin-right: 20px;!important"
				class="item-row">
				<td></td>
				<td style="text-align: left;">${cartitem.userName}</td>
				<td style="text-align: left;">${cartitem.cartId}</td>
				<td style="text-align: left;">${cartitem.productName}</td>
				<td style="text-align: left;">${cartitem.cuDate}</td>
				<td style="text-align: left;">${cartitem.qty}</td>
				<td style="text-align: left;">&#8377;${cartitem.price}</td>
				<td style="text-align: left;">&#8377;${cartitem.total}</td>
				<td style="text-align: left;">${cartitem.dDate}</td>				
				<c:if test="${cartitem.days>=3}">
					<td style="text-align: left; color:#ff9000;">Shipped</td>
				</c:if>
				<c:if test="${cartitem.days<=0}">
					<td style="text-align: left; color:#06e20a;">Delivered</td>
				</c:if>
				<c:if test="${cartitem.days>=1 && cartitem.days<=2}">
					<td style="text-align: left; color:#3e0cf4;">In Transit</td>
				</c:if>
			</tr>
		</c:forEach>
		</table>
</div>