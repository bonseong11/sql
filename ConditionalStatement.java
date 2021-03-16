package c_statement;

import java.util.Arrays;
import java.util.Scanner;

public class ConditionalStatement {

	public static void main(String[] args) {
		
		/*
		 * 조건문
		 * - if문
		 * - switch문
		 * 
		 * if문
		 * - if(조건식){} : 조건식의 결과가 true이면 블럭안의 문장을 수행한다.
		 * - else if (조건식){} : 다수의 조건이 필요할때 if뒤에 추가한다.
		 * - else{} : 결과가 true인 조건식이 하나도 없는 겅우를 위해 추가한다.
		 */
		
		
//		int a = 1;
//		
//		if (a == 1) {
//			System.out.println("조건식의 연산결과가 ture이면 수행된다.");
//		}
//		
//		if(a == 0) {
//			System.out.println("조건식의 연산결과과 false이면 수행되지 않는다.");
//		}
//		
//		if (a == 1){//if문은 얘네들중에 하나만 실행된다. 조건이 만족하는것이 있을때//
//			System.out.println("a가 1인 경우에 하고싶은 것");
//		}else if (a == 2) {
//			System.out.println("a가 2인 경우에 하고싶은 것");
//		}else if(a == 3) {
//			System.out.println("a가 3인 경우에 하고싶은 것");
//		}else {
//			System.out.println("이외의 경우에 하고싶은 것");
//		}
//		
//		//주의 해야될점 반드시 if밑에는 else if로 조건을 추가해줘야됨//
//		
//		if (a < 10){
//			System.out.println("a가 10보다 작다.");
//		}else if(a < 20){
//			System.out.println("a가 20보다 작다.");
//		}
//		
//		int score = 70;
//		//점수가 60점 이상이면 합격 그렇지 않으면 불합격이라고 출력해주세요.
//		if (score >= 60){
//			System.out.println("합격입니다.");
//		}else {
//			System.out.println("불합격입니다.");
//		}
//		
//		//점수에 등급을 부여하는 프로그램
//		score = 40;
//		String grade = null;
//		
//		if(score >= 90){
//			grade = "A";
//		}else if (score >= 80){
//			grade = "B";
//		}else if (score >= 70){
//			grade = "C";
//		}else if(score >= 60){
//			grade = "D";
//		}else {
//			grade = "F";
//		}
//		System.out.println(score + "점에 해당하는 등급은 " + grade + "입니다.");
//		
//		/*
//		 * 기본값 : 직접 초기화 하지 않았을때 초기화 되는 값
//		 * - 참조형 타입 : null (기본값)
//		 * - boolean : false (기본값)
//		 * - char : ' '(0) (공백이 기본값 char는 실제 저장되는 값이 0이다.)
//		 * 이외의 나머지 type은 0이다.
//		 */
//		
//		
//		score = 97;
//		grade = null; //String type의 기본값
//		//정렬 : ctrl + shift + f
//		if(score >= 90){
//			grade = "A";
//			
//			if(score >= 97){
//				grade += "+";
//			}else if(score <= 93){
//				grade += "-";
//			}
//		}else if (score >= 80){
//			grade = "B";
//			
//			if(score >= 87){
//				grade += "+";
//			}else if(score <= 83){
//				grade += "-";
//			}
//		}else if (score >= 70){
//			grade = "C";
//			
//			if (score >= 77){
//				grade += "+";
//			}else if (score <= 73){
//				grade += "-";
//			}
//		}else if(score >= 60){
//			grade = "D";
//			
//			if (score >= 67){
//				grade += "+";
//			}else if (score <= 63){
//				grade += "-";
//			}
//			
//		}else {
//			grade = "F";
//		}
//		System.out.println(score + "점에 해당하는 등급은 " + grade + "입니다.");
//		
//		/*
//		 * switch문
//		 * - switch(int/String) { case 1: break; }
//		 * - 조건식의 결과는 정수와 문자열만(JDK1.7부터 문자열 허용) 허용한다.
//		 * - 조건식과 일치하는 case문 이후의 문장을 수행한다.
//		 * - 제한적이다 그래서 if문을 많이함 switch문은 if문으로 사용 가능 
//		 * - switch문이 똑같은 표현에 경우에 if문보다 빠름
//		 */
//		
//		a = 10; //int
//		switch (a) {
//		case 10:
//			System.out.println("a가 10인 경우에 하고 싶은 것");
//			break;
//		case 20:
//			System.out.println("a가 20인 경우에 하고 싶은 것");
//			break;
//			default :
//			System.out.println("이외의 경우에 하고싶은 것");
//		}
//		
//		String b = "a";
//		switch(b){
//		case "a":
//			System.out.println("b가 \"a\"인 경우에 하고싶은 것"); //역슬러시 탈출문자 뒤에 역활을 바꿔줌 문자안에 ""를 넣어주려면 역슬러시 처리
//			break;										 
//		case "b":
//			System.out.println("b가 \"a\"인 경우에 하고 싶은것");
//			break;
//		default:
//			System.out.println("이외의 경우에 하고싶은 것");
//		}
//		
//		//월에 해당하는 계절을 출력
//		int mouth = 1;
//		String season = null;
//		switch(mouth){
//		case 3 : case 4 : case 5:
//			season = "봄";
//			break;
//		case 6 : case 7 : case 8:
//			season = "여름";
//			break;
//		case 9 : case 10 : case 11:
//			season = "가을";
//			break;
//		case 12 : case 1 : case 2 :
//			season = "겨울";
//			break; // 맨밑에있는경우에는 break를 넣어줘도 안넣어줘도 상관없음
//		}
//		System.out.println(mouth + "월은 " + season + "입니다 ");
//		
//		score = 90;
//		grade = null; //초기화 하지 않고는 변수를 사용할 수 없음
//		switch(score / 10){
//		case 9 :
//			grade = "A";
//			break;
//		case 8 : 
//			grade = "B";
//			break;
//		case 7 :
//			grade = "C";
//			break;
//		case 6 :
//			grade = "D";
//			break;
//		default :
//			grade = "F";
//			break;	
//		}		
//		System.out.println(score + "점에 대한 등급은 " + grade + "입니다.");
//		
//		//숫자를 입력받아 그 숫자가 0인지 0이 아닌지 출력해주세요.
//		
//		Scanner sc = new Scanner(System.in);
//		System.out.print("숫자입력>");
//		int num = Integer.parseInt(sc.nextLine());
//		
//		if (num == 0){
//			System.out.println("맞습니다.");
//			
//		}else {
//			System.out.println("아닙니다.");
//		}
//		
//		//숫자를 입력받아 그 숫자가 홀수인지 짝수인지 출력해주세요.
//		
//		Scanner s = new Scanner(System.in);
//		System.out.println("숫자입력>");
//		int num1 = Integer.parseInt(s.nextLine());
//		
//		if (num1 % 2 == 0){
//			System.out.println("짝수입니다.");
//		}else {
//			System.out.println("홀수입니다.");
//		}
//		
//		//점수 3개를 입력받아 총점, 평균, 등급을 출력해주세요.
//		
//		Scanner c = new Scanner(System.in);
//		System.out.print("첫번째 숫자입력>");
//		int score1 = Integer.parseInt(c.nextLine());
//		System.out.print("두번째 숫자입력>");
//		int score2 = Integer.parseInt(c.nextLine());
//		System.out.print("세번째 숫자입력>");
//		int score3 = Integer.parseInt(c.nextLine());
//		
//		int sum = score1 + score2 + score3;
//		double avg = Math.round(sum / 3.0 * 100) / 100.0;
//		grade = null;
//		
//		if (avg >= 90){
//			grade = "A";
//			if (avg >= 97){
//				grade += "+";
//			}else if (avg <= 93){
//				grade += "-";
//			}
//		}else if (avg >= 80){
//			grade = "B";
//			if (avg >= 87){
//				grade += "+";
//			}else if (avg <= 83){
//				grade += "-";
//			}
//		}else if (avg >= 70){
//			grade = "C";
//			if (avg >= 77){
//				grade += "+";
//			}else if (avg <= 73){
//				grade += "-";
//			}
//		}else if (avg >= 60){
//			grade = "D";
//			if (avg >= 67){
//				grade += "+";
//			}else if (avg <= 63){
//				grade += "-";
//			}
//		}else {
//			grade = "F";
//		}
//		System.out.println("총점은 : " + sum + " 평균은 : " + avg + " 등급은 " + grade + "입니다.");
		
		//1~100 사이의 랜덤한 수를 3개 발생시키고 오름차순으로 출력해주세요.
		int random = (int)(Math.random() * 100) + 1;
		int random1 = (int)(Math.random() * 100) + 1;
		int random2 = (int)(Math.random() * 100) + 1;
		System.out.println("랜덤숫자 :  " + random + " " + random1 + " " + random2);
		
		if(random > random1 && random1 > random2){
			System.out.println("오름차순 :  " + random2 + " " + random1 + " " + random);
		}else if(random1 > random2 && random2 > random){
			System.out.println("오름차순 :  " + random + " " + random2 + " " + random1);
		}else if(random2 > random && random > random1){
			System.out.println("오름차순 :  " + random1 + " " + random + " " + random2);
		}else if(random > random2 && random2 > random1){
			System.out.println("오름차순 :  " + random1 + " " + random2 + " " + random);
		}else if(random1 > random && random > random2){
			System.out.println("오름차순 :  " + random2 + " " + random + " " + random1);
		}else if(random2 > random1 && random1 > random){
			System.out.println("오름차순 :  " + random + " " + random1 + " " + random2);
		}
	
		int x = (int)(Math.random() * 100) + 1;
		int y = (int)(Math.random() * 100) + 1;
		int z = (int)(Math.random() * 100) + 1;
		
			if(x > y){//x가 y보다 크다면 x가 y로 바꿔줌
				int t = x;
				x = y;
				y = t;
			}
			if(x > z){//x가 z보다 크다면 x에 z값을 으로 자리를 바꿔줌
				int t = x;
				x = z;
				z = t;
			}if (y > z){
				int t = y;
				y = z;
				z = t;
			}
			System.out.println(x + " < " + y + " < " + z);
	
	}
			
		
}


