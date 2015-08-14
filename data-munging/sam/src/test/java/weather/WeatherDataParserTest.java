package weather;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by sam on 8/14/15.
 */
public class WeatherDataParserTest {
    @Test
    public void testTempSpread() throws Exception {
        WeatherDataParser aWeatherDataParser = new WeatherDataParser("src/main/resources/weather.dat");
        aWeatherDataParser.parse();
        assertNotNull(aWeatherDataParser.getData());
        assertFalse(aWeatherDataParser.getData().isEmpty());
        WeatherData aWeatherData = aWeatherDataParser.getSmallestSpread();

        assertNotNull(aWeatherData);
        assertEquals("14", aWeatherData.getDay());
        assertEquals(59, aWeatherData.getMinTemp());
        assertEquals(61, aWeatherData.getMaxTemp());
        assertEquals(2, aWeatherData.getSpread());
    }
}
