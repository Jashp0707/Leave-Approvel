<%
	String userRole = new String("SUPERSTAR");

	if (session.getAttribute("role") != null) {
		userRole = (String) session.getAttribute("role");
	}
	if (userRole.equals("HOD")) {
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
<title>Faculty_Home</title>
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
			<div class="text-end">
        <p>Welcome <%
        
		String user=(String)session.getAttribute("username");
        %><b><%=user %></b></p>

				<button type="button" class="btn btn-warning">
					<a href="index.jsp" class="text-decoration-none"
						style="color: white;">Log Out</a>
				</button>
			</div>
		</div>
	</div></header>

 <!-- main -->
  
  <div class="container">
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class="active"
          aria-current="true"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item">
          <img src="1.jpg" alt="" height="30%" width="100%" >

          <div class="container">
            <div class="carousel-caption" style="color: white;">
              <h1>Example headline.</h1>
              <p>Some representative placeholder content for the first slide of the carousel.</p>
              
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <img src="2.jpg" alt="" width="100%" height="30%">

          <div class="container">
            <div class="carousel-caption" style="color: black;">
              <h1>Another example headline.</h1>
              <p>Some representative placeholder content for the second slide of the carousel.</p>
            </div>
          </div>
        </div>
        <div class="carousel-item active">
          <img src="3.jpg" alt="" width="100%" height="10%">

          <div class="container">
            <div class="carousel-caption" style="color: white;">
              <h1>One more for good measure.</h1>
              <p>Some representative placeholder content for the third slide of this carousel.</p>
              
            </div>
          </div>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev" >
        <span class="carousel-control-prev-icon" aria-hidden="true" style="color: black;"></span>
        <span class="visually-hidden" style="color: black;">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next" style="color: black;">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </div>

</body>
</html>

<%
	} else {
out.println("<meta http-equiv='refresh' content='0.1;URL=login.jsp'>");//redirects after 3 seconds
		   
		
		
		out.println("<script>alert('SESSION INVALID!!! PLEASE LOGIN AGAIN!!!!!');</script>");
	}
%>