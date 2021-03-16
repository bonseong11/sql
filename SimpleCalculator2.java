package b_operator;

import java.util.Scanner;

public class SimpleCalculator2 {

	public static void main(String[] args) {
		
		
		// 두개의 숫자와 연산자를 입력받아 연산결과를 알려주는 프로그램을 만들어주세요.
				Scanner sc=new Scanner(System.in);
				
				System.out.print("첫번째 숫자입력");
				double num1=Double.parseDouble(sc.nextLine());
				
				System.out.print("두번째 숫자입력>");
				double num2=Double.parseDouble(sc.nextLine());
				
				System.out.print("연산자 입력");
				char str=sc.nextLine().charAt(0);
				
				
				
				double res = str =='+'? num1+num2 : str =='-'? num1-num2 : str =='*'? num1*num2 : str =='/'? num1/num2 : str =='%'? num1%num2 : 0.0;
				
				System.out.print(res==0.0? "확인불가": "답 :"+ res );


				
	}

}




