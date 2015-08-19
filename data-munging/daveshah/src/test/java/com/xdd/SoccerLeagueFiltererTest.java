package com.xdd;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

/**
 * Created by shah on 8/17/15.
 */
public class SoccerLeagueFiltererTest {

    @Test
    public void itPrintsProvidesTheTeamWithTheSmallestDifferenceInGoals() throws Exception {

        SoccerLeagueFilterer filterer = new SoccerLeagueFilterer(new FileSystemTeamProvider("data/football.dat"));

        Team team = filterer.getTeamWithTheSmallestDifferenceInGoals();

        assertEquals("Leicester",team.getName());
    }
}
