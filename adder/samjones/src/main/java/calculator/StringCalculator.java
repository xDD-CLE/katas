package calculator;


import token.StringTokenizer;
import token.Token;

import java.util.stream.Collectors;


public class StringCalculator {

    private int fValue = 0;
    private boolean fShouldValidateNegatives;

    public StringCalculator() {
    }

    public StringCalculator(int theStartValue) {
        fValue = theStartValue;
    }

    public StringCalculator add(String theValue) {
        validateNegs(theValue);
        fValue = new StringTokenizer(theValue).stream().filter(Token::isInt).mapToInt(Token::intValue).reduce(fValue, Integer::sum);
        return this;
    }

    private void validateNegs(String theValue) {
        if (fShouldValidateNegatives) {
            new StringTokenizer(theValue).stream().filter(Token::isNegativeInt).map(Token::stringValue).collect(Collectors.collectingAndThen(Collectors.joining(", "), theError -> {
                if (!theError.isEmpty()) {
                    throw new NumberFormatException("negative numbers not allowed: " + theError);
                }
                return theError;
            }));
        }
    }

    public StringCalculator subtract(String theValue) {
        fValue = new StringTokenizer(theValue).stream().filter(Token::isInt).mapToInt(Token::intValue).reduce(fValue, (a, b) -> a - b);
        return this;
    }

    public StringCalculator shouldValidateNegatives() {
        fShouldValidateNegatives = true;
        return this;
    }

    public int getValue() {
        return fValue;
    }
}
