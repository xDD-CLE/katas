package com.xdd;

import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by shah on 8/17/15.
 */
public class FileSystemTeamProviderTest {

    @Test
    public void itProvidesTeamsFromAFile() throws Exception {

        FileSystemTeamProvider fileSystemTeamProvider = new FileSystemTeamProvider("data/football.dat");

        List<Team> teams = fileSystemTeamProvider.getValidTeams();

        assertEquals(20,teams.size());
    }
}