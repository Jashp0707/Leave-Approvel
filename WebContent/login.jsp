



<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
</head>
<body>
	<header class="p-3 bg-dark text-white"
		style="background-color:rgb(77, 74, 74)!important;">
	<div class="container">
		<div
			class="d-flex flex-wrap align-items-center justify-content-center">
			<a href="/"
				class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none justify-content-center">
				<img src="logo.png" style="height: 10%; width: 10%;" alt="">
			</a>
		</div>
	</div>
	<div class="container">
		<div
			class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">


			<ul
				class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
				<li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>
				<li><a href="#" class="nav-link px-2 text-white">Academics</a></li>
				<li><a href="#" class="nav-link px-2 text-white">About Us</a></li>
				<li><a href="#" class="nav-link px-2 text-white">Contact Us</a></li>


			</ul>




		</div>
	</div>
	</header>


	<!--   main -->

	<div
		class="container-sm constainer-md position-absolute top-50 start-50 translate-middle text-center">
		<form action="login.jsp">

			<div class="row mb-3 mx-auto w-50">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" name="email"
						id="inputEmail3">
				</div>
			</div>
			<div class="row mb-3 mx-auto w-50">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="password"
						id="inputPassword3">
				</div>
			</div>
			<div class="row mb-3 mx-auto w-50">
				<label class="col-sm-2 col-form-label">Post</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="post"
						id="inputEmail3">
				</div>
			</div>

			<div class="container mx-auto w-50 text-center ">

				<button type="submit" class="btn btn-primary">Sign in</button>


			</div>

		</form>
	</div>

	<%
		String details = request.getParameter("post");
		String email_id = request.getParameter("email");
		String password = request.getParameter("password");

		Class.forName("com.mysql.jdbc.Driver");

		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave", "root", "root");
		// 		if(con.checkData("select * from hod_details where email_id='"+request.getParameter("email")+"' and password='"+request.getParameter("password")+"' and details='"+request.getParameter("post")+"'")){
		// 			if(request.getParameter("post")=="Student"){
		// 				response.sendRedirect("student_index.html"); 	
		// 			}
		// 			else if(request.getParameter("post")=="Faculty"){
		// 				response.sendRedirect("faculty_index.html");
		// 			}
		// 			else{
		// 				response.sendRedirect("login.html");
		// 			}
		// 		}
		if (details != null && email_id != null && password != null) {
			Statement st = con.createStatement();
			String sql = "select * from leave.hod_details where email_id='" + email_id + "' and password='"
					+ password + "' and details='" + details + "'";
			ResultSet rs = st.executeQuery(sql);
			System.out.println(details + email_id + password);
			if (rs.next()) {
				if (rs.getString("details").equals("Student")) {
					String id=rs.getString("userid");
					String Uname=request.getParameter("email");
					session.setAttribute("adminUsername" ,Uname);
					session.setAttribute("id" ,id);
					session.setAttribute("role" ,"Student");
					response.sendRedirect("student_index.jsp");
				} else {
					String id=rs.getString("userid");
					String Uname=request.getParameter("email");
					session.setAttribute("adminUsername" ,Uname);
					session.setAttribute("id" ,id);
					session.setAttribute("role" ,"Faculty");
					response.sendRedirect("faculty_index.jsp");
				}

			} else {
				out.println("<h1></h1>");
				out.println("<script>alert('Wrong username or password');</script>");
				System.out.println("wrong password");
				response.sendRedirect("login.jsp");
			}
		}

		// 		where email_id='"+email_id+"' and password='"+password+"' and details='"+details+"'
		// 		String sql="select * from hod_details where email_id=? and password=? and details=?";
		// 		PreparedStatement ps = con.prepareStatement(sql);
		// 		ps.setString(1,email_id);
		// 		ps.setString(2,password);
		// 		ps.setString(3,details);

		// 		ResultSet rs=ps.executeQuery();
		// 		rs.last();
		// 		int size = rs.getRow();
		// 		System.out.println(size);

		// 		try{
		// 			if (rs.next()){

		// 			if((rs.getString("password").equals(password))&&(rs.getString("email_id").equals(email_id))){

		// 			}
		// 			else{
		// 				response.sendRedirect("login.html");
		// 			}
		// 		}
		// 		catch (Exception e) {
		// 			e.printStackTrace();
		// 			}
	%>






</body>
</html>

