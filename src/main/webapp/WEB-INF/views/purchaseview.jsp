<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Purchased Products View</title>
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
  <a class="navbar-brand" href="http://localhost:8080/app/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link" href="#">History</a>
      <a class="nav-item nav-link" href="http://localhost:8080/app/showRegisters">Register</a>
      <a class="nav-item nav-link " href="http://localhost:8080/app/saveUser">Login</a>
      <a class="nav-item nav-link " href="http://localhost:8080/app/getProducts">Get Products</a>
      <a class="nav-item nav-link " href="http://localhost:8080/app/viewAllPurchases?userId=${purchase.purchaseOrderId}">Get Products</a>
      
    </div>
  </div>
</nav>
<body>
<div class="container">
<div class="row">
		<table class="table">
			<thead class="thead-dark">
			<tr>
				<th>Product Name</th>
				<th>Product Category</th>
				<th>Price</th>
				<th>Quantity</th>
			</tr>
			</thead>
			<c:forEach items="${purchase.purchasedProducts}" var="prod">
					<tr>						
						<td>${prod.productName}</td>
						<td>${prod.productCategory}</td>
						<td>${prod.productPrice}</td>
						<td>${prod.productQuantity}</td>
					</tr>
			</c:forEach>
		</table>
</div>

</div>
	<div align="center">
		<h1>Purchase Order</h1>
		<h3>Order Id: ${purchase.purchaseOrderId}</h3>
		<h3>Date and time: ${purchase.dateTime}</h3>
		<h3>Purchased product list</h3>
		<h3>${name}</h3>

		<h3>Total price: ${purchase.totalPrice}</h3>
	</div>
</body>
<br>
<footer>
  <p>Author: Sergio Aranda<br>
  <a href="mailto:sergioexample.com">sergio@example.com</a></p>
</footer>
</html>