package problems;

import java.util.ArrayList;
import java.util.List;

/**
 * http://projecteuler.net/index.php?section=problems&id=3
 * 
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * 
 * What is the largest prime factor of the number 600851475143 ?
 * 
 * http://en.wikipedia.org/wiki/Prime_factor
 * The prime factors of a positive integer are the prime numbers that divide that integer exactly, 
 * without leaving a remainder.
 * 
 * Verifying the primality of a given number n can be done by trial division, that is to say dividing 
 * n by all integer numbers m smaller than or equal to sqrt(n).
 * 
 * @author Shaun
 */
public class Problem3 {

	public static void main(String[] args) {
		run(13195, false);
		run(600851475143L, false);
	}

	static void run(long number, boolean onlyLargest) {
		List<Long> primeFactors = new ArrayList<Long>();
		
		long startMs = System.currentTimeMillis();
		
		// notes:
		// - we should work backwards since we're looking for the largest prime factor
		// - we can skip even numbers since the only even prime is 2
		
		long sqrt = Math.round(Math.sqrt(number));
		if (sqrt % 2 == 0) {
			sqrt += 1;
		}
		
		System.out.println(String.format("sqrt(%d) = %d", number, sqrt));
		
		for (long i = sqrt; i > 2; i -= 2) {
			// check for even division first since fewer numbers should evenly divide than there are primes
			if (number % i == 0 && NumberUtils.isPrime(i)) {
				primeFactors.add(Long.valueOf(i));
				if (onlyLargest) {
					break;
				}
			}
		}
		long endMs = System.currentTimeMillis();
		
		if (!onlyLargest) {
			System.out.println(String.format("The prime factors of %d are %s", number, primeFactors));
		}
		
		System.out.println(
			String.format(
				"The largest prime factor of %d is %d [%dms]"
					, number
					, primeFactors.get(0)
					, (endMs - startMs)
			)
		);
	}

}
