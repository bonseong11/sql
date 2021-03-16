package b_operator;

public class ComparingOperator {

	public static void main(String[] args) {
		
		/*
		 * 비교 연산자
		 * - <, >, <=, >= ==, !=
		 * - 문자열 비교 : equals()
		 */
		
		int x = 10;
		int y = 20;
		boolean b = x < y;
		System.out.println(b);
		
		b = x <= y - 15; // 산술연산 먼저 값을 뺀후에 비교함 우선순위가 더 높음
		System.out.println(b);
		
		
		//문자열 비교 (문자 내용을 비교한게 아님) String : 참조형 타입
		String str1 = "abc";
		String str2 = "abc";
		b = str1 == str2; //문자열의 내용이 아닌 주소를 비교한 것이다.
		System.out.println(b);
		
		b = str1.equals(str2); //equals를 쓰면 문자열의 내용을 비교 할 수 있음
		System.out.println(b);
		b = !str1.equals(str2); //!는 부정의 의미 결과를 반대로 바꿈 기존에 true이면 false로 바뀜
		System.out.println(b);
		
		//다음의 문장들을 코드로 작성해주세요.
		//1. x는 y보다 적거나 같다.
		b = x <= y;
		//2. x + 5와 y는 같다.
		b = x + 5 == y;
		//3. y는 홀수이다.
		b = y % 2 == 1;
		//4. "기본형"과 "참조형"은 다르다.
		b = !"기본형".equals("참조형");
		
	}

}
