<%@page import="com.Entities.Contact"%>
<%@page import="com.connection.DbConnect"%>
<%@page import="com.Dao.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Contact</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<%
	if (user == null) {
		session.setAttribute("invalidmsg", "Please Login First...");
		response.sendRedirect("login.jsp");

	}
	%>


	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center c-head text-success">

						<h5>Edit Contact Details</h5>
						
						
					</div>

					<div class="card-body ">


						

						<form action="EditContactServlet" method="post">

							<%
							int cid = Integer.parseInt(request.getParameter("cid"));
							ContactDAO dao = new ContactDAO(DbConnect.getConn());
							Contact c = dao.getContactById(cid);
							%>
							<input type="hidden" value="<%=cid%>" name="cid">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Name</label> <input
									value="<%=c.getName()%>" name="Name" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1"> Enter Email</label> <input
									value="<%=c.getEmail()%>" name="Email" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1"> Enter Mobile Number</label> <input
									value="<%=c.getPhno()%>" name="Mobile" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>

							<div class="form-group">
								<textarea rows="3" cols="" placeholder="About" name="About"
									class="form-control"><%=c.getAbout()%></textarea>

							</div>

							<div class="text-center mt-4">
								<button type="submit" class="btn btn-success ">Update
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