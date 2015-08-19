package com.xdd;

import java.io.IOException;
import java.util.Optional;

/**
 * Created by shah on 8/14/15.
 */
public class DayFilterer {

    private FileSystemDayProvider fileSystemDayProvider;

    public DayFilterer(FileSystemDayProvider fileSystemDayProvider) {
        this.fileSystemDayProvider = fileSystemDayProvider;
    }

    public Day getDayWithSmallestTemperatureSpread() throws IOException {
        Optional<Day> max = fileSystemDayProvider.getValidDays().max((day1, day2) -> (int) day2.getDifference() - (int) day1.getDifference());
        return max.orElse(new Day("invalidDay"));
    }
}
