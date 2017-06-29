<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<form:form action="addProduct" modelAttribute="product">
		<tr>
			<td colspan="2"><center>Product Details</center></td>
		</tr>
		<tr>
			<td>Product Id</td>
			<td><form:input path="productId" /></td>
		</tr>

		<tr>
			<td>Product Name</td>
			<td><form:input path="productName" /></td>
		</tr>
		
		<tr>
			<td>Product Description</td>
			<td><form:input path="productDescription" /></td>
		</tr>

		<tr>
			<td>Category</td>
			<td><form:select path="categoryId">
					<form:option value="0" label="----Select----">
						<form:options items="${catlist}" />
					</form:option>
				</form:select></td>
		</tr>

		<tr>
			<td>Supplier</td>
			<td><form:select path="supplierId">
					<form:option value="0" label="----Select----">
						<form:options items="${supdetail}" />
					</form:option>
				</form:select></td>
		</tr>

		<tr>
			<td>Stock</td>
			<td><form:input path="stock" /></td>
		</tr>

		<tr>
			<td>Price</td>
			<td><form:input path="price" /></td>
		</tr>

		


	</form:form>
</body>
</html>