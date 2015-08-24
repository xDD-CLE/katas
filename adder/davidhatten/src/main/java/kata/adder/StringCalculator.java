package kata.adder;

/**
 * Created by david on 8/24/15.
 */
public class StringCalculator implements Calculator {
    @Override
    public int add(String input) {
        if ("".equals(input)) {
            return 0;
        } else {
            return Integer.valueOf(input);
        }
    }
}
