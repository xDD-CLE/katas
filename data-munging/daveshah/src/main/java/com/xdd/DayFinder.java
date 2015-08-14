package com.xdd;

import java.util.Optional;

/**
 * Created by shah on 8/14/15.
 */
public class DayFinder {

    private DayProvider dayProvider;

    public DayFinder(DayProvider dayProvider) {
        this.dayProvider = dayProvider;
    }

    public Day getDayWithSmallestTemperatureSpread() {
        Optional<Day> max = dayProvider.getDays().stream().max((day1, day2) -> (int) day2.getDifference() - (int) day1.getDifference());
        return max.orElse(new Day("invalidDay"));
    }
}
