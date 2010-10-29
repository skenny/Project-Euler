package problems;

/**
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 * 
 * Find the sum of all the primes below two million.
 * 
 * @author Shaun
 */
public class Problem10 {

	public static void main(String[] args) {
		//sumPrimes(10);
		sumPrimes(2000000);
	}

	public static void sumPrimes(long max) {
		long sum = 0;
		for (long i = 2; i < max; i++) {
			if (NumberUtils.isPrime(i)) {
				sum += i;
			}
		}
		
		System.out.println(sum);
	}

}
