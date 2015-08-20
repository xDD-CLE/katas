package weather;

import io.TabbedFileReader;
import org.junit.Test;
import org.mockito.Mockito;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

public class SpreadFinderTest {

    @Test
    public void shouldFindSmallestSpreadReal() {
        TabbedFileReader aReader = new TabbedFileReader("weather.dat");
        WeatherDayIterator aIt = new WeatherDayIterator(aReader);
        SpreadFinder aFinder = new SpreadFinder(aIt);

        aFinder.find();

        WeatherDay aDay = aFinder.getSmallestDay();

        assertEquals(14, aDay.getDayNum());
    }

    @Test
    public void shouldFindSmallestSpreadMock() {
        WeatherDayIterator aIt = Mockito.mock(WeatherDayIterator.class);

        WeatherDay aDay1 = new WeatherDay(1, 60, 50);
        WeatherDay aDay2 = new WeatherDay(2, 70, 50);
        WeatherDay aDay3 = new WeatherDay(3, 55, 50);

        when(aIt.next()).thenReturn(aDay1, aDay2, aDay3);
        when(aIt.hasNext()).thenReturn(true, true, true, false);

        SpreadFinder aFinder = new SpreadFinder(aIt);

        aFinder.find();

        WeatherDay aDay = aFinder.getSmallestDay();

        assertEquals(3, aDay.getDayNum());
    }
}
