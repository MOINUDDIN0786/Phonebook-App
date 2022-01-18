<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="component/allCss.jsp"%>
</head>
<body style="background-color: #0f2f0;">
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center c-head text-success">
						<i class="	fa fa-user-circle fa-2x"></i>
						<h5>Please Login</h5>
					</div>

					<div class="card-body ">
                        <%
                        String invalidmsg=(String)session.getAttribute("invalidmsg");
                        String logoutmsg=(String)session.getAttribute("logoutmsg");
                        
                        if(invalidmsg!=null)
                        {
                        	%>
    						<div style="text-color: blue;"
    							class="alert alert-danger text-danger text-center mt-0" role="alert"><%=invalidmsg%>
    						</div>
    						<%
    						session.removeAttribute("invalidmsg");
                        }
                        if(logoutmsg!=null)
                        {
                        	%>
    						<div style="text-color: blue;"
    							class="alert alert-success text-success text-center mt-0" role="alert"><%=logoutmsg%>
    						</div>
    						<%
    						session.removeAttribute("logoutmsg");
                        }
                        %>
						<form action="LoginServlet" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1"> Enter Email</label> <input
									type="email" name="Email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="Password" class="form-control"
									id="exampleInputPassword1">
							</div>

							<div class="text-center mt-4">
								<button type="submit" class="btn btn-primary ">Login</button>
							</div>
						</form>

					</div>

				</div>
			</div>
		</div>

	</div>
</body>
<div style="margin-top: 289px;">
	<%@include file="component/footer.jsp"%>
</div>
</html>