package problems;

/**
 * http://projecteuler.net/index.php?section=problems&id=1
 * 
 * If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. 
 * The sum of these multiples is 23.
 * 
 * Find the sum of all the multiples of 3 or 5 below 1000.
 * 
 * @author Shaun
 */
public class Problem1 {

	private static final int[] MULTIPLES = new int[] { 3, 5 };

	public static void main(String[] args) {
		Problem1.run(1, 10);
		Problem1.run(1, 1000);
	}

	public static void run(final int start, final int end) {
		int sum = 0;
		
		long startNs = System.nanoTime();
		for (int i = start; i < end; i++) {
			if (isAMultiple(i)) {
				sum += i;
			}
		}
		long endNs = System.nanoTime();
		
		System.out.println(String.format("%d => %d : %d [%dns]", start, end, sum, endNs - startNs));
	}

	private static boolean isAMultiple(final int n) {
		for (int multiple : MULTIPLES) {
			if (n % multiple == 0) {
				return true;
			}
		}
		
		return false;
	}

}
