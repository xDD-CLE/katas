package com.xdd;

import java.io.IOException;
import java.util.Optional;
import java.util.stream.Stream;

/**
 * Created by shah on 8/17/15.
 */
public class SoccerLeagueFilterer {

    private FileSystemDataProvider<Team> fileSystemTeamProvider;

    public SoccerLeagueFilterer(FileSystemDataProvider<Team> fileSystemTeamProvider) {
        this.fileSystemTeamProvider = fileSystemTeamProvider;
    }

    public Team getTeamWithTheSmallestDifferenceInGoals() throws IOException {
        Stream<Team> validTeams = fileSystemTeamProvider.getValidColumnData(Team::new);
        Optional<Team> max = validTeams.min((team1, team2) -> team1.getDifferenceInGoals() - team2.getDifferenceInGoals());
        return max.orElse(new Team(""));
    }
}
