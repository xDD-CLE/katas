package football;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

/**
 * Created by sam on 8/14/15.
 */
public class FootballDataParserTest {
    @Test
    public void testGoalSpread() throws Exception {
        FootballDataParser aFootballDataParser = new FootballDataParser("src/main/resources/football.dat");
        aFootballDataParser.parse();
        assertNotNull(aFootballDataParser.getData());
        assertFalse(aFootballDataParser.getData().isEmpty());

        assertNotNull(aFootballDataParser.getData());
        assertFalse(aFootballDataParser.getData().isEmpty());

        FootballData aFootballData = aFootballDataParser.getSmallestGoalDifference();
        assertNotNull(aFootballData);
        assertEquals("Aston_Villa", aFootballData.getTeam());
        assertEquals(47, aFootballData.getAgainstGoals());
        assertEquals(46, aFootballData.getForGoals());
        assertEquals(1, aFootballData.getGoalDifference());
    }
}
