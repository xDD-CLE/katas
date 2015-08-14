package com.xdd;

import org.junit.Test;

import static junit.framework.Assert.assertEquals;
import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertFalse;

/**
 * Created by shah on 8/14/15.
 */
public class DayTest {


    @Test
    public void itKnowsValidity() throws Exception {
        String invalidDay = "  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP";
        String validDay = "  1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5";
        String validDay2 = "  mo  82.9  60.5  71.7    16  58.8       0.00              6.9          5.3";

        assertFalse(new Day(invalidDay).isValid());
        assertTrue(new Day(validDay).isValid());
        assertTrue(new Day(validDay2).isValid());
    }

    @Test
    public void itKnowsItsNumericDay() {
        String validDay = "   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5";
        String validDay2 = "  mo  82.9  60.5  71.7    16  58.8       0.00              6.9          5.3";


        assertEquals("1", new Day(validDay).getNumericDay());
        assertEquals("mo", new Day(validDay2).getNumericDay());
    }

    @Test
    public void itKnowsItsDifference() {
        String validDay = "   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5";
        String validDay2 = "  mo  82.9  60.5  71.7    16  58.8       0.00              6.9          5.3";
        String validDay3 = "    9  86    32*   59       6  61.5       0.00         240  7.6 220  12  6.0  78 46 1018.6";

        assertEquals(29.0,new Day(validDay).getDifference());
        assertEquals(22.400000000000006,new Day(validDay2).getDifference());
        assertEquals(54.0,new Day(validDay3).getDifference());
    }

}
