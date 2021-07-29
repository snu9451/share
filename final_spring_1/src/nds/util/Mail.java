package nds.util;

//////////////////////////////// 회원가입 링크를 전송하기 위한 클래스 ///////////////////////////////////
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
////////////////////////////////// [[[ 보내는 계정 정보 ]]] /////////////////////////////////////////////////
	//stamp 서버명
	final String host = "smtp.naver.com";
	//네이버 아이디
	final String user = "yukey1996";
	//비밀번호
	final String password = "kosmo1234";
	//보내는 이메일
	final String sendEmailAddress = "yukey1996@naver.com";
	//포트번호
	final int port = 465;
	int code = 0;
////////////////////////////////// [[[ 받는 계정 정보 선언]]] /////////////////////////////////////////////////
	//받는 계정 주소
	String receiveEmailAddress = null;
	//메일 제목
	String subject = "[내동생] 회원가입 링크입니다.";
	//메일 내용
	String content = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n" + 
			"<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n" + 
			"<head>\r\n" + 
			"<!--[if gte mso 9]>\r\n" + 
			"<xml>\r\n" + 
			"  <o:OfficeDocumentSettings>\r\n" + 
			"    <o:AllowPNG/>\r\n" + 
			"    <o:PixelsPerInch>96</o:PixelsPerInch>\r\n" + 
			"  </o:OfficeDocumentSettings>\r\n" + 
			"</xml>\r\n" + 
			"<![endif]-->\r\n" + 
			"  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n" + 
			"  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
			"  <meta name=\"x-apple-disable-message-reformatting\">\r\n" + 
			"  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->\r\n" + 
			"  <title></title>\r\n" + 
			"  \r\n" + 
			"    <style type=\"text/css\">\r\n" + 
			"      table, td { color: #000000; } @media (max-width: 480px) { #u_content_text_2 .v-text-align { text-align: center !important; } }\r\n" + 
			"@media only screen and (min-width: 570px) {\r\n" + 
			"  .u-row {\r\n" + 
			"    width: 550px !important;\r\n" + 
			"  }\r\n" + 
			"  .u-row .u-col {\r\n" + 
			"    vertical-align: top;\r\n" + 
			"  }\r\n" + 
			"\r\n" + 
			"  .u-row .u-col-100 {\r\n" + 
			"    width: 550px !important;\r\n" + 
			"  }\r\n" + 
			"\r\n" + 
			"}\r\n" + 
			"\r\n" + 
			"@media (max-width: 570px) {\r\n" + 
			"  .u-row-container {\r\n" + 
			"    max-width: 100% !important;\r\n" + 
			"    padding-left: 0px !important;\r\n" + 
			"    padding-right: 0px !important;\r\n" + 
			"  }\r\n" + 
			"  .u-row .u-col {\r\n" + 
			"    min-width: 320px !important;\r\n" + 
			"    max-width: 100% !important;\r\n" + 
			"    display: block !important;\r\n" + 
			"  }\r\n" + 
			"  .u-row {\r\n" + 
			"    width: calc(100% - 40px) !important;\r\n" + 
			"  }\r\n" + 
			"  .u-col {\r\n" + 
			"    width: 100% !important;\r\n" + 
			"  }\r\n" + 
			"  .u-col > div {\r\n" + 
			"    margin: 0 auto;\r\n" + 
			"  }\r\n" + 
			"}\r\n" + 
			"body {\r\n" + 
			"  margin: 0;\r\n" + 
			"  padding: 0;\r\n" + 
			"}\r\n" + 
			"\r\n" + 
			"table,\r\n" + 
			"tr,\r\n" + 
			"td {\r\n" + 
			"  vertical-align: top;\r\n" + 
			"  border-collapse: collapse;\r\n" + 
			"}\r\n" + 
			"\r\n" + 
			"p {\r\n" + 
			"  margin: 0;\r\n" + 
			"}\r\n" + 
			"\r\n" + 
			".ie-container table,\r\n" + 
			".mso-container table {\r\n" + 
			"  table-layout: fixed;\r\n" + 
			"}\r\n" + 
			"\r\n" + 
			"* {\r\n" + 
			"  line-height: inherit;\r\n" + 
			"}\r\n" + 
			"\r\n" + 
			"a[x-apple-data-detectors='true'] {\r\n" + 
			"  color: inherit !important;\r\n" + 
			"  text-decoration: none !important;\r\n" + 
			"}\r\n" + 
			"\r\n" + 
			"</style>\r\n" + 
			"  \r\n" + 
			"  \r\n" + 
			"\r\n" + 
			"<!--[if !mso]><!--><link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap\" rel=\"stylesheet\" type=\"text/css\"><!--<![endif]-->\r\n" + 
			"\r\n" + 
			"</head>\r\n" + 
			"\r\n" + 
			"<body class=\"clean-body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #ffffff;color: #000000\">\r\n" + 
			"  <!--[if IE]><div class=\"ie-container\"><![endif]-->\r\n" + 
			"  <!--[if mso]><div class=\"mso-container\"><![endif]-->\r\n" + 
			"  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #ffffff;width:100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n" + 
			"  <tbody>\r\n" + 
			"  <tr style=\"vertical-align: top\">\r\n" + 
			"    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\r\n" + 
			"    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #ffffff;\"><![endif]-->\r\n" + 
			"    \r\n" + 
			"\r\n" + 
			"<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\r\n" + 
			"  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #d6ba89;\">\r\n" + 
			"    <div style=\"border-collapse: collapse;display: table;width: 100%;background-image: url('images/image-1.png');background-repeat: repeat;background-position: center top;background-color: transparent;\">\r\n" + 
			"      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-image: url('images/image-1.png');background-repeat: repeat;background-position: center top;background-color: #d6ba89;\"><![endif]-->\r\n" + 
			"      \r\n" + 
			"<!--[if (mso)|(IE)]><td align=\"center\" width=\"534\" style=\"width: 534px;padding: 0px;border-top: 8px solid #000000;border-left: 8px solid #000000;border-right: 8px solid #000000;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\r\n" + 
			"<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\r\n" + 
			"  <div style=\"width: 100% !important;\">\r\n" + 
			"  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 8px solid #000000;border-left: 8px solid #000000;border-right: 8px solid #000000;border-bottom: 0px solid transparent;\"><!--<![endif]-->\r\n" + 
			"  \r\n" + 
			"<table style=\"font-family:'Montserrat',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n" + 
			"  <tbody>\r\n" + 
			"    <tr>\r\n" + 
			"      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:42px;font-family:'Montserrat',sans-serif;\" align=\"left\">\r\n" + 
			"        \r\n" + 
			"  <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"1%\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 1px solid #fc5656;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\r\n" + 
			"    <tbody>\r\n" + 
			"      <tr style=\"vertical-align: top\">\r\n" + 
			"        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\r\n" + 
			"          <span>&#160;</span>\r\n" + 
			"        </td>\r\n" + 
			"      </tr>\r\n" + 
			"    </tbody>\r\n" + 
			"  </table>\r\n" + 
			"\r\n" + 
			"      </td>\r\n" + 
			"    </tr>\r\n" + 
			"  </tbody>\r\n" + 
			"</table>\r\n" + 
			"\r\n" + 
			"<table style=\"font-family:'Montserrat',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n" + 
			"  <tbody>\r\n" + 
			"    <tr>\r\n" + 
			"      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:'Montserrat',sans-serif;\" align=\"left\">\r\n" + 
			"        \r\n" + 
			"  <div class=\"v-text-align\" style=\"color: #ffffff; line-height: 100%; text-align: left; word-wrap: break-word;\">\r\n" + 
			"    <p style=\"line-height: 100%; text-align: center; font-size: 14px;\"><span style=\"font-size: 48px; line-height: 48px;\"><strong>내동생</strong></span></p>\r\n" + 
			"<p style=\"line-height: 100%; text-align: center; font-size: 14px;\">&nbsp;</p>\r\n" + 
			"<p style=\"line-height: 100%; text-align: center; font-size: 14px;\"><span style=\"font-size: 30px; line-height: 30px;\"><strong>회원가입</strong> 하러가기</span></p>\r\n" + 
			"  </div>\r\n" + 
			"\r\n" + 
			"      </td>\r\n" + 
			"    </tr>\r\n" + 
			"  </tbody>\r\n" + 
			"</table>\r\n" + 
			"\r\n" + 
			"<table style=\"font-family:'Montserrat',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n" + 
			"  <tbody>\r\n" + 
			"    <tr>\r\n" + 
			"      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:'Montserrat',sans-serif;\" align=\"left\">\r\n" + 
			"        \r\n" + 
			"  <div class=\"v-text-align\" style=\"color: #ffffff; line-height: 140%; text-align: center; word-wrap: break-word;\">\r\n" + 
			"    <p style=\"font-size: 14px; line-height: 140%;\">내동생에 오신 것을 환영합니다.</p>\r\n" + 
			"<p style=\"font-size: 14px; line-height: 140%;\">아래 링크를 클릭하여 <strong>회원가입</strong>을 진행해주세요.</p>\r\n" + 
			"  </div>\r\n" + 
			"\r\n" + 
			"      </td>\r\n" + 
			"    </tr>\r\n" + 
			"  </tbody>\r\n" + 
			"</table>\r\n" + 
			"\r\n" + 
			"<table style=\"font-family:'Montserrat',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n" + 
			"  <tbody>\r\n" + 
			"    <tr>\r\n" + 
			"      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 10px 0px;font-family:'Montserrat',sans-serif;\" align=\"left\">\r\n" + 
			"        \r\n" + 
			"  <div class=\"v-text-align\" style=\"color: #ffffff; line-height: 140%; text-align: left; word-wrap: break-word;\">\r\n" + 
			"    <p style=\"font-size: 14px; line-height: 140%; text-align: center;\"><span style=\"font-size: 24px; line-height: 33.6px; color: #34495e;\"><strong><span><a href=\"http://localhost:9696/mainPage/reqJoinView.nds\" style=\"line-height: 33.6px; font-size: 24px; color: #5e4121; text-decoration: none\">클릭하여 회원가입하기</a></span></strong></span></p>\r\n" + 
			"  </div>\r\n" + 
			"\r\n" + 
			"      </td>\r\n" + 
			"    </tr>\r\n" + 
			"  </tbody>\r\n" + 
			"</table>\r\n" + 
			"\r\n" + 
			"<table style=\"font-family:'Montserrat',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n" + 
			"  <tbody>\r\n" + 
			"    <tr>\r\n" + 
			"      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:20px;font-family:'Montserrat',sans-serif;\" align=\"left\">\r\n" + 
			"        \r\n" + 
			"  <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"1%\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 1px solid #fc5656;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\r\n" + 
			"    <tbody>\r\n" + 
			"      <tr style=\"vertical-align: top\">\r\n" + 
			"        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\r\n" + 
			"          <span>&#160;</span>\r\n" + 
			"        </td>\r\n" + 
			"      </tr>\r\n" + 
			"    </tbody>\r\n" + 
			"  </table>\r\n" + 
			"\r\n" + 
			"      </td>\r\n" + 
			"    </tr>\r\n" + 
			"  </tbody>\r\n" + 
			"</table>\r\n" + 
			"\r\n" + 
			"<table id=\"u_content_text_2\" style=\"font-family:'Montserrat',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n" + 
			"  <tbody>\r\n" + 
			"    <tr>\r\n" + 
			"      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 10px 17px 20px;font-family:'Montserrat',sans-serif;\" align=\"left\">\r\n" + 
			"        \r\n" + 
			"  <div class=\"v-text-align\" style=\"color: #ffffff; line-height: 140%; text-align: center; word-wrap: break-word;\">\r\n" + 
			"    <p style=\"font-size: 14px; line-height: 140%; text-align: left;\">from NDS_Company</p>\r\n" + 
			"  </div>\r\n" + 
			"\r\n" + 
			"      </td>\r\n" + 
			"    </tr>\r\n" + 
			"  </tbody>\r\n" + 
			"</table>\r\n" + 
			"\r\n" + 
			"  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\r\n" + 
			"  </div>\r\n" + 
			"</div>\r\n" + 
			"<!--[if (mso)|(IE)]></td><![endif]-->\r\n" + 
			"      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\r\n" + 
			"    </div>\r\n" + 
			"  </div>\r\n" + 
			"</div>\r\n" + 
			"\r\n" + 
			"\r\n" + 
			"\r\n" + 
			"<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\r\n" + 
			"  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #000000;\">\r\n" + 
			"    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\r\n" + 
			"      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #000000;\"><![endif]-->\r\n" + 
			"      \r\n" + 
			"<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\r\n" + 
			"<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\r\n" + 
			"  <div style=\"width: 100% !important;\">\r\n" + 
			"  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\r\n" + 
			"  \r\n" + 
			"<table style=\"font-family:'Montserrat',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n" + 
			"  <tbody>\r\n" + 
			"    <tr>\r\n" + 
			"      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:40px;font-family:'Montserrat',sans-serif;\" align=\"left\">\r\n" + 
			"        \r\n" + 
			"  <div class=\"v-text-align\" style=\"color: #828388; line-height: 140%; text-align: left; word-wrap: break-word;\">\r\n" + 
			"    <p style=\"font-size: 14px; line-height: 140%; text-align: center;\"><span style=\"font-size: 14px; line-height: 19.6px;\">&copy; NDS.&nbsp; 2021 All Rights Reserved </span></p>\r\n" + 
			"  </div>\r\n" + 
			"\r\n" + 
			"      </td>\r\n" + 
			"    </tr>\r\n" + 
			"  </tbody>\r\n" + 
			"</table>\r\n" + 
			"\r\n" + 
			"  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\r\n" + 
			"  </div>\r\n" + 
			"</div>\r\n" + 
			"<!--[if (mso)|(IE)]></td><![endif]-->\r\n" + 
			"      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\r\n" + 
			"    </div>\r\n" + 
			"  </div>\r\n" + 
			"</div>\r\n" + 
			"\r\n" + 
			"\r\n" + 
			"    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\r\n" + 
			"    </td>\r\n" + 
			"  </tr>\r\n" + 
			"  </tbody>\r\n" + 
			"  </table>\r\n" + 
			"  <!--[if mso]></div><![endif]-->\r\n" + 
			"  <!--[if IE]></div><![endif]-->\r\n" + 
			"</body>\r\n" + 
			"\r\n" + 
			"</html>\r\n" + 
			"";
//////////////////////////////////////////////////////////////////////////////////////////////////////
	Properties props = null;
	Session session = null;
	
////////////////////////////////// [[[ 받는 계정 정보 초기화]]] /////////////////////////////////////////////////
	public int setReceiveEmail(String receiveEmailAddress) {
		//받는 계정 주소
		this.receiveEmailAddress = receiveEmailAddress;
		setSMTPserver();
		sendEmail();
		return code;
	}
	public int setReceiveEmail(String receiveEmailAddress, String subject, String content) {
		//받는 계정 주소
		this.receiveEmailAddress = receiveEmailAddress;
		this.subject = subject;
		this.content = content;
		setSMTPserver();
		sendEmail();
		return code;
	}

	public void setSMTPserver() {
    	//SMTP 서버 정보 설정
    	props = System.getProperties();
    	props.put("mail.smtp.host", host);
    	props.put("mail.smtp.port", port);
    	props.put("mail.smtp.auth", true);
    	props.put("mail.smtp.ssl.enable", true); 
    	props.put("mail.smtp.ssl.trust", host);    	
    }
    
    public void sendEmail() {
    	session = Session.getDefaultInstance(props, new Authenticator() {
    		protected PasswordAuthentication getPasswordAuthentication() {
    			return new PasswordAuthentication(user, password);
    		}
    	});
    	try {
    		MimeMessage message = new MimeMessage(session);
    		message.setFrom(new InternetAddress(sendEmailAddress));
    		//이메일 인증
    		message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiveEmailAddress));
    		
    		//메일 제목
    		message.setSubject(subject);
    		
    		//메일 내용
    		message.setContent(content, "text/html; charset=utf-8");
    		
    		//메시지 전송
    		Transport.send(message);
    	} catch (MessagingException e) {
    		code = 404;
    		e.printStackTrace();
    	}
    	
    }
    
//    public static void main(String[] args) {
//    	Mail m = new Mail();
//    	m.setReceiveEmail("snu9451@naver.com");
//    	m.setReceiveEmail("as97164@naver.com");
//    	m.sendEmail();
//    }
}