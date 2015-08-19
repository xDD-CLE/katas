package com.xdd;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.Stream;

/**
 * Created by shah on 8/14/15.
 */
public class FileSystemDayProvider {

    private final String dayFilePath;

    public FileSystemDayProvider(String dayFilePath) {
        this.dayFilePath = dayFilePath;
    }

    public Stream<Day> getValidDays() throws IOException {
        Stream<String> lines = Files.lines(Paths.get(dayFilePath));
        return lines.map(line -> new Day(line)).filter(Day::isValid);
    }
}
