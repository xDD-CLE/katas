package weather;

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
        DAY(1),
        MAX_TEMP(2),
        MIN_TEMP(3);

        private final int fColumnPosition;

        public int getColumnPosition() {
            return fColumnPosition;
        }

        Column(int theHeaderPosition) {
            fColumnPosition = theHeaderPosition;
        }

    }
    public WeatherData(String[] theLine) {
        setDay(getColumnValue(Column.DAY.getColumnPosition(), theLine));
        setMinTemp(Integer.parseInt(getColumnValue(Column.MIN_TEMP.getColumnPosition(), theLine)));
        setMaxTemp(Integer.parseInt(getColumnValue(Column.MAX_TEMP.getColumnPosition(), theLine)));
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
