package problems;

/**
 * http://projecteuler.net/index.php?section=problems&id=2
 * 
 * Each new term in the Fibonacci sequence is generated by adding the previous two terms. 
 * 
 * By starting with 1 and 2, the first 10 terms will be:
 * 		1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
 * 
 * Find the sum of all the even-valued terms in the sequence which do not exceed four million.
 * 
 * @author Shaun
 */
public class Problem2 {

	public static void main(String[] args) {
		System.out.println("Running...");
		
		long sum = 0;
		
		long startNs = System.nanoTime();
		
		// 33th fibonnaci number is 3524578, 34th is 4613732
		for (int i = 1; i <= 33; i++) {
			int fibonnaci = fibonnaci(i);
			if (fibonnaci % 2 == 0) {
				sum += fibonnaci;
			}
		}
		long endNs = System.nanoTime();
		
		System.out.println(String.format("sum: %d [%dns]", sum, endNs - startNs));
	}

	public static int fibonnaci(int n) {
		if (n < 0) {
			return 0;
		}
		
		if (n == 1) {
			return 1;
		}
		
		return fibonnaci(n - 1) + fibonnaci(n - 2);
	}

}
