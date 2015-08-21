package weather;

import io.TabbedFileReader;

public class Runner {
    public static void main(String[] args) {
        TabbedFileReader aReader = new TabbedFileReader("weather.dat");
        MyIterator aIt = new MyIterator(aReader, new WeatherDayFactory(aReader.next()));
        SpreadFinder aFinder = new SpreadFinder(aIt);
        aFinder.find();
        System.out.println(aFinder.getSmallestSpread());
    }
}
