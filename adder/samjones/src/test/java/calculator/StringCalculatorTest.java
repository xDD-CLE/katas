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
        assertEquals(0, new StringCalculator(null).add());
        assertEquals(0, new StringCalculator("").add());

        assertEquals(1, new StringCalculator("1").add());
        assertEquals(5, new StringCalculator("5").add());

        assertEquals(2, new StringCalculator("1,1").add());
        assertEquals(5, new StringCalculator("2,3").add());
        assertEquals(16, new StringCalculator("11,2,3").add());
    }

    @Test
    public void step2() throws Exception {
        assertEquals(37, new StringCalculator("1,2,30,4").add());

        StringBuilder stringValue = new StringBuilder();
        for (int i = 0; i < 500; i++) {
            if (stringValue.length() > 0) {
                stringValue.append(",");
            }
            stringValue.append(i);
        }
        assertEquals(124750, new StringCalculator(stringValue.toString()).add());

    }

    @Test
    public void step3() throws Exception {
        assertEquals(10, new StringCalculator("1\n2,3,4").add());
    }

    @Test
    public void step4() throws Exception {
        assertEquals(3, new StringCalculator("//;\n1;2").add());
    }

    @Test
    public void step5() throws Exception {
        expectedException.expect(NumberFormatException.class);
        expectedException.expectMessage("negative numbers not allowed: -1, -3");

        new StringCalculator("-1,2,-3").add();
    }

    @Test
    public void subtract() throws Exception {
        assertEquals(-5, new StringCalculator("3,2").subtract());
    }
}
