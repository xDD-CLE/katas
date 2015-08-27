package token;

public class Token {

    private StringBuilder fToken = new StringBuilder();

    public int intValue() {
        return Integer.valueOf(fToken.toString());
    }

    public String stringValue() {
        return fToken.toString();
    }

    public void append(char c) {
        fToken.append(c);
    }

    public boolean isInt() {
        try {
            intValue();
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public boolean isPositiveInt() {
        try {
            return intValue() > 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public boolean isNegativeInt() {
        try {
            return intValue() < 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
