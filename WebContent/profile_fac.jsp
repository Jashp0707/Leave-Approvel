<%
	String userRole = new String("SUPERSTAR");
	
	if(session.getAttribute("role") != null){
		userRole = (String)session.getAttribute("role");
	}
	if(userRole.equals("Faculty")){
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
<title>Profile</title>
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
				<li><a href="faculty_index.jsp"
					class="nav-link px-2 text-secondary">Home</a></li>
				<li><a href="approve.jsp" class="nav-link px-2 text-white">Approve
						Leave</a></li>
				<li><a href="leaveReport.jsp" class="nav-link px-2 text-white">Leave
						Report</a></li>
				<li><a href="profile_fac.jsp" class="nav-link px-2 text-white">Profile</a></li>


			</ul>
			<div class="text-end">

				<button type="button" class="btn btn-warning">
					<a href="index.jsp" class="text-decoration-none"
						style="color: white;">Log Out</a>
				</button>
			</div>
		</div>
	</div></header>
	<div class="container-sm constainer-md  text-center">
    <form action="" class="row g-3">
        <div class="col-md-4">
          <label for="inputEmail4" class="form-label">First Name</label>
          <input type="text" class="form-control" name="first" id="inputEmail4">
        </div>
        <div class="col-md-4">
          <label for="inputPassword4" class="form-label">Last Name</label>
          <input type="text" class="form-control" name="last" id="inputPassword4">
        </div>
        <div class="col-md-4">
            <label for="inputEmail4" class="form-label">Email</label>
            <input type="email" class="form-control" name="email" id="inputEmail4">
          </div>
          <div class="col-md-4">
            <label for="inputPassword4" class="form-label">Password</label>
            <input type="password" class="form-control" name="password" id="inputPassword4">
          </div>
          
          <div class="col-md-4">
            <label for="inputPassword4" class="form-label">Enrollment Number</label>
            <input type="int" class="form-control" name="user_id" id="inputPassword4">
          </div>
          <div class="col-md-4">
            <label for="inputPassword4" class="form-label">Specialization</label>
            <input type="text" class="form-control" name="special" id="inputPassword4">
          </div>
        <div class="col-6">
          <label for="inputAddress" class="form-label">Address</label>
          <input type="text" class="form-control" id="inputAddress" name="address1" placeholder="1234 Main St">
        </div>
        <div class="col-6">
          <label for="inputAddress2" class="form-label">Address 2</label>
          <input type="text" class="form-control" id="inputAddress2" name="address2" placeholder="Apartment, studio, or floor">
        </div>
        <div class="col-md-4">
          <label for="inputCity" class="form-label">City</label>
          <input type="text" class="form-control" name="city" id="inputCity">
        </div>
        <div class="col-md-4">
          <label for="inputState" class="form-label">State</label>
          <select id="inputState" class="form-select" name="state">
            <option selected>Choose...</option>
            <option>Gujarat</option>
            <option>Rajashthan</option>
            <option>Delhi</option>
            <option>Maharashtra</option>
            <option>Karnatak</option>
            <option>Haryana</option>
            <option>Punjab</option>
          </select>
        </div>
        <div class="col-md-4">
          <label for="inputZip" class="form-label">Post</label>
          <input type="text" class="form-control" id="inputZip" name="post">
        </div>
        
        <div class="col-12">
          <button type="submit" class="btn btn-primary">Change Details</button>
        </div>
      </form>
  </div>
  
  <%
  String first=request.getParameter("first");
	String last=request.getParameter("last");
	String email_id=request.getParameter("email");
	String password=request.getParameter("password");
	String user_id=request.getParameter("user_id");
	String special=request.getParameter("special");
	String address1=request.getParameter("address1");
	String address2=request.getParameter("address2");
	String city=request.getParameter("city");
	String state=request.getParameter("state");
	String post=request.getParameter("post");
	if(user_id!=null){
		try
		{
			
				Class.forName("com.mysql.jdbc.Driver");
				
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave", "root", "root");
				
				Statement st= con.createStatement();
// 				String sql1="delete from hod_details where userid='"+user_id+"'";
				String sql="update hod_details set first_name='"+first+"',last_name='"+last+"',email_id='"+email_id+"',password='"+password+"',specialization='"+special+"',address_line1='"+address1+"',address_line2='"+address2+"',city='"+city+"',state='"+state+"',details='"+post+"' where userid='"+user_id+"'";
// 				int i=st.executeUpdate(sql1);
				int j=st.executeUpdate(sql);
// 			System.out.println(i);
			System.out.println(j);
		
		}
		catch(Exception e)
		{
		System.out.print(e);
		e.printStackTrace();
		}
		response.sendRedirect("faculty_index.jsp");
	}
  %>
</body>
</html>
<%
	}
	else{
		out.println("<script>alert('SESSION INVALID!!! PLEASE LOGIN AGAIN!!!!!');</script>");
		response.sendRedirect("login.jsp");
	}
%>