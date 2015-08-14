package football;

import shared.AbstractDataParser;

import java.util.Map;

/**
 * Created by sam on 8/14/15.
 */
public class FootballDataParser extends AbstractDataParser<FootballData> {
    public FootballDataParser(String theFileName) {
        super(theFileName);
    }

    @Override
    protected String getDelimiter() {
        return "\\W{2,}";
    }

    @Override
    protected void readDataLine(Map<String, Integer> theHeaders, String[] theLine) {
        getData().add(new FootballData(theLine, theHeaders));
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
