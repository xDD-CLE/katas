package calculator;

import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

public class StringCalculator {

    private final StringTokenizer fStringTokenizer;

    public StringCalculator(String theString) {
        fStringTokenizer = new StringTokenizer(theString);
    }

    public int add() {
        final AtomicInteger aValue = new AtomicInteger(0);
        fStringTokenizer.tokenize(new FlushBufferAction() {
            @Override
            public void flush(String theToken) {
                aValue.set(aValue.get() + Integer.valueOf(theToken));
            }
        });
        return aValue.get();
    }

    public int subtract() {
        final AtomicInteger aValue = new AtomicInteger(0);
        final AtomicBoolean aFirstElement = new AtomicBoolean(false);
        fStringTokenizer.tokenize(new FlushBufferAction() {
            @Override
            public void flush(String theToken) {
                Integer aTokenValue = Integer.valueOf(theToken);
                if (!aFirstElement.get()) {
                    aValue.set(aTokenValue); // Give an initial value
                    aFirstElement.set(true);
                }
                aValue.set(aValue.get() - aTokenValue);
            }
        });
        return aValue.get();
    }
}
