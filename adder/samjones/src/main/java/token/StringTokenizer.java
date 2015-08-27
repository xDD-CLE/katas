package token;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

public class StringTokenizer implements Iterable<Token>, Iterator<Token> {

    private final String fValue;
    private int fIndex = 0;

    private Set<Character> fDelimiters = new HashSet<Character>() {{
        add(',');
        add('\n');
    }};

    public StringTokenizer(String theValue) {
        fValue = theValue;
    }

    protected void readDelimiter() {
        if (hasNext() && fValue.startsWith("//")) {
            setDelimiters('\n');
            Token aNext = next();
            setDelimiters(aNext.stringValue().charAt(aNext.stringValue().length() - 1));
        }
    }

    @Override
    public Iterator<Token> iterator() {
        readDelimiter();
        return this;
    }

    @Override
    public boolean hasNext() {
        return null != fValue && fIndex < fValue.length();
    }

    @Override
    public Token next() {
        Token aToken = new Token();
        while (hasNext() && isNotDelimiter()) {
            aToken.append(fValue.charAt(fIndex++));
        }
        fIndex++;
        return aToken;
    }

    public Set<Character> getDelimiters() {
        return fDelimiters;
    }

    protected boolean isNotDelimiter() {
        return !getDelimiters().contains(fValue.charAt(fIndex));
    }

    public Stream<Token> stream() {
        return StreamSupport.stream(this.spliterator(), false);
    }

    public StringTokenizer setDelimiters(Character... theDelimiters) {
        fDelimiters = new HashSet<>(Arrays.asList(theDelimiters));
        return this;
    }
}
