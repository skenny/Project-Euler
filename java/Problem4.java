package problems;

/**
 * http://projecteuler.net/index.php?section=problems&id=4
 * 
 * A palindromic number reads the same both ways. The largest palindrome made from the product 
 * of two 2-digit numbers is 9009 = 91 x 99.
 * 
 * Find the largest palindrome made from the product of two 3-digit numbers.
 * 
 * @author Shaun
 */
public class Problem4 {

	public static void main(String[] args) {
		run(1000, 9999);
	}

	static void run(final int start, final int end) {
		int largestPalindromeProduct = -1;
		for (int i = start; i <= end; i++) {
			for (int j = start; j <= end; j++) {
				int product = i * j;
				if (isPalindrome(String.valueOf(product))) {
					if (product > largestPalindromeProduct) {
						largestPalindromeProduct = product;
					}
				}
			}
		}
		
		System.out.println(largestPalindromeProduct);
	}

	static boolean isPalindrome(final String str) {
		char[] chars = str.toCharArray();
		
		for (int i = 1; i <= chars.length / 2; i++) {
			if (chars[i - 1] != chars[chars.length - i]) {
				return false;
			}
		}
		
		return true;
	}

}
