package com.yesbulo.cardatacolsystem.tools;

import java.net.URL;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/**
 * <p>@Title:GetLocation</P>
 * <p>@Description:carDataColSystem</P>
 * <p>@Company: RongleXie </P>
 * <p>@author xieqingrong</p>
 * <p>@date 2016-9-27 下午11:58:24</p>
 */

public class GetLocation {
	public static void main(String[] args) {
		
		String lString = new GetLocation().getLocation("107.508927", "31.196504");
		System.out.println(lString);
	}
	
	public static String getAdd(String log, String lat ){
		//lat 小  log  大
		//参数解释: 纬度,经度 type 001 (100代表道路，010代表POI，001代表门址，111可以同时显示前三项)
		String urlString = "http://gc.ditu.aliyun.com/regeocoding?l="+lat+","+log+"&type=010";
		String res = "";   
        try {   
            URL url = new URL(urlString);  
            java.net.HttpURLConnection conn = (java.net.HttpURLConnection)url.openConnection();  
            conn.setDoOutput(true);  
            conn.setRequestMethod("POST");  
            java.io.BufferedReader in = new java.io.BufferedReader(new java.io.InputStreamReader(conn.getInputStream(),"UTF-8"));  
            String line;  
           while ((line = in.readLine()) != null) {  
               res += line+"\n";  
         }  
            in.close();  
        } catch (Exception e) {  
            System.out.println("error in wapaction,and e is " + e.getMessage());  
        } 
        System.out.println(res);
        return res;  
	}
	public String getLocation(String log, String lat) {
		String urlString = "http://gc.ditu.aliyun.com/regeocoding?l="+lat+","+log+"&type=010";
		String res = "";   
        try {   
            URL url = new URL(urlString);  
            java.net.HttpURLConnection conn = (java.net.HttpURLConnection)url.openConnection();  
            conn.setDoOutput(true);  
            conn.setRequestMethod("POST");  
            java.io.BufferedReader in = new java.io.BufferedReader(new java.io.InputStreamReader(conn.getInputStream(),"UTF-8"));  
            String line;  
           while ((line = in.readLine()) != null) {  
               res += line+"\n";  
         }  
            in.close();  
        } catch (Exception e) {  
            System.out.println("error in wapaction,and e is " + e.getMessage());  
        } 
        //System.out.println(res);
        JSONObject jsonObject = JSONObject.fromObject(res);
		JSONArray jsonArray = JSONArray.fromObject(jsonObject.getString("addrList"));
		JSONObject j_2 = JSONObject.fromObject(jsonArray.get(0));
		String allAdd = j_2.getString("admName");
		String arr[] = allAdd.split(",");
		String location = arr[0] + arr[1];
		return location;
	}
	
}

