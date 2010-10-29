package problems;

import java.util.Arrays;

/**
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 * 		a^2 + b^2 = c^2
 * For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 * 
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 * 
 * @author Shaun
 */
public class Problem9 {

	public static void main(String[] args) {
		for (int a = 1; a < 1000; a++) {
			for (int b = a + 1; b < 1000; b++) {
				for (int c = b + 1; c < 1000; c++) {
					if (NumberUtils.isPythagoreanTriplet(a, b, c)) {
						//System.out.println(String.format("[%d, %d, %d]", a, b, c));
						int[] triplet = new int[] {a, b, c};
						if (NumberUtils.sum(triplet) == 1000) {
							System.out.println(
								String.format("%s => %d", Arrays.toString(triplet), NumberUtils.product(triplet))
							);
						}
					}
				}
			}
		}
	}

}
