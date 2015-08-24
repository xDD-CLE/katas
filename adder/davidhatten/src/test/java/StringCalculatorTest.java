import kata.adder.Calculator;
import kata.adder.StringCalculator;
import org.junit.Assert;
import org.junit.Test;

public class StringCalculatorTest {

    @Test
    public void shouldAddNoNumbers() {
        Calculator calculator = new StringCalculator();
        int result = calculator.add("");
        Assert.assertEquals("Adding an empty string should result in 0", 0, result);
    }

}