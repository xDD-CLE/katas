package calculator;

import org.apache.commons.lang3.StringUtils;

public class StringCalculator {

    public int add(String stringValue) {
        int returnVal = 0;
        if (StringUtils.isNotEmpty(stringValue)) {
            for (String singleValue : stringValue.split(",|\n")) {
                returnVal += Integer.valueOf(singleValue);
            }

        }
        return returnVal;
    }
}
