package calculator;


import token.StringTokenizer;
import token.Token;

import java.util.Collections;
import java.util.Set;
import java.util.StringJoiner;
import java.util.function.BiConsumer;
import java.util.function.BinaryOperator;
import java.util.function.Function;
import java.util.function.Supplier;
import java.util.stream.Collector;


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
            new StringTokenizer(theValue).stream().filter(Token::isNegativeInt).collect(new ErrorCollector("negative numbers not allowed: "));
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

    public static class ErrorCollector implements Collector<Token, StringJoiner, String> {

        private final String fPrefix;

        public ErrorCollector(String thePrefix) {
            fPrefix = thePrefix;
        }

        @Override
        public Supplier<StringJoiner> supplier() {
            return () -> new StringJoiner(", ");
        }

        @Override
        public BiConsumer<StringJoiner, Token> accumulator() {
            return (theStringJoiner, theToken) -> theStringJoiner.add(theToken.stringValue());
        }

        @Override
        public BinaryOperator<StringJoiner> combiner() {
            return StringJoiner::merge;
        }

        @Override
        public Function<StringJoiner, String> finisher() {
            return theStringJoiner -> {
                if (theStringJoiner.length() > 0) {
                    throw new RuntimeException(fPrefix + theStringJoiner.toString());
                }
                return null;
            };
        }

        @Override
        public Set<Characteristics> characteristics() {
            return Collections.emptySet();
        }
    }
}
