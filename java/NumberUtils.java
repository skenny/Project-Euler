package problems;

public class NumberUtils {

	public static boolean isPrime(long n) {
		if (n == 1) {
			return true;
		}
		
		if (n != 2 && n % 2 == 0) {
			return false;
		}
		
		long sqrtN = Math.round(Math.sqrt(n)) + 1;
		for (long i = 2; i < sqrtN; i++) {
			if (n % i == 0) {
				return false;
			}
		}
		
		return true;
	}

	public static boolean isPythagoreanTriplet(int a, int b, int c) {
		if ((a > b || a > c) || b > c) {
			return false;
		}
		
		return (a * a) + (b * b) == (c * c); 
	}

	public static int sum(int[] numbers) {
		int sum = 0;
		for (Integer number : numbers) {
			sum += number.intValue();
		}
		return sum;
	}

	public static int product(int[] numbers) {
		int product = 1;
		for (Integer number : numbers) {
			product *= number.intValue();
		}
		return product;
	}

}
