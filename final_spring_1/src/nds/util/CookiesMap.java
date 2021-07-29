package nds.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookiesMap {
	
	private Map<String, Cookie> cookiesMap = new HashMap<String, Cookie>();
	

	// ============[[ ｃｏｎｓｔｒｕｃｔｏｒ ]]===================
	// request 객체를 통해 (클라이언트)브라우저의 쿠키값을 읽어올 수 있으므로
	// CookiesMap을 생성할 때 반드시 request를 파라미터로 주입받을 수 있도록 한다.
	public CookiesMap(HttpServletRequest req) {
		Cookie cookies[] = req.getCookies();
		if(cookies!=null) {
			for(int i=0; i<cookies.length; i++) {
				// cookiesMap에 i번째 쿠키의 키(이름)와 값을 쌍으로 담는다.
				cookiesMap.put(cookies[i].getName(), cookies[i]);
			}
		}
	}
	
	// ==================[[ ｍｅｔｈｏｄ ]]====================
	// 해당 이름을 갖는 쿠키가 있는지 확인하고자 할 때 사용할 수 있는 메소드이다.
	public boolean hasName(String cookieName) {
		boolean hasName = false;
		if(cookiesMap.containsKey(cookieName)) {
			hasName = true;
		} else {
			hasName = false;
		}
		return hasName;
	}
	// 해당 값을 갖는 쿠키가 있는지 확인하고자 할 때 사용할 수 있는 메소드이다.
	public boolean hasValue(String cookieValue) {
		boolean hasValue = false;
		if(cookiesMap.containsValue(cookieValue)) {
			hasValue = true;
		} else {
			hasValue = false;
		}
		return hasValue;
	}
	// 쿠키의 이름(키)와 매핑되어 있는 값을 얻고자 할 때 사용할 수 있는 메소드이다.
	public String getValue(String cookieName) {
		String value = null;
		if(cookiesMap.containsKey(cookieName)) {
			value = cookiesMap.get(cookieName).getValue();
		}
		return value;
	}
	// maxAge 설정 등을 위해 쿠키 객체 자체가 필요한 경우도 있다. 그런 경우 사용할 수 있는 메소드이다.
	public Cookie getCookie(String cookieName) {
		Cookie cookie = null;
		if(cookiesMap.containsKey(cookieName)) {
			cookie = cookiesMap.get(cookieName);
		}
		return cookie;
	}
	
}
