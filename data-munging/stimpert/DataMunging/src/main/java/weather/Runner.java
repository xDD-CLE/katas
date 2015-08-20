package weather;

import io.TabbedFileReader;

public class Runner {
    public static void main(String[] args) {
        TabbedFileReader aReader = new TabbedFileReader("weather.dat");
        WeatherDayIterator aIt = new WeatherDayIterator(aReader);
        SpreadFinder aFinder = new SpreadFinder(aIt);
        aFinder.find();
        System.out.println(aFinder.getSmallestDay());
    }
}
