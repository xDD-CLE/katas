package io;

import org.junit.Test;

import java.io.FileNotFoundException;

import static org.junit.Assert.assertEquals;

public class TabbedFileReaderTest {
    
    @Test
    public void shouldGetStringArrays() throws FileNotFoundException {

    	TabbedFileReader reader = new TabbedFileReader("weather.dat");
        reader.open();
        String[] aLine = reader.next();
        assertEquals("Dy", aLine[0]);
        assertEquals("MnT", aLine[2]);

        aLine = reader.next();
        assertEquals(1, aLine.length);

        reader.close();
    }

}
