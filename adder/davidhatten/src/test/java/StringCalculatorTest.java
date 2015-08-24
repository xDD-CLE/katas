import kata.adder.Calculator;
import kata.adder.StringCalculator;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class StringCalculatorTest {

    Calculator calculator;

    @Before
    public void setUp() {
        calculator = new StringCalculator();
    }

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
        assertEquals("Two Plus Two should be 4", 4, result);
    }

}