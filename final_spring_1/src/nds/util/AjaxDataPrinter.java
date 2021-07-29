package nds.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class AjaxDataPrinter {

	/***************************************************
	 * @param pres: Writer를 제공하는 HttpServletResponse 객체
	 * @param data: 출력할 데이터 
	 **************************************************/
	public static void out(HttpServletResponse pres, Object data){
		pres.setCharacterEncoding("UTF-8");
		pres.setContentType("text/text");
		try {
			PrintWriter writer = pres.getWriter();
			writer.print(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/***************************************************
	 * @param pres: Writer를 제공하는 HttpServletResponse 객체
	 * @param contentType: text/html, text/xml, application/json 등
	 * application/json 타입으로 설정하는 경우, javascript 쪽에서 const j = JSON.parse(data)한 후, 
	 * j[0].key와 같은 방법으로 값을 꺼내야 한다.
	 * @param data: 출력할 데이터 
	 **************************************************/
	public static void out(HttpServletResponse pres, String contentType, Object data){
		// PrintWriter를 사용해서 데이터를 화면에 내보낼때 우선적으로 res의 인코딩타입을 정해주어야 한다.
		// 인코딩 타입만 문제가 되는 것이라면 setContentType/setCharacterEncoding 둘 중 어느 것을 사용해도 괜찮다.
		// res.setContentType("text/html;charset=utf-8");
		pres.setCharacterEncoding("UTF-8");
		pres.setContentType(contentType);
		// IO는 항상 try-catch로 감싸야 함.
		try {
			PrintWriter writer = pres.getWriter();
			writer.print(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
