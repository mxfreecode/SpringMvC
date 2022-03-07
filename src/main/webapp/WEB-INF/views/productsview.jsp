<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products View</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<style>
.all-browsers {
  margin: 0;
  padding: 5px;
  background-color: lightgray;
}

.all-browsers > h1, .browser {
  margin: 10px;
  padding: 5px;
}

.browser {
  background: white;
}

.browser > h2, p {
  margin: 4px;
  font-size: 90%;
}

footer {
  text-align: center;
  padding: 3px;
  background-color: DarkSalmon;
  color: white;
}
</style>
</head>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
  <a class="navbar-brand" href="http://localhost:8080/app/saveUser">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link" href="#">History</a>
    </div>
  </div>
</nav>
<body>
<div class="container">
  <div class="row">
    <div class="col-md">
	<h1><b>Products</b></h1>
    </div>
        <div class="col-md">
    </div>
    <div class="col-md">
	<form:form action="getProduct" method="get" modelAttribute="userIdDto">
		<input type="hidden" name="userId" value="${userId}">
		<table>
			<tr>
				<td><input type="text" name="productName" placeholder="Search for a product"></td>
				<td><button class="btn btn-primary" type="submit"><i class="material-icons">search</i></button></td>
			</tr>
		</table>
	</form:form>
    </div>
  </div>
</div>
<br>
<div class="container">
	<div align="center">
		<table class="table">
			<thead class="thead-light">
			<tr>
				<th>Name</th>
				<th>Category</th>
				<th>Price</th>
				<th>Stock</th>
				<th>Quantity</th>
				<th>Add</th>
			</tr>
			</thead>
			<c:forEach items="${productsList}" var="prod">
				<form:form action="addToCart" method="post" modelAttribute="userCartContainer">
					<input type="hidden" name="productId" value="${prod.productId}"/>
					<input type="hidden" name="productName" value="${prod.productName}"/>
					<input type="hidden" name="productCategory" value="${prod.productCategory}"/>
					<input type="hidden" name="productPrice" value="${prod.productPrice}"/>
					<input type="hidden" name="userId" value="${userId}"/>
					<tr>						
						<td>${prod.productName}</td>
						<td>${prod.productCategory}</td>
						<td>${prod.productPrice}</td>
						<td>${prod.productQuantity}</td>
						<td><input type="number" name="productQuantity"/></td>
						<td><button class="btn btn-primary" type="submit"><i class="material-icons">add_shopping_cart</i></button></td>
					</tr>
				</form:form>
			</c:forEach>
		</table>
		<a class="btn btn-info" href="viewCart?userId=${userId}">View Cart</a>
		<a class="btn btn-info" href="viewAllPurchases?userId=${userId}">View Orders</a>
	</div>
</div>
</body>
<br>
<footer>
  <p>Author: Sergio Aranda<br>
  <a href="mailto:sergioexample.com">sergio@example.com</a></p>
</footer>
</html>