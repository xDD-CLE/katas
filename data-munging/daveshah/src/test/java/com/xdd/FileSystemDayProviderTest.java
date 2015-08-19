package com.xdd;

import com.xdd.data.models.Day;
import com.xdd.data.models.Team;
import org.junit.Test;

import java.util.stream.Stream;

import static org.junit.Assert.assertEquals;

/**
 * Created by shah on 8/14/15.
 */
public class FileSystemDayProviderTest {

    @Test
    public void itProvidesDaysFromAFile() throws Exception {
        FileSystemDataProvider<Day> provider = new FileSystemDataProvider<>(Day::new);
        Stream<Day> days = provider.getValidColumnData("data/weather.dat");
        assertEquals(31,days.count());
    }

    @Test
    public void itProvidesTeamsFromAFile() throws Exception {
        FileSystemDataProvider<Team> provider2 = new FileSystemDataProvider<>(Team::new);
        Stream<Team> teams = provider2.getValidColumnData("data/football.dat");
        assertEquals(20, teams.count());
    }
}