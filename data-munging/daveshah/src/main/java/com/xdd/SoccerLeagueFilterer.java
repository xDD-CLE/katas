package com.xdd;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

/**
 * Created by shah on 8/17/15.
 */
public class SoccerLeagueFilterer {

    private FileSystemTeamProvider fileSystemTeamProvider;

    public SoccerLeagueFilterer(FileSystemTeamProvider fileSystemTeamProvider) {
        this.fileSystemTeamProvider = fileSystemTeamProvider;
    }

    public Team getTeamWithTheSmallestDifferenceInGoals() throws IOException {
        List<Team> validTeams = this.fileSystemTeamProvider.getValidTeams();
        Optional<Team> max = validTeams.stream().min((t1, t2) -> t1.getDifferenceInGoals() - t2.getDifferenceInGoals());
        return max.orElse(new Team(""));
    }
}
