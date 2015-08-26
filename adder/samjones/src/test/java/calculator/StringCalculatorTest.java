package calculator;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;

import static org.junit.Assert.assertEquals;

public class StringCalculatorTest {
    @Rule
    public ExpectedException expectedException = ExpectedException.none();

    @Test
    public void step1() throws Exception {
        assertEquals(0, new StringCalculator().add(null).getValue());
        assertEquals(0, new StringCalculator().add("").getValue());

        assertEquals(1, new StringCalculator().add("1").getValue());
        assertEquals(5, new StringCalculator().add("5").getValue());

        assertEquals(2, new StringCalculator().add("1,1").getValue());
        assertEquals(5, new StringCalculator().add("2,3").getValue());
        assertEquals(16, new StringCalculator().add("11,2,3").getValue());
    }

    @Test
    public void step2() throws Exception {
        assertEquals(37, new StringCalculator().add("1,2,30,4").getValue());

        StringBuilder stringValue = new StringBuilder();
        for (int i = 0; i < 500; i++) {
            if (stringValue.length() > 0) {
                stringValue.append(",");
            }
            stringValue.append(i);
        }
        assertEquals(124750, new StringCalculator().add(stringValue.toString()).getValue());

    }

    @Test
    public void step3() throws Exception {
        assertEquals(10, new StringCalculator().add("1\n2,3,4").getValue());
    }

    @Test
    public void step4() throws Exception {
        assertEquals(3, new StringCalculator().add("//;\n1;2").getValue());
    }

    @Test
    public void step5() throws Exception {
        expectedException.expect(NumberFormatException.class);
        expectedException.expectMessage("negative numbers not allowed: -1, -3");

        new StringCalculator().shouldValidateNegatives().add("-1,2,-3");
    }

    @Test
    public void step5NoValidation() throws Exception {
        assertEquals(-2, new StringCalculator().add("-1,2,-3").getValue());
    }

    @Test
    public void subtract() throws Exception {
        assertEquals(5, new StringCalculator(10).subtract("3,2").getValue());
        assertEquals(-5, new StringCalculator().subtract("3,2").getValue());
    }

    @Test
    public void stringTogether() throws Exception {
        assertEquals(16, new StringCalculator(10).subtract("3,2").add("10").add("1,1").subtract("1").getValue());

    }
}
