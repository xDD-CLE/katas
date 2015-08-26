package kata.adder;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by david on 8/24/15.
 */
public enum StringCalculator {

    INSTANCE;

    private static String rawInput = "";
    private static List<Integer> invalidInputs = new ArrayList();

    public static int add(String input) {
        int calculatedValue = 0;
        rawInput = input;

        if (inputIsNotEmpty()) {
            String delimiter = determineAndStripDelimiter();
            String[] inputStrings = splitRawInputOn(delimiter);

            for (int i = 0; i < inputStrings.length; i++) {
                calculatedValue += parseAddend(inputStrings[i]);
            }
        }

        validateResults();

        return calculatedValue;
    }


    private static boolean inputIsNotEmpty() {
        return !"".equals(rawInput); //normally I would check for null, but the kata says don't worry about it
    }

    private static String determineAndStripDelimiter() {
        List<String> result = new ArrayList<>();
        result.add(",");
        result.add("\n");

        if (rawInput.startsWith("//")) {
            rawInput = rawInput.substring(2); //consume the slashes
            while (rawInput.startsWith("[")) {
                int endIndex = rawInput.indexOf("]");
                result.add(rawInput.substring(1, endIndex));
                rawInput = rawInput.substring(endIndex+1); //consume the delimiter and closing bracket
            }

            int delimEndIndex = rawInput.indexOf("\n");
            if (delimEndIndex > 0) {
                //if delimiters don't have have [], it still needs to get added
                //But if delimiters do have [], it will add an empty string here, so have to avoid that
                result.add(rawInput.substring(0, delimEndIndex));
            }
            rawInput = rawInput.substring(delimEndIndex+1); //consume the newline
        }

        return String.join("|", result);
    }

    private static String[] splitRawInputOn(String delimiter) {
        String[] result = rawInput.split(delimiter);
        return result;
    }

    private static int parseAddend(String operand) {
        int opNumber = Integer.valueOf(operand);
        if (opNumber < 0) {
            invalidInputs.add(opNumber);
        } else if (opNumber > 1000){
            opNumber = 0;
        }

        return opNumber;
    }

    private static void validateResults() {
        if (!invalidInputs.isEmpty()) {
            StringBuilder exceptionText = new StringBuilder();
            exceptionText.append("Unable to add negative numbers: ");
            for (int badInput : invalidInputs) {
                exceptionText.append(badInput);
                exceptionText.append(" ");
            }

            invalidInputs.clear();

            throw new RuntimeException(exceptionText.toString());
        }
    }
}
