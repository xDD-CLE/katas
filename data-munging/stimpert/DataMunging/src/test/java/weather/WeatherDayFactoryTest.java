package weather;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class WeatherDayFactoryTest {

    @Test
    public void shouldCreateWeatherDay() {
    	WeatherDayFactory aFactory = new WeatherDayFactory("Dy", "MxT", "MnT");

        WeatherDay aDay = aFactory.create("1", "88", "59");
        assertEquals(1, aDay.getDayNum());
        assertEquals(88, aDay.getMaxTemp());
        assertEquals(59, aDay.getMinTemp());

        aDay = aFactory.create("2", "90", "50");
        assertEquals(2, aDay.getDayNum());
        assertEquals(90, aDay.getMaxTemp());
        assertEquals(50, aDay.getMinTemp());

        aDay = aFactory.create("");
        assertNull(aDay);
    }
}
