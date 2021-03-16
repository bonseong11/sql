package b_operator;

public class LogicalOperator {

	public static void main(String[] args) {
		/*
		 * 논리연산자
		 * - &&(AND) 양쪽의 ture ture 일때 true, ||(OR) 둘중 하나가 ture 이면 ture, !(NOT)
		 * - 피연산자로 boolean만 허용한다. 비교했을때 boolean 타입의 값이 나왔다.
		 */
		int x = 10;
		int y = 20;
		boolean b = 0 < x && x < 10 || x < y; // AND(&&),OR(||)가 함께 있으면 AND가 우선순위가 높다.
		
		b = !(x <y); //boolean 타입 이므로 느낌표 뒤에는 ()가 들어감
		
		//효율적 연산
		b = true && true; //true
		b = true && false; //false
		b = false && true; //false
		b = false && false; //false
		
		b = true || true; //true
		b = true || false; //true
		b = false || true; //true
		b = false || false; //false
		//왼쪽의 피연산자에서 결과가 정해지면 오른쪽은 수행하지 않는다. 확인하지 않는것은 노란줄이 뜸
		
		int a = 10;
		b = a <5 && 0 < a++; //앞쪽에서 false가 떠서 뒤쪽에 있는 a++이 실행되지 않음 왜냐 둘다 ture 여야 하니까.
		System.out.println(a);
		
		//다음의 문장들을 코드로 작성해주세요
		//1. x가 y보다 크고 x가 10보다 작다
		b = x < y && x < 10;
		//2. x가 짝수이고 y보다 작거나 같다.
		b = x % 2 == 0 && x <= y;
		//3. x가 3의 배수이거나 5의 배수이다.
		b = x % 3 == 0 || x % 5 == 0;
	}

}
