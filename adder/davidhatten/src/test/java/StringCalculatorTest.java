import kata.adder.Calculator;
import kata.adder.StringCalculator;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class StringCalculatorTest {

    Calculator calculator;

    @Before
    public void setUp() {
        calculator = new StringCalculator();
    }

    @Test
    public void shouldAddNoNumbers() {
        int result = calculator.add("");
        Assert.assertEquals("Adding an empty string should result in 0", 0, result);
    }

    @Test
    public void shouldAddOneNumber() {
        int result = calculator.add("1");
        Assert.assertEquals("One added with nothing should be 1", 1, result);
    }

}