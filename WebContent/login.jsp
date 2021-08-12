



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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$(".forgot").click(function() {
		var id2 = document.getElementById("email").value;
		/* $("#getOTP").prop('disabled', true);
		alert("OTP sent!!!"); */
		console.log("inside");
		
		$.ajax({
			url : "forgotPassword.jsp",
			type : "post",
			data : {
				id : id2,
			},
			success : function(data) {
				alert("Your password is sent. Please check your registered email.")
			},
			error : function(data) {
				alert("Your email is not registered.")
			}
		});
		
	});
});
        </script>
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
				<li><a href="index.jsp" class="nav-link px-2 text-white">Home</a></li>
				<li><a href="#" class="nav-link px-2 text-white">Academics</a></li>
				<li><a href="#" class="nav-link px-2 text-white">About Us</a></li>
				<li><a href="#" class="nav-link px-2 text-white" aria-disabled="true">Contact Us</a></li>


			</ul>
			<div class="text-end">
        
        
           
        
          
            <button type="button" class="btn btn-warning" formaction="signup.jsp"><a href="signup.jsp" class="text-decoration-none" style="color: white;">Sign-up</a></button>

        
          
        </div>




		</div>
	</div>
	</header>
	


	<!--   main -->

	<div
		class="container-sm constainer-md position-absolute top-50 start-50 translate-middle text-center">
		<form action="login.jsp">
		<!-- <form action="forgotPassword.jsp" id="forgot"> -->
			<div class="row mb-3 mx-auto w-50">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" name="email"
						id="email" required>
				</div>
			</div>
			<!-- </form> -->
			<div class="row mb-3 mx-auto w-50">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="password"
						id="inputPassword3" required>
				</div>
			</div>
			
			<div >
							<input type="radio" id="javascript" name="post" value="Student" checked="checked">
								<label for="javascript" style="margin: 2%; ">Student</label>
								<input type="radio" id="html" name="post" value="Faculty">
								<label for="html" style="margin: 2%; ">Faculty</label>
								<input type="radio" id="html" name="post" value="HOD">
								<label for="html" style="margin: 2%; ">HOD</label>
								
							</div>
							<button type="button" class="forgot" style="border-color:white;background: white;-webkit-appearance: media-slider; margin-bottom:2%;">Forgot Password?</button>

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
			String sql = "select * from login where email_id='" + email_id + "' and password='"
					+ password + "' and details='" + details + "'";
			ResultSet rs = st.executeQuery(sql);
			
			if (rs.next()) {
				if (rs.getString("details").equals("Student")) {
					String id=rs.getString("userid");
					String Uname=request.getParameter("email");
					session.setAttribute("adminUsername" ,Uname);
					session.setAttribute("id" ,id);
					session.setAttribute("role" ,"Student");
					session.setAttribute("username",rs.getString("first_name"));
					response.sendRedirect("student_index.jsp");
					
					
				} else  {
					String id=rs.getString("userid");
					String Uname=request.getParameter("email");
					session.setAttribute("adminUsername" ,Uname);
					session.setAttribute("id" ,id);
					session.setAttribute("role" ,rs.getString("details"));
					session.setAttribute("username",rs.getString("first_name"));
					response.sendRedirect("faculty_index.jsp");
				}
				

			} else {
				out.println("<meta http-equiv='refresh' content='0.1;URL=login.jsp'>");//redirects after 3 seconds
				   
				
				out.println("<script>alert('Wrong username or password');</script>");
				
			}
		}

		
	%>






</body>
</html>

