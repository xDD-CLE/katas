package token;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

public class StringTokenizerTest {

    @Test
    public void shouldIterate() throws Exception {
        assertNotNull(new StringTokenizer("123").iterator());
    }

    @Test
    public void shouldIterateStrings() throws Exception {
        final List<String> aStringTokens = new ArrayList<>();
        new StringTokenizer("abc,123").forEach(theToken -> aStringTokens.add(theToken.stringValue()));
        assertEquals(Arrays.asList("abc", "123"), aStringTokens);
    }

    @Test
    public void shouldIterateIntegers() throws Exception {
        final List<Integer> aIntegerTokens = new ArrayList<>();
        new StringTokenizer("123,456").forEach(theToken -> aIntegerTokens.add(theToken.intValue()));
        assertEquals(Arrays.asList(123, 456), aIntegerTokens);
    }

    @Test
    public void shouldFilterAndIterateIntegers() throws Exception {
        final List<Integer> aIntegerTokens = new ArrayList<>();
        new StringTokenizer("123,456,abc").filter(Token::isInt).forEach(theToken -> aIntegerTokens.add(theToken.intValue()));
        assertEquals(Arrays.asList(123, 456), aIntegerTokens);
    }

    @Test
    public void shouldHandleLineBreak() throws Exception {
        final List<String> aIntegerTokens = new ArrayList<>();
        new StringTokenizer("123,456\nabc").forEach(theToken -> aIntegerTokens.add(theToken.stringValue()));
        assertEquals(Arrays.asList("123","456","abc"), aIntegerTokens);
    }
}