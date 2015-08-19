package com.xdd;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Created by shah on 8/17/15.
 */
public class FileSystemTeamProvider {
    private String fileLocation;

    public FileSystemTeamProvider(String fileLocation) {
        this.fileLocation = fileLocation;
    }

    public List<Team> getValidTeams() throws IOException {
        Stream<String> lines = Files.lines(Paths.get(fileLocation));
        return lines.map(line -> new Team(line)).filter(Team::isValid).collect(Collectors.toList());
    }
}
