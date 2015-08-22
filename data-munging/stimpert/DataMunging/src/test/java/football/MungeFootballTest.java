package football;

import io.TabbedFileReader;
import org.junit.Test;
import weather.MyIterator;
import weather.SpreadFinder;

import java.io.FileNotFoundException;

import static org.junit.Assert.assertEquals;

public class MungeFootballTest {

    @Test
    public void shouldFindSmallestSpread() throws FileNotFoundException {
        TabbedFileReader aReader = new TabbedFileReader("football.dat");
        aReader.open();
        MyIterator aIt = new MyIterator(aReader, new FootballFactory(aReader.next()));
        SpreadFinder aFinder = new SpreadFinder(aIt);

        aFinder.find();

        FootballTeam aTeam = (FootballTeam) aFinder.getSmallestSpread();

        assertEquals("Aston_Villa", aTeam.getName());
    }
}
