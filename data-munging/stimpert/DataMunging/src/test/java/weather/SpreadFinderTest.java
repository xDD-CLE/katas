package weather;

import common.HasSpread;
import io.TabbedFileReader;
import org.junit.Test;
import org.mockito.Mockito;

import java.io.FileNotFoundException;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

public class SpreadFinderTest {

    @Test
    public void shouldFindSmallestSpreadReal() throws FileNotFoundException {
        TabbedFileReader aReader = new TabbedFileReader("weather.dat");
        aReader.open();
        MyIterator aIt = new MyIterator(aReader, new WeatherDayFactory(aReader.next()));
        SpreadFinder aFinder = new SpreadFinder(aIt);

        aFinder.find();

        WeatherDay aDay = (WeatherDay) aFinder.getSmallestSpread();

        assertEquals(14, aDay.getDayNum());
    }

    @Test
    public void shouldFindSmallestSpreadMock() {
        MyIterator aIt = Mockito.mock(MyIterator.class);

        HasSpread aDay1 = new WeatherDay(1, 60, 50);
        HasSpread aDay2 = new WeatherDay(2, 70, 50);
        HasSpread aDay3 = new WeatherDay(3, 55, 50);

        when(aIt.next()).thenReturn(aDay1, aDay2, aDay3);
        when(aIt.hasNext()).thenReturn(true, true, true, false);

        SpreadFinder aFinder = new SpreadFinder(aIt);

        aFinder.find();

        WeatherDay aDay = (WeatherDay) aFinder.getSmallestSpread();

        assertEquals(3, aDay.getDayNum());
    }
}
