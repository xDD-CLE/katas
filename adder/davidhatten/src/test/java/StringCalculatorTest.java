import kata.adder.StringCalculator;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;

import static org.junit.Assert.assertEquals;

public class StringCalculatorTest {

    StringCalculator calculator = StringCalculator.INSTANCE;

    @Test
    public void shouldAddNoNumbers() {
        int result = calculator.add("");
        assertEquals("Adding an empty string should result in 0", 0, result);
    }

    @Test
    public void shouldAddOneNumber() {
        int result = calculator.add("1");
        assertEquals("One added with nothing should be 1", 1, result);
    }

    @Test
    public void shouldAddTwoNumbers() {
        int result = calculator.add("2,2");
        assertEquals("Two plus two should be 4", 4, result);
    }

    @Test
    public void shouldAddAnyNumbers() {
        int result = calculator.add("1,2,3");
        assertEquals("One plus two plus three should be 6", 6, result);

        result = calculator.add("3,4,5,6");
        assertEquals("Three plus four plus five plus 6 should be 18", 18, result);
    }

    @Test
    public void shouldAddWithNewlineSeparators() {
        int result = calculator.add("1,2\n3");
        assertEquals("One plus two plus three (with a newline) should be 6", 6, result);
    }

    @Test
    public void shouldBeAbleToSetDelimeter() {
        int result = calculator.add("//;\n2;2");
        assertEquals("Two plus two (with a semicolon delimeter) should be 4", 4, result);

        result = calculator.add("//&\n2&2");
        assertEquals("Two plus two (with & delimiter) should be 4", 4, result);

        result = calculator.add("//=\n2=2");
        assertEquals("Two plus two (with a + delimiter) should be 4", 4, result);

        result = calculator.add("//;\n2;2\n2");
        assertEquals("two plus two plus two (with a ; delimeter and a newline delimeter) should be 6", 6, result);
    }

    @Rule
    public ExpectedException expected = ExpectedException.none();
    @Test
    public void shouldNotBeAbleToAddNegativeNumbers() {
        String errorMessageBase = "Unable to add negative numbers: ";
        expected.expect(RuntimeException.class);
        expected.expectMessage(errorMessageBase + "-1");
        calculator.add("1,-1");

        expected.expectMessage(errorMessageBase + "-1 -2");
        calculator.add("-1,-2");
    }

    @Test
    public void shouldIgnoreNumbersLargerThan1000() {
        int result = calculator.add("2,1000");
        assertEquals("Two plus one thousand should be", 1002, result);

        result = calculator.add("2,1001");
        assertEquals("Two plus one thousand and one should be", 2, result);
    }

    @Test
    public void shouldAcceptDelimiterOfArbitraryLength() {
        int result = calculator.add("//;;;\n2;;;2");
        assertEquals("Two plus two (with a ;;; delimiter) should be 4", 4, result);

        result = calculator.add("//DELIM\n2DELIM2");
        assertEquals("Two plus two (with a DELIM delimiter) should be 4", 4, result);
    }
}