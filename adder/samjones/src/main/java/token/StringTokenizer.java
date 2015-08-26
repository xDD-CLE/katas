package token;

import javax.xml.stream.StreamFilter;
import javax.xml.stream.XMLStreamReader;
import java.util.*;
import java.util.function.Predicate;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

public class StringTokenizer implements Iterable<Token>, Iterator<Token>, StreamFilter {

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

    public Stream<Token> filter(Predicate<Token> thePredicate) {
        return StreamSupport.stream(this.spliterator(), false).filter(thePredicate);
    }

    @Override
    public boolean accept(XMLStreamReader reader) {
        return false;
    }

    public void setDelimiters(Character... theDelimiters) {
        fDelimiters = new HashSet<>(Arrays.asList(theDelimiters));
    }
}
