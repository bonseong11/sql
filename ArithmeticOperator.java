package b_operator;

public class ArithmeticOperator {

	public static void main(String[] args) {
		/*
		 * 산술 연산
		 * - 사칙연산 : +, -, *, /, %(나머지)
		 * - 복합연산자 : +=, -=, *=, /=, %=
		 * - 증감연산자 : ++, --
		 */
		
		int result = 10 + 20 -30 * 40 / 50 % 60;
		System.out.println(result);
		
		// 나머지 연산
		result = 10 / 3;
		System.out.println(result);
		result = 10 % 3;
		System.out.println(result);
		
		//5개의 산술연사자를 사용해 5개의 연산을 수행 후 출력해주세요.
		result = 10 + 40;
		System.out.println(result);
		result = 10 - 50;
		System.out.println(result);
		result = 10 * 40;
		System.out.println(result);
		result = 10 / 5;
		System.out.println(result);
		result = 10 % 40;
		System.out.println(result);
		
		
		//복합연산자
		result = result + 3;
		
		result += 3;
		
		result -= 5;
		
		result *= 2;
		
		//아래의 문장을 복합연산자를 사용한 문장으로 만들어주세요
		//result = result + 10;
		result += 10;
		
		//result = result % 5;
		result %= 5;
		
		//result = result - 2 * 3;
		result -= 2 * 3;
		
		//증감연산자
		//증가연산자(++) : 변수의 값을 1 증가시킨다
		//감소연산자(--) : 변수의 값을 1 감소시킨다
		int i = 0;
		++i; //전위형  : 변수의 값을 읽어오기 전에 1 증가된다.
		i++; //후위형  : 변수의 값을 읽어온 후에 1 증가된다.
		--i; //전위형  : 변수의 값을 읽어오기 전에 1 감소된다.
		i--; //후위형  : 변수의 값을 읽어온 후에 1 감소된다.
		
		i = 0;
		System.out.println("++i = " + ++i);
		i = 0;
		System.out.println("i++ = " + i++);
		System.out.println(i);
		
		//피연산자의 타입이 서로 같아야만 연산이 가능하다. int + int , long + long 
		int _int = 10;
		double _double = 3.14;
		double result2 = _int + _double; //형변환 자동으로 이루어짐 작은타입에서 큰타입으로 갈때 자동으로 이루어짐(형변환 생략)
		System.out.println(result2);
		
		long _long = 100L;
		_long = _int + _long;
		_int = _int + (int)_long;
		
		byte _byte = 5;
		short _short = 10;
		_int = _byte + _short; //int보다 작은 타입은 int로 형변환된다. 
							   //연산을할때 최소단위가 4byte가 되어야지 할수있음
		char _char = 'a';      //유니코드로 바껴서 연산됨 (문자같은경우)
		char _char2 = 'b';
		_int = _char + _char2;
		System.out.println(_int);
		
		//오버플로우 (가장 큰 값을 벗어나는 현상 128은 -128로), 언더플로우 (-129는 127이 됨)
		//표현범위를 벗어나는 값을 표현할 때 발생하는 현상 (가장 큰 값을 벗어나는 현상)
		byte b = 127;
		b++;
		System.out.println(b);
		b--;
		System.out.println(b);
		
		//00000000 -2^7 ~ 2^7 - 1 (byte의 표현 범위)
		//2^7 = 128
		//-2^15 ~ 2^15 - 1 (short)
		//-2^31 ~ 2^31 - 1 (int)
		//-2^63 ~ 2^63 - 1 (long)
		//0~2^16 (char)
		
		//다음을 한줄씩 계산해서 최종 결과값을 출력해주세요.
		//1. 123456 + 654321
		//2. 1번의 결과값 * 123456
		//3. 2번의 결과값 / 123456
		//4. 3번의 결과값 - 654321
		//5. 4번의 결과값 % 123456
		
		long res = 123456 + 654321;
		//res = res * 123456;
		res *= 123456;
		res /= 123456;
		res -= 654321;
		res %= 123456;
		System.out.println(res);
				
	
		//3개의 int형 변수를 선언 및 초기화 후 합계와 평균을 출력해주세요
		int a1 = 15;
		int b1 = 27;
		int c1 = 46;
		int sum = a1 + b1 + c1;
		double avg = sum / 3.0;
		System.out.println("sum : " + sum + " avg : " + avg);
		
	
		//소수점 반올림 (첫째자리만 보이게)
		avg = Math.round(avg * 100) / 100.0; //int int라서 하나는 double로 만들어준다
		System.out.println(avg);
		
		//랜덤
		//Math.random() : 0.0 ~ 1.0미만
		int random = (int)(Math.random() * 100) + 1;
		System.out.println(random);
	}

}
