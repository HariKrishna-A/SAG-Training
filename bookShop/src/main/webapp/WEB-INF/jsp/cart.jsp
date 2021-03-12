<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
               <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
<%
	if(session.getAttribute("cart") =="nocart") {	
%>
	<h5 class="text-primary text-center">Cart Empty</h5>
<%
	session.setAttribute("cart", "");
	}
	else{
%>
<div class="card text-center col-lg-5 offset-4 mb-3" >
<div class="card text-center">
  <div class="card-header">
      <h5 class="card-title text-primary">CART_DETAILS</h5>
  </div>
  <div class="card-body">
   <table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">BOOK_NAME</th>
      <th scope="col">AUTHOR_NAME</th>
      <th scope="col">QUANTITY</th>
      <th scope="col">PRICE</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <c:forEach var="tempBook" items="${cartList}" varStatus="loop">
   <c:url var="remove" value="/removeCart">
<c:param name="id" value="${tempBook.bookId}"></c:param>
</c:url> 
 <c:url var="order" value="/order">
<c:param name="id" value="${tempBook.bookId}"></c:param>
</c:url> 
  <tbody>
    <tr>
      <th>${tempBook.bookName}</th>
      <td>${tempBook.bookAuthor}</td>
<td>${tempBook.bookQty}</td>
<td>${tempBook.bookPrice}</td>
<td><a href="${remove}">Remove</a></td>
    </tr>

  </tbody>
  </c:forEach>
</table>
  
  </div>
  <div class="card-footer text-muted">
  <a><button type="button"  class="btn btn-primary" onclick="window.location.href='${order}'">BUY</button></a>
  </div>
</div>
</div>
<%
	}
%>
</body>
</html>