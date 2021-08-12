package otp;

import java.util.Random;

public class OTP {
	
	public String generateOtp(int length){
		String otp;
		StringBuilder sb=new StringBuilder();
		Random random= new Random();
		
		for (int i=0; i<length; i++){
			sb.append(random.nextInt(10));
		}
		
		otp=sb.toString();
		return otp;
		
	}

}
