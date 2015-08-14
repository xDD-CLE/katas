package com.xdd;

import java.util.Optional;

/**
 * Created by shah on 8/14/15.
 */
public class DayFilterer {

    private FileSystemDayProvider fileSystemDayProvider;

    public DayFilterer(FileSystemDayProvider fileSystemDayProvider) {
        this.fileSystemDayProvider = fileSystemDayProvider;
    }

    public Day getDayWithSmallestTemperatureSpread() {
        Optional<Day> max = fileSystemDayProvider.getValidDays().stream().max((day1, day2) -> (int) day2.getDifference() - (int) day1.getDifference());
        return max.orElse(new Day("invalidDay"));
    }
}
