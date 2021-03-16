package b_operator;

import java.util.Scanner;


public class ETC {

	public static void main(String[] args) {
		/*
		 * 비트 연산자
		 * - |, &, ^, ~, <<, >>
		 * - 비트 단위로 연산한다.
		 * 
		 * 기타 연산자
		 * - ,(참조연산자) : 특정 범위 내에 속해있는 멤버를 지칭할 때 사용한다.
		 * - (type) : 형변환
		 * - ?:(삼항연산자) : 조건식 ? 조건식이 참일 경우 수행할 문장 : 조건식이 거짓일 경우 수행할 문장
		 */
		
		//1byte : 01010101 
		System.out.println(10 | 15); // | : 둘다 0인 경우 0 그외 1
		//10 : 00001010 
		//15 : 00001111
		//     00001111 (비트연산 결과 위와 비교했을때 둘다 0 이면 0 하나라도 1이 있으면 1)
		
		int x = 10;
		int y = 20;
		int result = x < y ? x : y ; //x < y가 ture인 경우 문장에서 실행되는건 x가 실행됨 int result = x;
		System.out.println(result);
		
		//주민등록번호 뒷자리의 첫번째 숫자가 1이면 남자 2면 여자
		int regNo = 10; // 아무숫자나 넣어도 여자가나옴 문제가 있음
		String gender = regNo == 1 ? "남자" : "여자"; // regNo가 1 이면 ture인 남자를 출력 아니면 여자를 출력
		System.out.println("당신의 성별은" + gender + "입니다.");
		
		gender = regNo == 1 ? "남자" : (regNo == 2 ? "여자" : "성별확인불과"); //먼저 앞에 삼항연산자에서 1을 확인후 두번째 삼항연산자에서 여자인걸 판별 아니면 성별확인불과 출력
		System.out.println("당신의 성별은" + gender + "입니다.");
		
		//2개의 숫자를 입력받고, 둘중 더 큰 숫자를 출력해주세요.
		
		//Scanner sc = new Scanner(System.in); 
		//System.out.println("숫자1>");
		//int num1 = Integer.parseInt(sc.nextLine());
		//System.out.println("숫자2>");
		//int num2 = Integer.parseInt(sc.nextLine());
		
		//System.out.println(num1 < num2 ? num2 : num1);
		
		//숫자를 입력받고, 그 숫자가 1이나 3이면 남자를 2나 4면 여자를 출력해주세요.
		//그외의 숫자를 입력하면 확인불가를 출력해주세요
		
		Scanner sc = new Scanner(System.in);
		System.out.println("첫번째 숫자입력 : ");
		int num = Integer.parseInt(sc.nextLine());
		String ge = num == 1 || num == 3 ? "남자" : num == 2 || num == 4 ? "여자" : "확인불가";
		System.out.println(ge);
		
		
		
		
		
		
		
		
		
	}

}
