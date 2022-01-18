<%@page import="com.Entities.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="component/allCss.jsp"%>

<style type="text/css">
.back-img
{
 background: url("component/Image/phone.jpg");
 width: 100%;
 height: 87vh;
 background-repeat: no-repeat;
 background-size: cover;
}

</style>
</head>
<body>
<%@include file="component/navbar.jsp"%>

<div class="conainer-fluid back-img text-center">
<h1 style="color:#fff432; font-size:70px;">Welcome To PhoneBook App</h1>


</div>
<%@include file="component/footer.jsp" %>
</body>
</html>