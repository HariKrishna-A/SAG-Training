<%@page import="com.app.bookShop.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<body width="100%" >

<br>
<div class="container" width="100%">
<div class="row">
<c:forEach var="tempBook" items="${books}" varStatus="loop">
 <c:url var="add" value="/addCart">
<c:param name="id" value="${tempBook.bookId}"></c:param>
</c:url> 
<div class="card" style="width: 15rem;margin-left: 2.333333%; margin-top: 15px">
  <img src="${tempBook.imgUrl}" alt="...">
  <div class="card-body">
    <h5 class="card-title">NAME:&nbsp<span class="text-primary">${tempBook.bookName}</span></h5>
    <hr>
    <p class="card-text">AUTHOR:&nbsp<span class="text-primary">${tempBook.bookAuthor}</span></p>
       <hr>
      <p class="card-text">QUANTITY:&nbsp<span class="text-primary">${tempBook.bookQty}</span></p>
         <hr>
        <p class="card-text">PRICE:&nbsp<span class="text-primary">${tempBook.bookPrice}</span></p>
           <hr>
    <a href="${add}">Add</a>
  </div>
</div>

</c:forEach>

</div>
</div>

</body>
</html>