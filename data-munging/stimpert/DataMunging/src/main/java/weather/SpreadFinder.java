package weather;

public class SpreadFinder {
    private final WeatherDayIterator fIt;
    private WeatherDay fMinDay = null;

    public SpreadFinder(WeatherDayIterator theIt) {
        fIt = theIt;

    }

    public void find() {
        int aMinSpread = Integer.MAX_VALUE;

        while (fIt.hasNext()) {
            WeatherDay aNext = fIt.next();
            int aSpread = aNext.getSpread();
            if (aSpread < aMinSpread) {
                aMinSpread = aSpread;
                fMinDay = aNext;
            }
        }
    }

    public WeatherDay getSmallestDay() {
        return fMinDay;
    }
}
