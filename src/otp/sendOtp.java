package otp;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;

public class sendOtp {
	
	
	public static void main(String []args){
		OTP otp=new OTP();
		String otpMessage=otp.generateOtp(6);
		
		String apikey="7ldob3evG6TYEROkmp0hq5DXPZQxA8KBgU9uWiVfzNHFncySrjYujX49JfcrkOb0dN5VIphQlwFAKtng";
		String message="Your OTP for verification is "+otpMessage;
		String number="8140508988";
		send(message,number,apikey);
		
	}
	
	public static String verify(String otpMessage){
		return otpMessage;
	}
	
	
	public static void send(String message, String number, String apikey){
		
		try{
			String sendId="TXTIND";
			String language="english";
			String route="v3";
			message=URLEncoder.encode(message,"UTF-8");
			String myUrl="https://www.fast2sms.com/dev/bulkV2?authorization="+apikey+"&sender_id=TXTIND&message="+message+"&route=v3&numbers="+number;
			URL url=new URL(myUrl);
			HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("User-Agent", "Mozilla/5.0");
			con.setRequestProperty("cache-control", "no-cache");
			
			int responseCode=con.getResponseCode();
			System.out.println("Response Code :"+responseCode);
			
			StringBuffer response=new StringBuffer();
			BufferedReader br= new BufferedReader(new InputStreamReader(con.getInputStream()));
			
			while(true){
				String line=br.readLine();
				if (line==null){
					break;
				}
				response.append(line);
			}
			
		}
		catch(Exception e){
			System.out.println(e);
		}
		
		
	}
	
	

}
