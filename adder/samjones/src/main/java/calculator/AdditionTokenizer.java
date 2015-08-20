package calculator;

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
        return calculatedValue;
    }

    private boolean isDelimiter(char token) {
        return delimiters.contains(token);
    }

    protected void flushToken() {
        updateDelimiters();
        if (tokenBuffer.length() > 0) {
            calculatedValue += Integer.parseInt(tokenBuffer.toString());
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
