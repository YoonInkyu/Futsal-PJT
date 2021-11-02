package com.kh.project.common.util;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class MessageService {

	public static void sendMessage(String memberTell, String content) {
		String apikey = "NCSMLQVKZFUFPTKI"; //api key를 추가
		String apisecret = "U8XW822K9HSMWYAHJVYH2F2ET0MSWD05";  //api secret를 추가
		
		Message coolsms = new Message(apikey, apisecret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", memberTell);
		params.put("from", "01029336979");
		params.put("type", "SMS");
		params.put("text", content);
		//메소드 3개 만들어서 따로따로 실행??
		//params.put("text", "[FootBall] 용병 신청 회원이 있습니다.");
		//params.put("text", "[FootBall] 팀 가입신청 회원이 있습니다.");
		  
		try {
		   JSONObject obj = (JSONObject) coolsms.send(params);
		   System.out.println(obj.toString());
		} catch (CoolsmsException e) {
		   System.out.println(e.getMessage());
		   System.out.println(e.getCode());
		}
   }
}
