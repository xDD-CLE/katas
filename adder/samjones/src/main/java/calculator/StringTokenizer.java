package calculator;

import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StringTokenizer {

    private final String fString;

    private StringBuilder fTokenBuffer = new StringBuilder();
    private static final List<Character> DEFAULT_DELIMITERS = Arrays.asList(',', '\n');
    private List<Character> fDelimiters = DEFAULT_DELIMITERS;
    private List<String> fNegativeNumbers = new ArrayList<String>();

    public StringTokenizer(String theString) {
        fString = theString;
    }

    public void tokenize(FlushBufferAction theFlushBufferAction) {
        if (null != fString) {
            for (int i = 0; i < fString.length(); i++) {
                char token = fString.charAt(i);
                if (isDelimiter(token)) {
                    flushToken(theFlushBufferAction);
                } else {
                    appendToken(token);
                }
            }
            flushToken(theFlushBufferAction);
            checkNegatives();
        }
    }

    private void checkNegatives() throws NumberFormatException {
        if (fNegativeNumbers.size() > 0) {
            throw new NumberFormatException("negative numbers not allowed: " + StringUtils.join(fNegativeNumbers, ", "));
        }

    }

    private boolean isDelimiter(char token) {
        return fDelimiters.contains(token);
    }

    protected void flushToken(FlushBufferAction theFlushBufferAction) {
        updateDelimiters();
        captureNegative();
        if (fTokenBuffer.length() > 0) {
            theFlushBufferAction.flush(fTokenBuffer.toString());
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
