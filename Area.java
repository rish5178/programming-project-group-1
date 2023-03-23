import java.util.Scanner;

public class Area {

	public static void main(String[] args) {
		Scanner input = new Scanner( System.in );
		System.out.println("Circle computations:");
		System.out.println("What is your radius of your circle?");
		double radius = input.nextDouble();

		double circleArea = Math.PI * radius * radius;
		double circumference = Math.PI* 2.0 * radius;

		System.out.println("The area of a circle of radius " + radius + " is " + circleArea + " and the circumference is " + circumference);
		System.out.println();
		System.out.println("Rectangle computations:");
		System.out.println("What is your length of your rectangle?");
		double length = input.nextDouble();
		System.out.println("What is your width of your rectangle?");
		double width = input.nextDouble();
		
		double rectangleArea = length * width;
		System.out.println("The area of a "+length+" X " +width+" rectangle is "+ rectangleArea);
	}
}