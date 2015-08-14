package com.xdd;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Created by shah on 8/14/15.
 */
public class FileSystemDayProvider {
    private final List<Day> days;

    public FileSystemDayProvider(String dayFilePath) throws IOException {
        Stream<String> lines = Files.lines(Paths.get(dayFilePath));
        this.days = lines.map(s -> new Day(s)).filter(Day::isValid).collect(Collectors.toList());
    }

    public List<Day> getValidDays() {
        return days;
    }
}
