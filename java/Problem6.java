package problems;

/**
 * http://projecteuler.net/index.php?section=problems&id=6
 * 
 * The sum of the squares of the first ten natural numbers is,
 * 		12 + 22 + ... + 102 = 385
 * 
 * The square of the sum of the first ten natural numbers is,
 * 		(1 + 2 + ... + 10)2 = 552 = 3025
 * 
 * Hence the difference between the sum of the squares of the first ten natural numbers 
 * and the square of the sum is 3025  385 = 2640.
 * 
 * Find the difference between the sum of the squares of the first one hundred natural 
 * numbers and the square of the sum.
 * 
 * @author Shaun
 */
public class Problem6 {

	public static void main(String[] args) {
		//run(1, 10);
		run(1, 100);
	}

	static void run(final int start, final int end) {
		int sumOfSquares = 0;
		for (int i = start; i <= end; i++) {
			sumOfSquares += (i * i);
		}
		System.out.println(String.format("The sum of the squares of %d..%d is %d", start, end, sumOfSquares));
		
		int sum = 0;
		for (int i = start; i <= end; i++) {
			sum += i;
		}
		int squareOfSum = sum * sum;
		System.out.println(String.format("The square of the sum of %d..%d is %d", start, end, squareOfSum));
		
		System.out.println(String.format("The difference is %d", squareOfSum - sumOfSquares));
	}

}
