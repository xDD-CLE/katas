package token;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class TokenTest {

    @Test
    public void shouldMakeStringToken() throws Exception {
        Token aToken = new Token();
        aToken.append('a');
        assertEquals("a", aToken.stringValue());
        aToken.append('b');
        assertEquals("ab", aToken.stringValue());
        assertFalse(aToken.isInt());
    }

    @Test
    public void shouldNotBeIntToken() throws Exception {
        Token aToken = new Token();
        aToken.append('a');
        assertFalse(aToken.isInt());
        assertFalse(aToken.isNegativeInt());
        assertFalse(aToken.isPositiveInt());
    }

    @Test
    public void shouldMakeIntToken() throws Exception {
        Token aToken = new Token();
        aToken.append('1');
        assertEquals("1", aToken.stringValue());
        assertEquals(1, aToken.intValue());
        aToken.append('2');
        assertEquals("12", aToken.stringValue());
        assertEquals(12, aToken.intValue());
        assertTrue(aToken.isInt());
        assertFalse(aToken.isNegativeInt());
        assertTrue(aToken.isPositiveInt());
    }

    @Test
    public void shouldMakeNegativeInt() throws Exception {
        Token aToken = new Token();
        aToken.append('-');
        aToken.append('1');
        aToken.append('2');
        assertTrue(aToken.isNegativeInt());
        assertFalse(aToken.isPositiveInt());
        assertTrue(aToken.isInt());
    }

    @Test
    public void shouldMakeZeroInt() throws Exception {
        Token aToken = new Token();
        aToken.append('0');
        assertFalse(aToken.isNegativeInt());
        assertFalse(aToken.isPositiveInt());
        assertTrue(aToken.isInt());
    }
}