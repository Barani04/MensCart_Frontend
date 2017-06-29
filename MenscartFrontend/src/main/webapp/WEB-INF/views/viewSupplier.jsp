<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
html, body {
	background: url(resources/img/viewbac.jpg);
	padding: 0px;
}

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
		<h3 style="margin-top: 30px;">Supplier Details</h3>
		<div class="row col-md-10 custyle">
			<table class="table table-striped custab">
				<thead style="color: #090df7; font-weight: bold; font-size: 20px;"
					class="table-default active">
					<tr>
						<td>S.No</td>
						<td>Supplier Id</td>
						<td>Supplier Name</td>
						<td>Contact Number</td>
						<td>Address</td>
						<td>Update</td>
						<td>Delete</td>
					</tr>
				</thead>
				<tbody style="color: #090df7; font-size: 15px;">
					<c:forEach items="${supdetail}" var="supplier" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${supplier.supplierId}</td>
							<td>${supplier.supplierName}</td>
							<td>${supplier.contactNo}</td>
							<td>${supplier.address}</td>
							<td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span>Update</a></td>
							<td><a href="deleteSupplier?supId=${supplier.supplierId}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Delete</a></td>		
						</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>

</body>
</html>