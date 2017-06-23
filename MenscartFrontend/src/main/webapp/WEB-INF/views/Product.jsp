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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="productDetails" class="form-horizontal">
			<div style="margin-top: 50px;"
				class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div style="font-size: 25px; text-align: center;"
							class="panel-title">Product Details</div>

					</div>
					<div style="padding-top: 30px" class="panel-body">

						<div class="form-group">
							<label for="proname" class="col-md-4 control-label">Product
								Name:</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="proname"
									placeholder="Product Name">
							</div>
						</div>

						<div class="form-group">
							<label for="prodes" class="col-md-4 control-label">Product
								Description:</label>
							<div class="col-md-8">
								<input id="prodes" name="description" type="text"
									placeholder="Product Descripton" class="form-control input-md">
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label" for="post">Category</label>
							<div class="col-md-6">
								<select name="Category" class="form-control">
									<br>
									<br>
									<option value="0">Select Category</option>
									<br>
									<br>
									<c:forEach items="${categoryList}" var="category"
										varStatus="status">
										<br>
										<br>
										<option value="${category.categoryname}">${category.categoryname}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label" for="post">SupplierName</label>
							<div class="col-md-6">
								<select name="suppliername" class="form-control"><br>
									<br>
									<option value="">Select Supplier</option>
									<br>
									<br>
									<c:forEach items="${supplierList}" var="supplier"
										varStatus="status">
										<br>
										<br>
										<option value="${supplier.suppliername}">${supplier.suppliername}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="stock" class="col-md-4 control-label">Stock:</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="stock"
									placeholder="Stock">
							</div>
						</div>

						<div class="form-group">
							<label for="price" class="col-md-4 control-label">Price:</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="price"
									placeholder="Price">
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-offset-5 col-md-3 col-md-offset-7">
								<button id="btn-submit" type="submit" class="btn btn-info">
									<i class="icon-hand-right"></i> Add Product
								</button>
							</div>
						</div>
					</div>
		</form>
	</div>
</body>
</html>