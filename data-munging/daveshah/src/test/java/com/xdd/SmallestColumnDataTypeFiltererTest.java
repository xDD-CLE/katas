package com.xdd;

import com.xdd.data.models.Day;
import com.xdd.data.models.Team;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

/**
 * Created by shah on 8/19/15.
 */
public class SmallestColumnDataTypeFiltererTest {

    @Test
    public void itCanGiveMeTheDayWithTheSmallestTemperatureDifference() throws Exception {

        SmallestColumnDataTypeFilterer<Day> smallestColumnDataTypeFilterer = new SmallestColumnDataTypeFilterer<>(new FileSystemDataProvider<>());

        Day day = smallestColumnDataTypeFilterer.smallestFromFile("data/weather.dat", Day::new).get();

        assertEquals("14",day.getNumericDay());
    }

    @Test
    public void itCanGiveMeTheTeamWithTheSmallestForOrAgainstDifference() throws Exception {

        SmallestColumnDataTypeFilterer<Team> smallestColumnDataTypeFilterer = new SmallestColumnDataTypeFilterer<>(new FileSystemDataProvider<>());

        Team team = smallestColumnDataTypeFilterer.smallestFromFile("data/football.dat", Team::new).get();

        assertEquals("Leicester", team.getName());
    }
}
