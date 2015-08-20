package calculator;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class StringCalculatorTest {

    @Test
    public void stepOne() throws Exception {
        StringCalculator calculator = new StringCalculator();
        assertEquals(0, calculator.add(null));
        assertEquals(0, calculator.add(""));

        assertEquals(1, calculator.add("1"));
        assertEquals(5, calculator.add("5"));

        assertEquals(2, calculator.add("1,1"));
        assertEquals(5, calculator.add("2,3"));
        assertEquals(6, calculator.add("1,2,3"));
    }
}
