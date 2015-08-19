package com.xdd;

import java.io.IOException;
import java.util.Optional;
import java.util.stream.Stream;

/**
 * Created by shah on 8/14/15.
 */
public class DayFilterer {

    private FileSystemDataProvider<Day> fileSystemDayProvider;

    public DayFilterer(FileSystemDataProvider<Day> fileSystemDayProvider) {
        this.fileSystemDayProvider = fileSystemDayProvider;
    }

    public Day getDayWithSmallestTemperatureSpread() throws IOException {
        Stream<Day> validColumnData = fileSystemDayProvider.getValidColumnData(Day::new);
        Optional<Day> max = validColumnData.max((day1, day2) -> (int) day2.getDifference() - (int) day1.getDifference());
        return max.orElse(new Day("invalidDay"));
    }
}
