package weather;

import shared.AbstractDataParser;

import java.util.Map;

/**
 * Created by sam on 8/14/15.
 */
public class WeatherDataParser extends AbstractDataParser<WeatherData> {

    public WeatherDataParser(String theFileName) {
        super(theFileName);
    }

    @Override
    protected String getDelimiter() {
        return "\\W+";
    }

    @Override
    protected void readDataLine(String[] theLine) {
        getData().add(new WeatherData(theLine));
    }

    public WeatherData getSmallestSpread() {
        WeatherData aSmallest = null;
        for (WeatherData aWeatherData : getData()) {
            if (aSmallest == null || aWeatherData.getSpread() < aSmallest.getSpread()) {
                aSmallest = aWeatherData;
            }
        }
        return aSmallest;
    }

}
