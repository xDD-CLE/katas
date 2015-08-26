package calculator;


import org.apache.commons.lang3.StringUtils;
import token.StringTokenizer;
import token.Token;

import java.util.List;
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
        new StringTokenizer(theValue).filter(Token::isInt).forEach(theToken -> fValue += theToken.intValue());
        return this;
    }

    private void validateNegs(String theValue) {
        if (fShouldValidateNegatives) {
            List<String> aNegatives = new StringTokenizer(theValue).filter(Token::isNegativeInt).map(Token::stringValue).collect(Collectors.toList());
            if (!aNegatives.isEmpty()) {
                throw new NumberFormatException("negative numbers not allowed: " + StringUtils.join(aNegatives, ", "));
            }
        }
    }

    public StringCalculator subtract(String theValue) {
        new StringTokenizer(theValue).filter(Token::isInt).forEach(theToken -> fValue -= theToken.intValue());
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
