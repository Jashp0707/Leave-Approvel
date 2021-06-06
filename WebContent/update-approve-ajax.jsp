
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%


String id = request.getParameter("id");

Class.forName("com.mysql.jdbc.Driver");
System.out.println(id);
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave", "root", "root");
Statement st = con.createStatement();
int j=st.executeUpdate("update addleave set approved = 'Yes',pending='No' where enrollment_no ="+id+" ");

 

%>