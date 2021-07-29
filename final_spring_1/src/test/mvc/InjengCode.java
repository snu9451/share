package test.mvc;


import java.util.ArrayList;
import java.util.Random;

public class InjengCode {
	
	
	public static void main(String[] args) {
		
		ArrayList<String> result = new ArrayList<String>();
		
		String[] eng =  {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
		
		String[] eng2 = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
		
		Random r = new Random();

		for(int j=0; j<10; j++) {
			
			int which = r.nextInt(3);
					
			// 숫자
			if(which == 0) {
				// 0부터 9까지 중 랜덤한 숫자를 가져와줘.
				int s = r.nextInt(10);
				result.add(String.valueOf(s));
			}
			// 영어 대문자
			else if(which == 1) {
				// 대문자 배열 중 몇번째 방의 문자를 가져올거니?
				int i = r.nextInt(26);
				result.add(eng[i]);
			}
			// 영어 소문자
			else if(which == 2) {
				// 소문자 배열 중 몇번째 방의 문자를 가져올거니?
				int k = r.nextInt(26);
				result.add(eng2[k]);
				
			}
		}
		StringBuilder sb = new StringBuilder();
		for(int index=0; index<10; index++) {
			sb.append(result.get(index));
		}
		
		System.out.println(sb.toString());
	}

}
