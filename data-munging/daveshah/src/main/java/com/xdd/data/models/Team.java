package com.xdd.data.models;


import com.xdd.data.models.ColumnData;

import static java.lang.Integer.parseInt;

/**
 * Created by shah on 8/17/15.
 */
public class Team extends ColumnData {
    public static final int NUMBER_OF_COLUMNS = 9;
    public static final int POSITION_OF_NAME = 1;
    public static final int POSITION_OF_GOALS_FOR = 6;
    public static final int POSITION_OF_GOALS_AGAINST = 7;
    private final String name;
    private final boolean valid;
    private final int differenceInGoals;

    public Team(String input) {
        super(input);
        if (input != null) {
            String[] split = input.replaceFirst("\\W+", "").split("\\W+");
            this.valid = split.length == NUMBER_OF_COLUMNS;
            this.name = valid ? split[POSITION_OF_NAME] : "";
            this.differenceInGoals = valid ? parseInt(split[POSITION_OF_GOALS_FOR]) - parseInt(split[POSITION_OF_GOALS_AGAINST]) : 0;
        } else {
            this.name = "";
            this.valid = false;
            this.differenceInGoals = 0;
        }
    }

    public String getName() {
        return name;
    }

    @Override
    public boolean isValid() {
        return valid;
    }

    @Override
    public double getDifference() {
        return differenceInGoals;
    }

    @Override
    public int compareTo(ColumnData o) {
        return (int) (this.getDifference() - o.getDifference());
    }
}
