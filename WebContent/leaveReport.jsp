<% String userRole=new String("SUPERSTAR"); if(session.getAttribute("role") !=null){
	userRole=(String)session.getAttribute("role"); } if(userRole.equals("Faculty")){ %>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
		<%@ page import="java.io.*,java.util.*,java.sql.*" %>
			<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
				<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
				<html>

				<head>
					<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
						integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
						crossorigin="anonymous"></script>
					<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
						rel="stylesheet"
						integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
						crossorigin="anonymous">
					<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
					<title>Leave Report</title>
				</head>

				<body>
					<header class="p-3 bg-dark text-white" style="background-color:rgb(77, 74, 74)!important;">
						<div class="container">
							<div class="d-flex flex-wrap align-items-center justify-content-center">
								<a href="/"
									class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none justify-content-center">
									<img src="logo.png" style="height: 10%; width: 10%;" alt="">
								</a>
							</div>
						</div>
						<div class="container">
							<div
								class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">


								<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
									<li><a href="faculty_index.jsp" class="nav-link px-2 text-secondary">Home</a></li>
									<li><a href="approve.jsp" class="nav-link px-2 text-white">Approve
											Leave</a></li>
									<li><a href="leaveReport.jsp" class="nav-link px-2 text-white">Leave
											Report</a></li>
									<li><a href="profile_fac.jsp" class="nav-link px-2 text-white">Profile</a></li>


								</ul>
								<div class="text-end">

									<button type="button" class="btn btn-warning">
										<a href="index.jsp" class="text-decoration-none" style="color: white;">Log
											Out</a>
									</button>
								</div>
							</div>
						</div>
					</header>

					<div class="container-sm constainer-md position-absolute  text-center" style="margin-top: 2%;">
						<form action="" method="post">

							<div class="row mb-3 mx-auto w-50">
								<label for="inputEmail3" class="col-sm-2 col-form-label">Enrollment
									No</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="user_id" id="inputEmail3">
								</div>
							</div>



							<div class="container mx-auto w-50 text-center ">

								<button type="submit" class="btn btn-primary">Search</button>


							</div>

						</form>
					</div>
					<div class="container">
						<table border="1" class="container-sm constainer-md position-absolute  text-center"
							style="margin-top: 10%;">
							<tr>
								<th>Full Name</th>
								<th>Email Id</th>
								<th>Enrollment No</th>
								<th>Reason</th>
								<th>Start Date</th>
								<th>Due Date</th>
								<th>Approved</th>

								<th>Pending</th>

							</tr>
							<% String user_id=request.getParameter("user_id"); Class.forName("com.mysql.jdbc.Driver");
								java.sql.Connection
								con=DriverManager.getConnection("jdbc:mysql://localhost:3306/leave", "root" , "root" );
								if(user_id!=null){ Statement st=con.createStatement(); String
								sql="select * from addleave where enrollment_no='" +user_id+"' ";
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()){
				%>
		<tr>
			<td>
				<%
					out.println(rs.getString(" full_name")); %>
								</td>
								<td>
									<% out.println(rs.getString("email_id")); %>
								</td>
								<td>
									<% out.println(rs.getInt("enrollment_no")); %>
								</td>
								<td>
									<% out.println(rs.getString("reason")); %>
								</td>
								<td>
									<% out.println(rs.getString("start_date")); %>
								</td>
								<td>
									<% out.println(rs.getString("due_date")); %>
								</td>
								<td>
									<%out.println(rs.getString("approved")); %>

								</td>
								<td>

									<%out.println(rs.getString("pending")); %>
								</td>
								</tr>
								<% } } %>
						</table>
					</div>


				</body>

				</html>
				<% } else{ out.println("<script>alert('SESSION INVALID!!! PLEASE LOGIN AGAIN!!!!!');</script>");
					response.sendRedirect("login.jsp");
					}
					%>