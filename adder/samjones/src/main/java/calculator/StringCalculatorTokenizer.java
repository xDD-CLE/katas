package calculator;

import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StringCalculatorTokenizer {

    private final String fString;
    private Integer fValue = null;

    private StringBuilder fTokenBuffer = new StringBuilder();
    private static final List<Character> DEFAULT_DELIMITERS = Arrays.asList(',', '\n');
    private List<Character> fDelimiters = DEFAULT_DELIMITERS;
    private List<String> fNegativeNumbers = new ArrayList<String>();

    public StringCalculatorTokenizer(String theString) {
        fString = theString;
    }

    public int calculate(CalculateObject theCalculateObject) {
        if (null != fString) {
            for (int i = 0; i < fString.length(); i++) {
                char token = fString.charAt(i);
                if (isDelimiter(token)) {
                    flushToken(theCalculateObject);
                } else {
                    appendToken(token);
                }
            }
            flushToken(theCalculateObject);
            checkNegatives();
        }
        return fValue != null ? fValue : 0;
    }

    private void checkNegatives() throws NumberFormatException {
        if (fNegativeNumbers.size() > 0) {
            throw new NumberFormatException("negative numbers not allowed: " + StringUtils.join(fNegativeNumbers, ", "));
        }

    }

    private boolean isDelimiter(char token) {
        return fDelimiters.contains(token);
    }

    protected void flushToken(CalculateObject theCalculateObject) {
        updateDelimiters();
        captureNegative();
        if (fTokenBuffer.length() > 0) {
            Integer aTokenValue = Integer.valueOf(fTokenBuffer.toString());
            if (fValue == null) {
                fValue = aTokenValue;
            } else {
                fValue = theCalculateObject.calculate(fValue, aTokenValue);
            }
            fTokenBuffer = new StringBuilder();
        }
    }

    private void captureNegative() {
        if (fTokenBuffer.toString().startsWith("-")) {
            fNegativeNumbers.add(fTokenBuffer.toString());
            fTokenBuffer = new StringBuilder();
        }
    }

    private void updateDelimiters() {
        if (fTokenBuffer.toString().startsWith("//")) {
            fDelimiters = new ArrayList<Character>() {{
                add(fTokenBuffer.charAt(2));
            }};
            fTokenBuffer = new StringBuilder();
        }
    }

    protected void appendToken(char token) {
        fTokenBuffer.append(token);
    }
}
