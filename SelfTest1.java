package c_statement;

import java.util.Scanner;

public class SelfTest1 {

	public static void main(String[] args) {
		
		
		System.out.println("탄수화물 중독 자가진단 테스트");
		System.out.println("1.아침을 배불리 먹은 후 점심시간 전에 배가 고프다 1.네 0.아니요");
		Scanner sc = new Scanner(System.in);
		int x = Integer.parseInt(sc.nextLine());
		System.out.println("2.밥, 빵 , 과자 등 음식을 먹기 시작하면 끝이 없다 1.네 0.아니요");
		int y = Integer.parseInt(sc.nextLine());
		System.out.println("3.음식을 금방 먹은 후에도 만족스럽지 못하고 더 먹는다 1.네 0.아니요");
		int z = Integer.parseInt(sc.nextLine());
		System.out.println("4.정말 배고프지 않더라도 먹을 때가 있다 1.네 0.아니요");
		int a = Integer.parseInt(sc.nextLine());
		System.out.println("5.저녁을 먹고 간식을 먹지 않으면 잠이 오지 않는다 1.네 0.아니요");
		int b = Integer.parseInt(sc.nextLine());
		System.out.println("6.스트레스를 받으면 자꾸 먹고 싶어진다 1.네 0.아니요");
		int c = Integer.parseInt(sc.nextLine());
		System.out.println("7.책상이나 식탁 위에 항상 과자 초콜릿 등이 놓여있다 1.네 0.아니요");
		int d = Integer.parseInt(sc.nextLine());
		System.out.println("8.오후 5시가 되면 피곤함과 배고픔을 느끼고 일이 손에 안 잡힌다 1.네 0.아니요");
		int e = Integer.parseInt(sc.nextLine());
		System.out.println("9.과자 초콜릿 등 단 음식은 상상만해도 먹고 싶어진다 1.네 0.아니요");
		int f = Integer.parseInt(sc.nextLine());
		System.out.println("10.다이어트를 위해 식이조절을 하는데 3일도 못 간다 1.네 0.아니요");
		int g = Integer.parseInt(sc.nextLine());
		
		int result = x+y+z+a+b+c+d+e+f+g;
		
	
		
		String state = null;
		
		switch(result) {
		case 3:
			state = "주의! 위험한 수준은 아니지만 관리 필요";
			break;
		case 4: case 5: case 6:
			state = "위험! 탄수화물 섭취 줄이기 위한 식습관 개선이 필요함";
			break;
		case 7: case 8: case 9: case 10:
			state = "중독! 전문의 상담이 필요함";
			break;
		default :
			state = "정상입니다";
		}
			
		System.out.println("당신의 자가진단 결과는 : " + state);
	}

}
