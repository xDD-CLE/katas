package token;

import org.junit.Test;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

public class StringTokenizerTest {

    @Test
    public void shouldStream() throws Exception {
        assertNotNull(new StringTokenizer("123").iterator());
        List<Token> aList = new StringTokenizer("123").stream().collect(Collectors.toList());
        assertNotNull(aList);
        assertEquals(1, aList.size());
    }

    @Test
    public void shouldIterateStrings() throws Exception {
        assertEquals(Arrays.asList("abc", "123"), new StringTokenizer("abc,123").stream().map(Token::stringValue).collect(Collectors.toList()));
    }

    @Test
    public void shouldIterateIntegers() throws Exception {
        assertEquals(Arrays.asList(123, 456), new StringTokenizer("123,456").stream().map(Token::intValue).collect(Collectors.toList()));
    }

    @Test
    public void shouldFilterAndIterateIntegers() throws Exception {
        assertEquals(Arrays.asList(123, 456), new StringTokenizer("123,456,abc").stream().filter(Token::isInt).map(Token::intValue).collect(Collectors.toList()));
    }

    @Test
    public void shouldHandleLineBreak() throws Exception {
        assertEquals(Arrays.asList("123", "456", "abc"), new StringTokenizer("123,456\nabc").stream().map(Token::stringValue).collect(Collectors.toList()));
    }

    @Test
    public void shouldHandleSetDelimiter() throws Exception {
        assertEquals(Arrays.asList("123", "456", "abc"), new StringTokenizer("123'456;abc").setDelimiters('\'', ';').stream().map(Token::stringValue).collect(Collectors.toList()));
    }

    @Test
    public void shouldReadDelimiter() throws Exception {
        assertEquals(Arrays.asList("123", "456", "abc"), new StringTokenizer("//;\n123;456;abc").stream().map(Token::stringValue).collect(Collectors.toList()));
    }
}