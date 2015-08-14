package weather;

import java.util.Map;

/**
 * Created by sam on 8/14/15.
 */
public class WeatherData extends shared.AbstractData {
    private String fDay;
    private int fMinTemp;
    private int fMaxTemp;

    @Override
    protected String cleanValue(String theValue) {
        return theValue.replaceAll("\\*", "");
    }

    enum Column {
        DAY("Dy"),
        MIN_TEMP("MnT"),
        MAX_TEMP("MxT");

        private final String fHeaderText;

        public String getHeaderText() {
            return fHeaderText;
        }

        Column(String theHeaderText) {
            fHeaderText = theHeaderText;
        }

    }
    public WeatherData(String[] theLine, Map<String, Integer> theHeaders) {
        setDay(getColumnValue(Column.DAY.getHeaderText(), theLine, theHeaders));
        setMinTemp(Integer.parseInt(getColumnValue(Column.MIN_TEMP.getHeaderText(), theLine, theHeaders)));
        setMaxTemp(Integer.parseInt(getColumnValue(Column.MAX_TEMP.getHeaderText(), theLine, theHeaders)));
    }

    public String getDay() {
        return fDay;
    }

    public void setDay(String theDay) {
        fDay = theDay;
    }

    public void setMaxTemp(int theMaxTemp) {
        fMaxTemp = theMaxTemp;
    }

    public int getMaxTemp() {
        return fMaxTemp;
    }

    public int getMinTemp() {
        return fMinTemp;
    }

    public void setMinTemp(int theMinTemp) {
        fMinTemp = theMinTemp;
    }

    public int getSpread() {
        return getMaxTemp() - getMinTemp();
    }
}
