package weather;

import io.TabbedFileReader;

import java.io.FileNotFoundException;
import java.util.Iterator;

public class WeatherDayIterator implements Iterator<WeatherDay> {

    private final TabbedFileReader fReader;
    private final WeatherDayFactory fFactory;
    private WeatherDay fCache;

    public WeatherDayIterator(TabbedFileReader theReader) {
        fReader = theReader;
        try {
            fReader.open();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        fFactory = new WeatherDayFactory(fReader.next());
        fReader.next(); //skip blank line
    }

    @Override
    public boolean hasNext() {
        if (fCache == null) {
            fCache = next();
        }
        return fCache != null;
    }

    @Override
    public WeatherDay next() {
        if (fCache == null) {
            fCache = fFactory.createDay(fReader.next());
        }
        WeatherDay aNext = fCache;
        fCache = null;
        return aNext;
    }

    @Override
    public void remove() {

    }
}
