package football;

import shared.AbstractData;

import java.util.Map;

/**
 * Created by sam on 8/14/15.
 */
public class FootballData extends AbstractData{
    @Override
    protected String cleanValue(String theValue) {
        return theValue.replaceAll("\\d+\\.\\w", "");
    }

    enum Column {
        NAME("Team"),
        FOR_GOALS("F"),
        AGAINST_GOALS("A");

        private final String fHeaderText;

        public String getHeaderText() {
            return fHeaderText;
        }

        Column(String theHeaderText) {
            fHeaderText = theHeaderText;

        }

    }

    private String fName;
    private int fAgainstGoals;
    private int fForGoals;

    public FootballData(String[] theLine, Map<String, Integer> theHeaders) {
        setName(getColumnValue(Column.NAME.getHeaderText(), theLine, theHeaders));
        setAgainstGoals(Integer.parseInt(getColumnValue(Column.AGAINST_GOALS.getHeaderText(), theLine, theHeaders)));
        setForGoals(Integer.parseInt(getColumnValue(Column.FOR_GOALS.getHeaderText(), theLine, theHeaders)));
    }

    public int getGoalDifference() {
        return Math.abs(getAgainstGoals() - getForGoals());
    }

    public String getName() {
        return fName;
    }

    public void setName(String theName) {
        fName = theName;
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
