<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.boxed:hover {
	box-shadow: -8px -8px #eaeae1;
}
</style>
<div style="margin-top: 100px;" class="container">
	<div style="text-align: left; float: right; clear: right;">
		<a href="add" style="border-radius: 6px;"
			class="btn btn-md btn-success"><span
			style="padding-top: 3px; padding-bottom: 5px;"
			class="glyphicon glyphicon-plus"></span>Add Address</a>
	</div>
	<br>
	<hr />
	<c:forEach items="${shipdetail}" var="ship">
		<div
			style="background-color: #f7f8f9; margin: 20px 10px; border: 1px solid aqua; border-radius: 15px;"
			class="col-md-3 boxed">
			<a href="deleteAdd?shipmentId=${ship.shipmentId}"
				style="margin: 10px 0px 5px 10px; border-radius: 6px;"
				class="btn btn-sm btn-danger"><span
				class="glyphicon glyphicon-trash"></span></a><a
				href="getUpdateAdd?shipmentId=${ship.shipmentId}"
				style="margin: 10px 0px 5px 10px; border-radius: 6px;"
				class="btn btn-sm btn-warning"><span
				class="glyphicon glyphicon-pencil"></span></a>
			<div style="text-align: left;">
				<strong style="padding-right: 5px; word-wrap: break-word;">Name:</strong>${ship.userName}</div>
			<div style="text-align: left;">
				<strong style="padding-right: 5px; word-wrap: break-word;">Address:</strong>${ship.address }</div>
			<div style="text-align: left;">
				<strong style="padding-right: 5px; word-wrap: break-word;">PhoneNo:</strong>${ship.contactNo}</div>
			<div style="text-align: left; margin-bottom: 10px;">
				<a href="pay?shipmentId=${ship.shipmentId}"
					style="border-radius: 6px;" class="btn btn-md btn-info"><span
					class="glyphicon glyphicon-envelope"></span> Deliver</a>
			</div>
		</div>
	</c:forEach>
</div>