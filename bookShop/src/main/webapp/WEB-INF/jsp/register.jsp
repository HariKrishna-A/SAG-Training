<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
       <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function validation(docName)
{
	var password = docName.password.value;
	if(docName.cusName.value=="" || docName.cusName.value.length <=2)
	{
		alert("Enter a name. Length must be greater-than 2");
		return false;
	}
	if(password=="")
	{
		alert("Enter a password");
		return false;
	}
	if(password.length<4 || password.match(/[a-z]/g) == null ||password.match(/[A-Z]/g) ==null||password.match(/[0-9]/g) == null ){
		alert("Enter a Password .must contain At least ONE uppercase & lowercase character & ONE Digit & Length greater-than 5.");
		return false;
	}
	if(docName.mobileNumber.value.length != 10 || parseInt(docName.mobileNumber.value.charAt(0))<=6)
	{
		alert("Enter a valid mobile number");
		return false;
	}
	if(docName.address.value.length <= 3)
	{
		alert("Enter address. Length must be greater-than 3 ");
		return false;
	}
}
</script>
</head>
<body>
<div class="col-lg-5 offset-4 mb-3"
		style="margin-top: 60px !important;">
	<%
	if(session.getAttribute("register") =="not") {
		
%>
	<h5 class="text-danger">Registeration Failed...try again!! with new number</h5>
<%
	session.setAttribute("register", "");
	}
%>
		<div class="card border-primary  mb-3 center"
			style="max-width: 22rem;">
			<div class="card-header text-primary text-center">
				<h5>REGISTERATION FORM </h5>
			</div>
			<div class="card-body">
<form:form action="addUser" method="POST" modelAttribute="user" onsubmit="return validation(register_form)" name="register_form">
					<div class="mb-3">
						<label class="form-label">NAME</label>
						<form:input path="cusName" type="text" class="form-control" />
					</div>
					<div class="mb-3">
						<label class="form-label">PASSWORD</label>
						<form:input path="password" type="password" class="form-control" />
					</div>
					<div class="mb-3">
						<label class="form-label">MOBILE NUMBER</label>
						<form:input path="mobileNumber" type="text" class="form-control" />
					</div>
					<div class="mb-3">
						<label class="form-label">ADDERSS</label>
						<form:input path="address" type="text" class="form-control" />
					</div>
					<button type="submit"   class="btn btn-success" style="float: right;">register</button>
				</form:form>
			</div>
		</div>

	</div>

</body>
</html>