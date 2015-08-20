package weather;

import io.TabbedFileReader;
import org.junit.Test;
import org.mockito.Mockito;

import static org.junit.Assert.assertEquals;

public class WeatherDayIteratorTest {

    @Test
    public void shouldIterateDays() {
        TabbedFileReader aReader = Mockito.mock(TabbedFileReader.class);

        Mockito.when(aReader.next()).thenReturn(
                new String[]{"Dy", "MxT", "MnT", "AvT"},
                new String[]{"1", "88", "59", "74"});

        WeatherDayIterator aIt = new WeatherDayIterator(aReader);

        WeatherDay aDay = aIt.next();

        assertEquals(1, aDay.getDayNum());
    }
}
