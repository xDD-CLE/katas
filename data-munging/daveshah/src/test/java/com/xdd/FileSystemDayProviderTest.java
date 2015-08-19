package com.xdd;

import org.junit.Test;

import java.util.stream.Stream;

import static org.junit.Assert.assertEquals;

/**
 * Created by shah on 8/14/15.
 */
public class FileSystemDayProviderTest {

    @Test
    public void itProvidesDaysFromAFile() throws Exception {
        FileSystemDataProvider<Day> provider = new FileSystemDataProvider<>("data/weather.dat");

        Stream<Day> days = provider.getValidColumnData(Day::new);

        assertEquals(31,days.count());
    }
}