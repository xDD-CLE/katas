package com.xdd;


/**
 * Created by shah on 8/17/15.
 */
public class Team {
    public static final int NUMBER_OF_COLUMNS = 9;
    private final String name;
    private final boolean valid;
    private final int differenceInGoals;

    public Team(String input) {
        if (input != null) {
            String[] split = input.replaceFirst("\\W+", "").split("\\W+");
            this.valid = split.length == NUMBER_OF_COLUMNS;
            this.name = valid ? split[1] : "";
            this.differenceInGoals = valid ? Integer.parseInt(split[6]) - Integer.parseInt(split[7]) : 0;
        } else {
            this.name = "";
            this.valid = false;
            this.differenceInGoals = 0;
        }
    }

    public String getName() {
        return name;
    }

    public boolean isValid() {
        return valid;
    }

    public int getDifferenceInGoals() {
        return differenceInGoals;
    }
}
