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
	if(docName.mobileNumber.value.length != 10 || parseInt(docName.mobileNumber.value.charAt(0))<=6)
	{
		alert("Enter a valid mobile number");
		return false;
	}
	if( docName.password.value=="")
	{
		alert("Enter a password");
		return false;
	}
	if(password.length<4 || password.match(/[a-z]/g) == null ||password.match(/[A-Z]/g) ==null||password.match(/[0-9]/g) == null ){
		alert("Enter a Password .must contain At least ONE uppercase & lowercase character & ONE Digit & Length greater-than 5.");
		return false;
	}

}

</script>
</head>
<body>
<div class="col-lg-5 offset-4 mb-3"
		style="margin-top: 60px !important;">
<div class="card border-primary  mb-3 center"
			style="max-width: 22rem;">
				<%
	if(session.getAttribute("pass") =="not") {
		
%>
	<h5 class="text-danger">Failed...try again!!</h5>
<%
	session.setAttribute("pass", "");
	}
%>
			<div class="card-header text-primary text-center">
				<h5>CHANGE PASSWORD</h5>
			</div>
			<div class="card-body">
				<form:form action="changePassw" method="POST" modelAttribute="user"
					      onsubmit="return validation(pass_form)"  name="pass_form">
					<div class="mb-3">
						<label class="form-label">MOBLIE NUMBER</label>
						<form:input path="mobileNumber" type="text" class="form-control" />
					</div>
					<div class="mb-3">
						<label class="form-label">PASSWORD</label>
						<form:input path="password" type="password" class="form-control"
							id="exampleInputPassword1" />
					</div>
					
					<button type="submit" class="btn btn-success" style="float: right;">login</button>
				</form:form>
			</div>
		</div>
 
	</div>
</div>
</body>
</html>