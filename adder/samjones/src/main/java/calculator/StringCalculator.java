package calculator;

import java.util.concurrent.atomic.AtomicInteger;

public class StringCalculator {

    private final StringTokenizer fStringTokenizer;

    public StringCalculator(String theString) {
        fStringTokenizer = new StringTokenizer(theString);
    }

    public int add() {
        final AtomicInteger aValue = new AtomicInteger(0);
        fStringTokenizer.tokenize(theToken -> aValue.set(aValue.get() + Integer.valueOf(theToken)));
        return aValue.get();
    }

    public int subtract() {
        final AtomicInteger aValue = new AtomicInteger(0);
        fStringTokenizer.tokenize(theToken -> aValue.set(aValue.get() - Integer.valueOf(theToken)));
        return aValue.get();
    }
}
