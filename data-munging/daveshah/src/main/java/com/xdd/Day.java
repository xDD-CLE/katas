package com.xdd;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by shah on 8/14/15.
 */
public class Day extends ColumnData {
    private static final int NUMERIC_DAY_POSITION = 1;
    private static final int MIN_TEMP_POSITION = 2;
    private static final int MAX_TEMP_POSITION = 3;
    private final String numericDay;
    private final double minTemp;
    private final double maxTemp;
    private boolean isValid;

    public Day(String input) {
        super(input);
        Pattern pattern = Pattern.compile(".+\\d+\\s+");
        Matcher matcher = pattern.matcher(input);
        isValid = matcher.find();
        if (isValid) {
            String[] split = this.input.split("\\s+");
            this.numericDay = split[NUMERIC_DAY_POSITION];
            this.minTemp = Double.parseDouble(replaceNonNumeric(split[MIN_TEMP_POSITION]));
            this.maxTemp = Double.parseDouble(replaceNonNumeric(split[MAX_TEMP_POSITION]));
        } else {
            this.numericDay = "";
            this.minTemp = 0;
            this.maxTemp = 0;
        }
    }

    private static String replaceNonNumeric(String input) {
        return input.replaceAll("[^0-9.]", "");
    }

    @Override
    public boolean isValid() {
        return isValid;
    }

    public String getNumericDay() {
        return numericDay;
    }

    public double getDifference() {
        return Math.abs(this.maxTemp - this.minTemp);
    }
}
