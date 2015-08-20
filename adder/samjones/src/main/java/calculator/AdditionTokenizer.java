package calculator;

/**
 * Created by sam on 8/19/15.
 */
public class AdditionTokenizer {

    private final String stringValue;
    private int calculatedValue = 0;
    private StringBuilder tokenBuffer = new StringBuilder();

    public AdditionTokenizer(String stringValue) {
        this.stringValue = stringValue;
    }

    public int calculate() {
        for (int i = 0; i < stringValue.length(); i++) {
            char token = stringValue.charAt(i);
            if (',' == token) {
                flushToken();
            } else {
                appendToken(token);
            }
        }
        flushToken();
        return calculatedValue;
    }

    protected void flushToken() {
        if (tokenBuffer.length() > 0) {
            calculatedValue += Integer.parseInt(tokenBuffer.toString());
            tokenBuffer = new StringBuilder();
        }
    }

    protected void appendToken(char token) {
        tokenBuffer.append(token);
    }
}
