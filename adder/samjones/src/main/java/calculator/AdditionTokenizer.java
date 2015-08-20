package calculator;

import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by sam on 8/19/15.
 */
public class AdditionTokenizer {

    private final String stringValue;
    private int calculatedValue = 0;
    private StringBuilder tokenBuffer = new StringBuilder();
    private static final List<Character> DEFAULT_DELIMITERS = Arrays.asList(',', '\n');
    private List<Character> delimiters = DEFAULT_DELIMITERS;
    private List<String> negativeNumbers = new ArrayList<>();

    public AdditionTokenizer(String stringValue) {
        this.stringValue = stringValue;
    }

    public int calculate() {
        for (int i = 0; i < stringValue.length(); i++) {
            char token = stringValue.charAt(i);
            if (isDelimiter(token)) {
                flushToken();
            } else {
                appendToken(token);
            }
        }
        flushToken();
        checkNegatives();
        return calculatedValue;
    }

    private void checkNegatives() throws NumberFormatException {
        if (negativeNumbers.size() > 0) {
            throw new NumberFormatException("negative numbers not allowed: " + StringUtils.join(negativeNumbers, ", "));
        }

    }

    private boolean isDelimiter(char token) {
        return delimiters.contains(token);
    }

    protected void flushToken() {
        updateDelimiters();
        captureNegative();
        if (tokenBuffer.length() > 0) {
            calculatedValue += Integer.parseInt(tokenBuffer.toString());
            tokenBuffer = new StringBuilder();
        }
    }

    private void captureNegative() {
        if (tokenBuffer.toString().startsWith("-")) {
            negativeNumbers.add(tokenBuffer.toString());
            tokenBuffer = new StringBuilder();
        }
    }

    private void updateDelimiters() {
        if (tokenBuffer.toString().startsWith("//")) {
            delimiters = new ArrayList<Character>() {{
                add(tokenBuffer.charAt(2));
            }};
            tokenBuffer = new StringBuilder();
        }
    }

    protected void appendToken(char token) {
        tokenBuffer.append(token);
    }
}
