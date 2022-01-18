<%@page import="java.sql.Connection"%>
<%@page import="com.connection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Contact</title>
<%@include file="component/allCss.jsp"%>
</head>
<body style="background: #fff176;" >
	<%@include file="component/navbar.jsp"%>
	
	
	<%
	if(user==null)
	{
		session.setAttribute("invalidmsg", "Please Login First...");
		response.sendRedirect("login.jsp");
		
	}
	
	%>
	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center c-head text-success">

						<h5>Add Contact Page</h5>
					</div>

					<div class="card-body ">
                         
                       <%
                        String success1msg=(String)session.getAttribute("success1msg");
                        String error1msg=(String)session.getAttribute("error1msg");
                        
                        if(success1msg!=null)
                        {
                        	%>
    						<div style="text-color: blue;"
    							class="alert alert-success text-success text-center mt-0" role="alert"><%=success1msg%>
    						</div>
    						<%
    						session.removeAttribute("success1msg");
                        }
                        if(error1msg!=null)
                        {
                        	%>
    						<div style="text-color: blue;"
    							class="alert alert-danger text-danger text-center mt-0" role="alert"><%=error1msg%>
    						</div>
    						<%
    						session.removeAttribute("error1msg");
                        }
                        %>
                        
                        <%
                        String msg1=(String)session.getAttribute("msg1");
                        if(msg1!=null)
                        {
                        	%>
                        	<div style="text-color: blue;"
    							class="alert alert-danger text-danger text-center mt-0" role="alert"><%=msg1%>
    						</div>
                        	<%
                        	session.removeAttribute("msg1");
                        }
                        %>
                         
						<form  action ="AddContactServlet" method="post">
						
						<%
						if(user!=null)
						{
						%>
						
						<input type="hidden" value="<%=user.getId() %>" name="Userid">
						
						<% 
							
						}
						%>
						
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Name</label> <input name="Name"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1"> Enter Email</label> <input name="Email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1"> Enter Mobile Number</label> <input name="Mobile"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1"></label> <input name="About"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="About">

							</div>

							<div class="text-center mt-4">
								<button type="submit" class="btn btn-success ">Save
									Contact</button>
							</div>
						</form>

					</div>

				</div>
			</div>
		</div>

	</div>
	 
</body>
</html>