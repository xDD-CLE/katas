package kata.adder;

/**
 * Created by david on 8/24/15.
 */
public class StringCalculator implements Calculator {
    @Override
    public int add(String input) {
        int calculatedValue = 0;

        if (inputIsNotEmpty(input)) {
            String[] inputStrings = input.split(",|\n");

            for (int i = 0; i < inputStrings.length; i++) {
                calculatedValue += Integer.valueOf(inputStrings[i]);
            }
        }

        return calculatedValue;
    }

    private boolean inputIsNotEmpty(String input) {
        return !"".equals(input); //normally I would check for null, but the kata says don't worry about it
    }
}
