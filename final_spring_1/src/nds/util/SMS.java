package nds.util;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
 */
public class SMS {

    String api_key = "NCSSN0PYVAY1DJRX";
    String api_secret = "N5TTYS3RV82VCWHDAHYJ3EWDNXNWKVCX";
    Message coolsms = new Message(api_key, api_secret);
    // 4 params(to, from, type, text) are mandatory. must be filled
    HashMap<String, String> params = new HashMap<String, String>();

    public void send(String receiver, String content) {
    	params.put("to", receiver);			// 수신자
    	params.put("from", "01080828353");	// 발신자 - 고정
    	params.put("type", "SMS");
    	params.put("text", content);		// 메세지 내용
    	params.put("app_version", "test app 1.2"); // application name and version
    	try {
    		JSONObject obj = (JSONObject) coolsms.send(params);
    		System.out.println(obj.toString());
    	} catch (CoolsmsException e) {
    		System.out.println(e.getMessage());
    		System.out.println(e.getCode());
    	}
    }


}