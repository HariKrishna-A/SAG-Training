<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.app.bookShop.controller.BookShopController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function userExist()
{
	if(localStorage.getItem("lastname") == ""){
		return true;
	}
}
</script>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
	integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
	integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
	crossorigin="anonymous"></script>
<body>
	<nav class="navbar navbar-expand-sm navbar-light bg-primary">
		<a class="navbar-brand">BOOK SHOP</a>
		<div>
			<ul class="navbar-nav ml-left">

						
				    <li class="nav-item active "><a class="nav-link text-light"
					value="Register" onclick="window.location.href='/';  return false;"
					style="cursor: pointer;">Register</a></li>

				    <li class="nav-item"><a class="nav-link text-light"
					value="Login"
					onclick="window.location.href='/login';  return false;"
					style="cursor: pointer;">Login</a></li>

				     <li class="nav-item"><a class="nav-link text-light"
					value="BookList"
					onclick="window.location.href='/listBooks';  return false;"
					style="cursor: pointer;">Books</a></li>
									<li class="nav-item"><a class="nav-link text-light"
					value="cartList"
					onclick="window.location.href='/cart';  return false;"
					style="cursor: pointer;">cart</a></li>
					<li class="nav-item"><a class="nav-link text-light"
					value="cartList"
					onclick="window.location.href='/billDetails';  return false;"
					style="cursor: pointer;">bill_Details</a></li>
										<li class="nav-item"><a class="nav-link text-light"
					value="cartList"
					onclick="window.location.href='/changePass';  return false;"
					style="cursor: pointer;">changePassword</a></li>
					<li class="nav-item"><a class="nav-link text-light"
					value="cartList"
					onclick="window.location.href='/logout';  return false;"
					style="cursor: pointer;">logout</a></li>
			</ul>

		</div>
	</nav>
</body>
</html>