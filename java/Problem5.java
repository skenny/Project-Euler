package problems;

/**
 * http://projecteuler.net/index.php?section=problems&id=5
 * 
 * 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
 * 
 * What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?
 * 
 * @author Shaun
 */
public class Problem5 {

	public static void main(String[] args) {
		//run(1, 10);
		run(1, 20);
	}

	static void run(int start, int end) {
		int i = 1;
		while(true) {
			if (evenlyDivisible(i, start, end)) {
				break;
			}
			i++;
		}
		
		System.out.println(i);
	}

	static boolean evenlyDivisible(int n, int start, int end) {
		for (int i = start; i <= end; i++) {
			if (n % i != 0) {
				return false;
			}
		}
		
		return true;
	}

}
