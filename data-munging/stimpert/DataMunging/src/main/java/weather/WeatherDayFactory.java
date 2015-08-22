package weather;

import common.RowFactory;

public class WeatherDayFactory implements RowFactory {

    private final String[] fHeaders;

    public WeatherDayFactory(String... theHeaders) {
        fHeaders = theHeaders;
    }

    @Override
    public WeatherDay create(String... theValues) {
        WeatherDay aWeatherDay = null;
        try {
            aWeatherDay = new WeatherDay(getDay(theValues), getMaxTemp(theValues), getMinTemp(theValues));
            if (-1 == aWeatherDay.getDayNum()) {
                aWeatherDay = null;
            }
        } catch (Exception e) {
        }
        return aWeatherDay;
    }

    private int getMinTemp(String[] theValues) {
        return convertToInt(get("MnT", fHeaders, theValues));
    }

    private int getMaxTemp(String[] theValues) {
        return convertToInt(get("MxT", fHeaders, theValues));
    }

    private int getDay(String[] theValues) {
        return convertToInt(get("Dy", fHeaders, theValues));
    }

    private int convertToInt(String theStr) {
        theStr = theStr.replaceAll("\\*", "");
        return Integer.parseInt(theStr);
    }

    private String get(String theHeaderName, String[] theHeaders, String[] theValues) {
        return theValues[getIndex(theHeaderName, theHeaders)];
    }

    private int getIndex(String theHeaderName, String[] theHeaders) {
        for (int i = 0; i < theHeaders.length; i++) {
            if (theHeaders[i].equals(theHeaderName)) {
                return i;
            }
        }
        return -1;
    }
}
