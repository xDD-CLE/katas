package com.xdd;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.Stream;

/**
 * Created by shah on 8/17/15.
 */
public class FileSystemTeamProvider {
    private String fileLocation;

    public FileSystemTeamProvider(String fileLocation) {
        this.fileLocation = fileLocation;
    }

    public Stream<Team> getValidTeams() throws IOException {
        Stream<String> lines = Files.lines(Paths.get(fileLocation));
        return lines.map(line -> new Team(line)).filter(Team::isValid);
    }
}
