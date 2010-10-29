package problems;

public class PrintUtils {

	public static final String ACTION_TOOK_NS_FORMAT = "%s [%dns]";

	public static final void actionTookNs(final String action, final long ns) {
		System.out.println(String.format(ACTION_TOOK_NS_FORMAT, action, ns));
	}

}
