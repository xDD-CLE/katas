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
        FileSystemDataProvider<Day> provider = new FileSystemDataProvider<>();
        Stream<Day> days = provider.createFromLinesInFile("data/weather.dat", Day::new);
        assertEquals(31,days.count());
    }

    @Test
    public void itProvidesTeamsFromAFile() throws Exception {
        FileSystemDataProvider<Team> provider = new FileSystemDataProvider<>();
        Stream<Team> teams = provider.createFromLinesInFile("data/football.dat", Team::new);
        assertEquals(20, teams.count());
    }
}