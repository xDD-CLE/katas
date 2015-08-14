package football;

import shared.AbstractData;

/**
 * Created by sam on 8/14/15.
 */
public class FootballData extends AbstractData{
    @Override
    protected String cleanValue(String theValue) {
        return theValue;
    }

    enum Column {
        TEAM(2),
        FOR_GOALS(7),
        AGAINST_GOALS(8);

        private final int fColumnPosition;

        public int getColumnPosition() {
            return fColumnPosition;
        }

        Column(int theColumnPosition) {
            fColumnPosition = theColumnPosition;

        }
    }

    private String fTeam;
    private int fAgainstGoals;
    private int fForGoals;

    public FootballData(String[] theLine) {
        setTeam(getColumnValue(Column.TEAM.getColumnPosition(), theLine));
        setAgainstGoals(Integer.parseInt(getColumnValue(Column.AGAINST_GOALS.getColumnPosition(), theLine)));
        setForGoals(Integer.parseInt(getColumnValue(Column.FOR_GOALS.getColumnPosition(), theLine)));
    }

    public int getGoalDifference() {
        return Math.abs(getAgainstGoals() - getForGoals());
    }

    public String getTeam() {
        return fTeam;
    }

    public void setTeam(String theTeam) {
        fTeam = theTeam;
    }

    public int getAgainstGoals() {
        return fAgainstGoals;
    }

    public void setAgainstGoals(int theAgainstGoals) {
        fAgainstGoals = theAgainstGoals;
    }

    public int getForGoals() {
        return fForGoals;
    }
    public void setForGoals(int theForGoals) {
        fForGoals = theForGoals;
    }
}
