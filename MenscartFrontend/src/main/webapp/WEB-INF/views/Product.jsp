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
<style type="text/css">
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
			<form action="updatepro" method="post"  class="form-horizontal">
		</c:if>
		<c:if test="${!flag}">
			<form action="addpro" method="post" enctype="multipart/form-data" class="form-horizontal">
		</c:if>
			<div style="margin-top: 50px;"
				class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div style="font-size: 25px; text-align: center;"
							class="panel-title">Product Details</div>

					</div>
					<div style="padding-top: 30px" class="panel-body">
						<c:if test="${flag}">
						<div class="form-group">
							<label class="col-md-4 control-label">Product Id:</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="productId"
									value="${product.productId}" placeholder="Product Id">
							</div>
						</div>
						</c:if>
						<div class="form-group">
							<label class="col-md-4 control-label">Product Name:</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="productName"
									value="${product.productName}" placeholder="Product Name">
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">Product
								Description:</label>
							<div class="col-md-8">
								<input name="productDescription" type="text"
									value="${product.productDescription}"
									placeholder="Product Descripton" class="form-control input-md">
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label" for="post">Category</label>
							<div class="col-md-6">
								<select name="categoryId" id="category" class="form-control">
									<option value="" class="form-control">Select Category</option>
									<c:forEach items="${catdetail}" var="category">
										<option value="${category.categoryId}">${category.categoryName}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label" for="post">Supplier</label>
							<div class="col-md-6">
								<select name="supplierId" id="supplier" class="form-control">
									<option value="" class="form-control">Select Supplier</option>
									<c:forEach items="${supdetail}" var="supplier"
										varStatus="status">
										<option value="${supplier.supplierId}">${supplier.supplierName}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">Stock:</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="stock"
									value="${product.stock}" placeholder="Stock">
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">Price:</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="price"
									value="${product.price}" placeholder="Price">
							</div>
						</div>
					<c:if test="${!flag}">
						<div class="form-group">
							<label class="col-md-4 control-label">Product Image:</label>
							<div class="col-md-8">
								<input type="file" class="form-control" name="pimage">
							</div>
						</div>
					
						<div class="form-group">
							<div class="col-md-offset-5 col-md-3 col-md-offset-7">
								<input type="submit" value="Add Product" class="btn btn-info" />
							</div>
						</div>
					</c:if>
					<c:if test="${flag}">
						<div class="form-group">
							<div class="col-md-offset-5 col-md-3 col-md-offset-7">
								<input type="submit" value="Update Product" class="btn btn-info" />
							</div>
						</div>
					</c:if>
					</div>
				</div>
			</div>
	</form>
		

		<!-- TABLE  DISPLAY -->

		<div class="row col-md-10 custyle">
			<table class="table table-striped custab">
				<thead style="color: #090df7; font-weight: bold; font-size: 20px;"
					class="table-default active">
					<tr>
						<td>S.No</td>
						<td>Product Id</td>
						<td>Product Name</td>
						<td>Category</td>
						<td>Supplier</td>
						<td>Stock</td>
						<td>Price</td>
						<td>Update</td>
						<td>Delete</td>
					</tr>
				</thead>
				<tbody style="color: #090df7; font-size: 15px;">
					<c:forEach items="${prodetail}" var="product" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${product.productId}</td>
							<td>${product.productName}</td>
							<td>${product.categoryId}</td>
							<td>${product.supplierId}</td>
							<td>${product.stock}</td>
							<td>${product.price}</td>
							<td class="text-center"><a class='btn btn-info btn-xs'
								href="getUpdatePro?proId=${product.productId}"><span
									class="glyphicon glyphicon-edit"></span>Update</a></td>
							<td><a href="deleteProduct?proId=${product.productId}"
								class="btn btn-danger btn-xs"><span
									class="glyphicon glyphicon-remove"></span> Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
	</div>
</body>
</html>