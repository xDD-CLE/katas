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
            String[] inputStrings = input.split(",");

            int result = 0;

            for (int i = 0; i < inputStrings.length; i++) {
                result += Integer.valueOf(inputStrings[i]);
            }
            
            return result;
        }
    }
}
