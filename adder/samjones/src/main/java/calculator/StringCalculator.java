package calculator;

import org.apache.commons.lang3.StringUtils;


public class StringCalculator {

    public int add(String stringValue) {
        if (StringUtils.isEmpty(stringValue)) {
            return 0;
        } else {
            return new AdditionTokenizer(stringValue).calculate();
        }
    }
}