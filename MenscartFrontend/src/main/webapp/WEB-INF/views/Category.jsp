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
	<c:if test="${flag}">
			<form action="updatecat" method="post" class="form-horizontal">
		</c:if>
	
	<c:if test="${!flag}">
		<form action="addcat" method="post" class="form-horizontal">
	</c:if>
		<div class="container">

			<div style="margin-top: 50px;"
				class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div style="font-size: 25px; text-align: center;"
							class="panel-title">Category Details</div>
					</div>
					<div style="padding-top: 30px" class="panel-body">

						<!--Form-group -->
						<c:if test="${flag}">
							<div class="form-group">
							<label class="col-md-4 control-label">Category
								Id:</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="categoryId"
								value="${category.categoryId}"	placeholder="Category Id">
							</div>
						</div>
						
						</c:if>
						
						<div class="form-group">
							<label for="categoryName" class="col-md-4 control-label">Category
								Name:</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="categoryName"
									value="${category.categoryName}"placeholder="Category Name">
							</div>
						</div>

						<div class="form-group">
							<label for="description" class="col-md-4 control-label">Category
								Description:</label>
							<div class="col-md-8">
								<input id="description" name="description" type="text"
									value="${category.description}"placeholder="Description" class="form-control input-md">
							</div>
						</div>

						<div class="form-group">
							<div
								class="col-md-offset-5 col-md-3 col-md-offset-7 col-sm-offset-5 col-sm-3 col-sm-offset-7">
								<input type="submit" value="Add Category" class="btn btn-info" />
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</form>

	<!-- TABLE DISPLAY -->
	<div class="row col-md-10 custyle">
		<table class="table table-striped custab">
			<thead style="color: #090df7; font-weight: bold; font-size: 20px;"
				class="table-default active">
				<tr>
					<td>S.No</td>
					<td>Category Id</td>
					<td>Category Name</td>
					<td>Description</td>
					<td>Update</td>
					<td>Delete</td>
				</tr>
			</thead>
			<tbody style="color: #f90404; font-size: 15px; font-family: serif;">
				<c:forEach items="${catdetail}" var="category" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${category.categoryId}</td>
						<td>${category.categoryName}</td>
						<td>${category.description}</td>
						<td class="text-center"><a class='btn btn-info btn-xs'
							href="getUpdateCat?catId=${category.categoryId}"><span class="glyphicon glyphicon-edit"></span>
								Update</a></td>
						<td><a href="deleteCategory?catId=${category.categoryId}"
							class="btn btn-danger btn-xs"><span
								class="glyphicon glyphicon-remove"></span> Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>