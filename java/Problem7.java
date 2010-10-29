package problems;

/**
 * http://projecteuler.net/index.php?section=problems&id=7
 * 
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see 
 * that the 6th prime is 13.
 * 
 * What is the 10001st prime number?
 * 
 * @author Shaun
 */
public class Problem7 {

	public static void main(String[] args) {
		run(6);
		run(10001);
	}

	static void run(int n) {
		int primeCount = 0;
		int integer = 2;
		int lastPrime = 0;
		while (primeCount < n) {
			if (NumberUtils.isPrime(integer)) {
				primeCount++;
				lastPrime = integer;
			}
			integer++;
		}
		
		System.out.println(String.format("The #%d prime is %d", n, lastPrime));
	}

}
