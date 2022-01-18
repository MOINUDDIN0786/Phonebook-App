<%@page import="com.Entities.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.Dao.ContactDAO"%>
<%@page import="com.connection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Contact</title>
<%@include file="component/allCss.jsp"%>
<style>
.crd-ho:hover {
	background-color: #f5faf6;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<%
	if (user == null) {
		session.setAttribute("invalidmsg", "Please Login First...");
		response.sendRedirect("login.jsp");
	}
	%>

	<%
	String success2msg = (String) session.getAttribute("success2msg");
	String error2msg = (String) session.getAttribute("error2msg");

	if (success2msg != null) {
	%>
	<div style="text-color: blue;"
		class="alert alert-success text-succcess text-center" role="alert"><%=success2msg%>
	</div>
	<%
	session.removeAttribute("success2msg");
	}

	if (error2msg != null) {
	%>
	<div style="text-color: blue;"
		class="alert alert-danger text-danger text-center" role="alert"><%=error2msg%>
	</div>
	<%
	session.removeAttribute("error2msg");
	}
	%>


	

	<%
	String delsucmsg = (String) session.getAttribute("delsucmsg");
	String delermsg = (String) session.getAttribute("delermsg");
	if (delsucmsg != null) {
	%>
	<div style="text-color: blue;"
		class="alert alert-success text-succcess text-center" role="alert"><%=delsucmsg%>
	</div>
	<%
	session.removeAttribute("delsucmsg");
	}

	if (delermsg != null) {
	%>
	<div style="text-color: blue;"
		class="alert alert-danger text-danger text-center" role="alert"><%=delermsg%>
	</div>
	<%
	session.removeAttribute("delermsg");
	}
	%>



	<div class="container ml-8 active">
		<div class="row p-4">

			<%
			if (user != null) {

				ContactDAO dao = new ContactDAO(DbConnect.getConn());
				List<Contact> contact = dao.getAllContact(user.getId());

				for (Contact c : contact) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body">
						<h5>
							Name:
							<%=c.getName()%></h5>
						<p>
							Mobile
							<%=c.getName()%></p>
						<p>
							Email:
							<%=c.getEmail()%></p>
						<p>
							About:
							<%=c.getAbout()%></p>
						<div class="text-center">
							<a href="editContact.jsp?cid=<%=c.getId()%>"
								class="btn btn-success btn-sm text-white">Edit</a> <a
								href="DeleteContactServlet?cid=<%=c.getId()%>"
								class="btn btn-danger btn-sm text-white">Delete</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>

		</div>

	</div>
	<div style="margin-top: 39px;">
		<%@include file="component/footer.jsp"%>
	</div>
</body>
</html>