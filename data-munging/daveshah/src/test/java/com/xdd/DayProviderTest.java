package com.xdd;

import org.junit.Test;

import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * Created by shah on 8/14/15.
 */
public class DayProviderTest {

    @Test
    public void itProvidesDaysFromAFile() throws Exception {
        DayProvider provider = new DayProvider("data/weather.dat");

        List<Day> days = provider.getDays();

        assertEquals(31,days.size());
    }
}