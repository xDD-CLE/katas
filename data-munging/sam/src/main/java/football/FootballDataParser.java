package football;

import shared.AbstractDataParser;

/**
 * Created by sam on 8/14/15.
 */
public class FootballDataParser extends AbstractDataParser<FootballData> {
    public FootballDataParser(String theFileName) {
        super(theFileName);
    }

    @Override
    protected String getDelimiter() {
        return "\\W+";
    }

    @Override
    protected void readDataLine(String[] theLine) {
        getData().add(new FootballData(theLine));
    }

    public FootballData getSmallestGoalDifference() {
        FootballData aSmallestGoal = null;
        for (FootballData aFootBallData : getData()) {
            if (null == aSmallestGoal || aFootBallData.getGoalDifference() < aSmallestGoal.getGoalDifference()) {
                aSmallestGoal = aFootBallData;
            }
        }
        return aSmallestGoal;
    }
}
