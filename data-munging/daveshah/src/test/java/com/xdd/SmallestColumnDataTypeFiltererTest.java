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

        SmallestColumnDataTypeFilterer<Day> smallestColumnDataTypeFilterer = new SmallestColumnDataTypeFilterer<>(new FileSystemDataProvider<>(Day::new));

        Day day = smallestColumnDataTypeFilterer.getDayWithTheSmallestTemperatureSpreadFrom("data/weather.dat").get();

        assertEquals("14",day.getNumericDay());
    }

    @Test
    public void itCanGiveMeTheTeamWithTheSmallestForOrAgainstDifference() throws Exception {

        SmallestColumnDataTypeFilterer<Team> smallestColumnDataTypeFilterer = new SmallestColumnDataTypeFilterer<>(new FileSystemDataProvider<>(Team::new));

        Team team = smallestColumnDataTypeFilterer.getDayWithTheSmallestTemperatureSpreadFrom("data/football.dat").get();

        assertEquals("Leicester", team.getName());
    }
}
