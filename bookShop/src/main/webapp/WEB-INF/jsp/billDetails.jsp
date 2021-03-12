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
	if(session.getAttribute("bill") =="nobill") {	
%>
	<h5 class="text-primary text-center">There is no bill history for you</h5>
<%
	session.setAttribute("bill", "");
	}
%>

<div >
<c:forEach var="billdetail" items="${orders}" varStatus="loop">
<div class="card text-center col-lg-5 offset-4 mb-3" >
  <div class="card-header">
   <h5 class="card-title">ORDER_ID:&nbsp<span class="text-primary">${billdetail.orderId}</span> </h5>
  </div>
  <div class="card-body">
    <h5 class="card-title">Date & Time:&nbsp<span class="text-primary"> ${billdetail.orderDate}</span></h5>
     <hr class="text-primary">
     <h5 class="card-title text-primary">BOOK_DETAILS</h5>
     <table class="table">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Author</th>
      <th scope="col">Quantity</th>
      <th scope="col">Amount</th>
    </tr>
  </thead>
     <c:forEach var="bookDetail" items="${billdetail.bookDetails}" varStatus="loop"> 
  <tbody>
    <tr>
      <th>${bookDetail.bookName}</th>
      <td>${bookDetail.bookAuthor}</td>
      <td>${bookDetail.bookQty}</td>
      <td>${bookDetail.bookPrice}</td>
    </tr>
  </tbody>
      </c:forEach>
</table>
  </div>
  <div class="card-footer">
    <h5 class="card-title">Bill Amount:&nbsp<span class="text-primary"> ${billdetail.orderAmount}</span></h5>
  </div>
</div>
</c:forEach>
</div>

</body>
</html>