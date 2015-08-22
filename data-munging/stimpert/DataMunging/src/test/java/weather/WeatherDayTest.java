package weather;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class WeatherDayTest {
    @Test
    public void shouldHaveDayInfo() {
    	WeatherDay day = new WeatherDay(1, 88, 59);
        assertEquals(1, day.getDayNum());
        assertEquals(88, day.getMaxTemp());
        assertEquals(59, day.getMinTemp());
    }
}
