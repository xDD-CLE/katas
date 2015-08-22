package com.xdd.data.models;

import com.xdd.data.models.Team;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by shah on 8/17/15.
 */
public class TeamTest {

    @Test
    public void itKnowsValidity() throws Exception {
        String validTeam = "        1. Arsenal         38    26   9   3    79  -  36    87";
        String invalidTeam = null;
        String invalidTeam2 = " Team            P     W    L   D    F      A     Pts";
        String invalidTeam3 = "-------------------------------------------------------";

        assertFalse(new Team(invalidTeam).isValid());
        assertFalse(new Team(invalidTeam2).isValid());
        assertFalse(new Team(invalidTeam3).isValid());
        assertTrue(new Team(validTeam).isValid());
    }

    @Test
    public void itCalculatesItsDifferenceInGoals() throws Exception {
        String validTeam = "        1. Arsenal         38    26   9   3    79  -  36    87";
        double expectedDifferenceInGoals = 79 - 36;

        assertEquals(expectedDifferenceInGoals, new Team(validTeam).getDifference(), 0.1);
    }

    @Test
    public void itKnowsTheTeamName() {
        String validTeam = "        1. Arsenal         38    26   9   3    79  -  36    87";

        assertEquals("Arsenal",new Team(validTeam).getName());
    }

    @Test
    public void itComparesBasedOnGreatestTemperatureDifference() {
        Team greaterTeam = new Team("") {
            @Override
            public double getDifference() {
                return 22;
            }
        };

        Team lesserTeam = new Team("") {
            @Override
            public double getDifference() {
                return 21;
            }
        };

        assertEquals(1, greaterTeam.compareTo(lesserTeam));
        assertEquals(-1, lesserTeam.compareTo(greaterTeam));
        assertEquals(0, greaterTeam.compareTo(greaterTeam));
    }
}