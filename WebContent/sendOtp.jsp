<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="javax.net.ssl.HttpsURLConnection"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="otp.OTP"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%


String mobile = request.getParameter("id");
System.out.println(mobile);

OTP otp = new OTP();
String otpMessage=otp.generateOtp(6);

String apikey="7ldob3evG6TYEROkmp0hq5DXPZQxA8KBgU9uWiVfzNHFncySrjYujX49JfcrkOb0dN5VIphQlwFAKtng";
String message="Your OTP for verification is "+otpMessage;
String number=mobile;


	
	try{
		String sendId="TXTIND";
		String language="english";
		String route="v3";
		message=URLEncoder.encode(message,"UTF-8");
		String myUrl="https://www.fast2sms.com/dev/bulkV2?authorization="+apikey+"&sender_id=TXTIND&message="+message+"&route=v3&numbers="+number;
		
		URL url=new URL(myUrl);
		HttpURLConnection con = (HttpsURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		con.setRequestProperty("cache-control", "no-cache");
		
		int responseCode=con.getResponseCode();
		System.out.println("Response Code :"+responseCode);
		
		StringBuffer response1=new StringBuffer();
		BufferedReader br= new BufferedReader(new InputStreamReader(con.getInputStream()));
		
		while(true){
			String line=br.readLine();
			if (line==null){
				break;
			}
			response1.append(line);
		}
		
	}
	catch(Exception e){
		System.out.println(e);
	}
	
	


Class.forName("com.mysql.jdbc.Driver");

java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave", "root", "root");
Statement st = con.createStatement();

String sql="insert into verify values('"+mobile+"', '"+otpMessage+"')";

int i=st.executeUpdate(sql);
out.println("<p style='color:red;'>OTP sent!!!</p>");
 

%>