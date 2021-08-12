<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="com.sun.mail.smtp.*"%>
<%@page import="com.sun.mail.smtp.SMTPTransport"%>
<%@page import="java.util.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.activation.*"%>
<%@ page session="true"%>
<%
	class InvalidEmailException extends Exception{  
	 InvalidEmailException(String s){  
	   
	 }  
	}
final String from="jashp0707@gmail.com";

final String to=request.getParameter("id");

final String host = "smtp.gmail.com";//or IP address
final String uname="jashp0707@gmail.com";
final String pwd="J@shpatel7701";


 
 
 Properties props = new Properties();    
 props.put("mail.smtp.host", "smtp.gmail.com");    
 props.put("mail.smtp.socketFactory.port", "465");    
 props.put("mail.smtp.socketFactory.class",    
           "javax.net.ssl.SSLSocketFactory");    
 props.put("mail.smtp.auth", "true");    
 props.put("mail.smtp.port", "465");
 Session session1 = Session.getInstance(props,    
         new javax.mail.Authenticator() {    
         protected PasswordAuthentication getPasswordAuthentication() {    
         return new PasswordAuthentication(from,pwd);  
         }    
        });    
 try {    
	 Class.forName("com.mysql.jdbc.Driver");

		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave", "root", "root");
		Statement st = con.createStatement();
		String sql = "select * from login where email_id='" + to + "'";
		ResultSet rs = st.executeQuery(sql);
		if(rs.next()){
     		MimeMessage message = new MimeMessage(session1);    
     		message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
		     message.setSubject("Your Password for Leave Portal");    
		     message.setText("Dear User,\n\nYour password is: "+rs.getString("password"));    
		     //send message  
		     Transport.send(message);    
		     System.out.println("message sent successfully");
     			} else {
			System.out.println("error");
			throw new InvalidEmailException("Email is not registered.");
			
		}
	
	} catch (MessagingException e) {
		throw new RuntimeException(e);
	}
%>