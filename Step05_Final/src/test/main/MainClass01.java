package test.main;

import java.net.URLEncoder;

public class MainClass01 {
	public static void main(String[] args) {
		String str1="abcd1234";
		String str2="가";
		String str3="?";
		String str4="가나다abc?=&";
		
		String result1=URLEncoder.encode(str1);
		String result2=URLEncoder.encode(str2);
		String result3=URLEncoder.encode(str3);
		String result4=URLEncoder.encode(str4);
	}
}
