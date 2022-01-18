<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>

<%@include file="component/allCss.jsp"%>
</head>
<body style="background-color: #0f2f0;">
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center c-head text-primary">
						<i class="	fa fa-user-circle fa-2x"></i>
						<h5>Please Register</h5>
					</div>

					<div class="card-body ">
						<%
						String succsessmsg = (String) session.getAttribute("successmsg");
						String errormsg = (String) session.getAttribute("errormsg");

						if (succsessmsg != null) {
						%>
						<div style="text-color: blue;" class="alert alert-success text-center"
							role="alert"><%=succsessmsg%> Login..<a href="login.jsp">Click
								here</a>
						</div>
						<%
						session.removeAttribute("successmsg");
						}
						if (errormsg != null) {
						%>
						<div style="text-color: blue;"
							class="alert alert-danger text-danger text-center" role="alert"><%=errormsg%>
						</div>
						<%
						session.removeAttribute("errormsg");
						}
						%>
						
						<%
						String msg=(String)session.getAttribute("msg");
						if(msg!=null)
						{
						
							%>
							<div style="text-color: blue;"
							class="alert alert-danger text-danger text-center" role="alert"><%=msg%>
						</div>
							<%
							session.removeAttribute("msg");
						}
						
						
						%>
						
						<form action="RegisterServlet" method="post"  name="f1">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Name</label> <input
									name="Name" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1"> Enter Email</label> <input
									name="Email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="Password" type="password" class="form-control"
									id="exampleInputPassword1">
							</div>

							<div class="text-center mt-4">
								<button type="submit" class="btn btn-primary ">Register</button>
							</div>
						</form>

					</div>

				</div>
			</div>
		</div>

	</div>
	<div style="margin-top: 204px;">
		<%@include file="component/footer.jsp"%>
	</div>
</body>
</html>