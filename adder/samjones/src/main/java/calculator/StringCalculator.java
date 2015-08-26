package calculator;


import org.apache.commons.lang3.StringUtils;
import token.StringTokenizer;
import token.Token;

import java.util.ArrayList;
import java.util.List;


public class StringCalculator {

    private int fValue = 0;
    private boolean fShouldValidateNegatives;

    public StringCalculator() {
    }

    public StringCalculator(int theStartValue) {
        fValue = theStartValue;
    }

    public StringCalculator add(String theValue) {
        List<String> aNegatives = new ArrayList<>();
        new StringTokenizer(theValue).filter(Token::isInt).forEach(theToken -> {
            fValue += theToken.intValue();
            if (theToken.isNegativeInt()) {
                aNegatives.add(theToken.stringValue());
            }
        });
        if (fShouldValidateNegatives && !aNegatives.isEmpty()) {
            throw new NumberFormatException("negative numbers not allowed: " + StringUtils.join(aNegatives, ", "));
        }
        return this;
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
