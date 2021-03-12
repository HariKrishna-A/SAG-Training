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

}

</script>
</head>

<body>


<div class="col-lg-5 offset-4 mb-3"
		style="margin-top: 60px !important;">
		
		<%
	if(session.getAttribute("userExist") =="no") {
		
%>
	<h5 class="text-danger">Login Failed...try again!!</h5>
<%
	session.setAttribute("userExist", "");
	}
	else if(session.getAttribute("userExist") =="first"){
%>
	<h5 class="text-danger">Login First</h5>
<%
	session.setAttribute("userExist", "");
	}

else if(session.getAttribute("userExist") =="logout"){
%>
	<h5 class="text-success">logout successfully</h5>
<%
	session.setAttribute("userExist", "");
	}

else if(session.getAttribute("pass") =="done"){
%>
	<h5 class="text-success">Password  successfully changed</h5>
<%
	session.setAttribute("pass", "");
}
else if(session.getAttribute("register") =="done"){
%>
	<h5 class="text-success">registered successfully login now</h5>
<%
	session.setAttribute("register", "");
	}

%>
			

		<div class="card border-primary  mb-3 center"
			style="max-width: 22rem;">
			
			<div class="card-header text-primary text-center">
				<h5>LOGIN PAGE</h5>
			</div>
			<div class="card-body">
				<form:form action="loginUser" method="POST" modelAttribute="user"
					      onsubmit="return validation(login_form)"  name="login_form">
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


</body>
</html>