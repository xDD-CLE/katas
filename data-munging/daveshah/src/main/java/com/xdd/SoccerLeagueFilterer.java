package com.xdd;

import java.io.IOException;
import java.util.Optional;
import java.util.stream.Stream;

/**
 * Created by shah on 8/17/15.
 */
public class SoccerLeagueFilterer {

    private FileSystemTeamProvider fileSystemTeamProvider;

    public SoccerLeagueFilterer(FileSystemTeamProvider fileSystemTeamProvider) {
        this.fileSystemTeamProvider = fileSystemTeamProvider;
    }

    public Team getTeamWithTheSmallestDifferenceInGoals() throws IOException {
        Stream<Team> validTeams = this.fileSystemTeamProvider.getValidTeams();
        Optional<Team> max = validTeams.min((t1, t2) -> t1.getDifferenceInGoals() - t2.getDifferenceInGoals());
        return max.orElse(new Team(""));
    }
}
