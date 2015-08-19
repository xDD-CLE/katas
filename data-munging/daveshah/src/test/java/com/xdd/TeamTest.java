package com.xdd;

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
        int expectedDifferenceInGoals = 79 - 36;

        assertEquals(expectedDifferenceInGoals,new Team(validTeam).getDifferenceInGoals());
    }

    @Test
    public void itKnowsTheTeamName() {
        String validTeam = "        1. Arsenal         38    26   9   3    79  -  36    87";

        assertEquals("Arsenal",new Team(validTeam).getName());
    }
}