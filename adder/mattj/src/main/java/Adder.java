/*
 * Copyright 2015 GenomOncology, LLC
 * CONFIDENTIAL
 * This document contains trade secrets or otherwise confidential information owned by GenomOncology, LLC.
 * Access to and use of this information is strictly limited and controlled by GenomOncology, LLC. This
 * document may not be copied, distributed, or otherwise disclosed outside of GenomOncology, LLC's facilities
 * except under appropriate precautions to maintain the confidentiality hereof, and may not be used in any
 * way not expressly authorized by GenomOncology, LLC.
 */

public class Adder {

    private String[] defaultDelimiters = new String[]{",", "\n"};

    public int add(String stringOfNumbersToAdd) {
        String[] delimiters = defaultDelimiters;
        if (stringOfNumbersToAdd.startsWith("//")) {
            delimiters = new String[]{stringOfNumbersToAdd.substring(2, stringOfNumbersToAdd.indexOf("\n"))};
            stringOfNumbersToAdd = stringOfNumbersToAdd.substring(stringOfNumbersToAdd.indexOf("\n")+1);
        }
        if (containsDelimiters(stringOfNumbersToAdd, delimiters)) {
            final String[] numbers = stringOfNumbersToAdd.split(splitRegex(delimiters));
            int total = 0;
            for (String number : numbers) {
                total += Integer.parseInt(number);
            }
            return total;
        }
        if ("".equals(stringOfNumbersToAdd)) {
            return 0;
        }
        return Integer.parseInt(stringOfNumbersToAdd);
    }

    private String splitRegex(String[] delimiters) {
        String s = "";
        for (int i = 0; i < delimiters.length; i++) {
            if (i + 1 < delimiters.length) {
                s += delimiters[i] + "|";
            } else {
                s += delimiters[i];
            }
        }
        return s;
    }

    private boolean containsDelimiters(String s, String[] delimiters) {
        for (String delimiter : delimiters) {
            if (s.contains(delimiter)) {
                return true;
            }
        }
        return false;
    }
}

