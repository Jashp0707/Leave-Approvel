
<%
	String userRole = new String("SUPERSTAR");

	if (session.getAttribute("role") != null) {
		userRole = (String) session.getAttribute("role");
	}
	if (userRole.equals("Student")) {
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>addLeave</title>
</head>
<body>
	<!-- navbar   -->


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
				<li><a href="student_index.jsp"
					class="nav-link px-2 text-secondary">Home</a></li>
				<li><a href="addLeave.jsp" class="nav-link px-2 text-white">Add
						Leave</a></li>
				<li><a href="leaveHistory.jsp" class="nav-link px-2 text-white">Leave
						History</a></li>
				<li><a href="profile_stu.jsp" class="nav-link px-2 text-white">Profile</a></li>


			</ul>

			<div class="text-end">

				<button type="button" class="btn btn-warning">
					<a href="index.jsp" class="text-decoration-none"
						style="color: white;">Log Out</a>
				</button>
			</div>




		</div>
	</div>
	</header>
	<%
		String email_id = (String) session.getAttribute("adminUsername");
			String id = (String) session.getAttribute("id");
			String first_name = "";
			String last_name = "";
			String full_name = "";
			Class.forName("com.mysql.jdbc.Driver");

			java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave", "root",
					"root");

			Statement stmt = con1.createStatement();
			String sql1 = "select * from hod_details where userid=" + id + "";
			ResultSet rs = stmt.executeQuery(sql1);
			if (rs.next()) {
				first_name = rs.getString("first_name");
				last_name = rs.getString("last_name");
				full_name = first_name + " " + last_name;
			}
	%>

	<div class="container-sm constainer-md  text-center">
		<h1 class="text-center">Add Leave</h1>
		<form class="row g-3">
			<div class="col-md-4">
				<label for="inputEmail4" class="form-label">Full Name</label> <input
					type="text" class="form-control" name="full" id="inputEmail4"
					placeholder="<%out.println(full_name);%>" disabled>
			</div>

			<div class="col-md-4">
				<label for="inputEmail4" class="form-label">Email</label> <input
					type="email" class="form-control" name="email" id="inputEmail4"
					placeholder="<%out.println(email_id);%>" disabled>
			</div>

			<div class="col-md-4">
				<label for="inputPassword4" class="form-label">Enrollment
					Number</label> <input type="text" class="form-control" name="enrollment_no"
					id="inputPassword4" placeholder="<%out.println(id);%>" disabled>
			</div>
			<div class="col-6">
				<label for="inputAddress" class="form-label">Reason</label> <input
					type="text" class="form-control" id="inputAddress" name="reason">
			</div>
			<div class="col-3">
				<label for="birthday" class="form-label">From</label> <input
					type="date" class="form-control" id="birthday" name="from">
			</div>
			<div class="col-3">
				<label for="birthday" class="form-label">To</label> <input
					type="date" class="form-control" id="birthday" name="to">
			</div>
			<div class="col-12">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
	</div>

	<%
		String reason = request.getParameter("reason");

			String from = request.getParameter("from");
			String to = request.getParameter("to");
			if(reason!=null&&from!=null&&to!=null){
			
				try {

					Class.forName("com.mysql.jdbc.Driver");

					java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave",
							"root", "root");

					Statement st = con.createStatement();
					String sql = "insert into addleave values('" + full_name + "','" + email_id + "','" + id + "','"
							+ reason + "','" + from + "','" + to + "','','Yes')";
					int i = st.executeUpdate(sql);

				} catch (Exception e) {
					System.out.print(e);
					e.printStackTrace();
				}
				// 	out.println("<script>alert('Wrong username or password')</script>");

				response.sendRedirect("addLeave.jsp");
			}
	%>

</body>
</html>
<%
	} else {
		out.println("<script>alert('SESSION INVALID!!! PLEASE LOGIN AGAIN!!!!!');</script>");
		response.sendRedirect("login.jsp");
	}
%>