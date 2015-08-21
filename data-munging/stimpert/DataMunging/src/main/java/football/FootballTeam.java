package football;

import common.HasSpread;

import static java.lang.Integer.parseInt;

public class FootballTeam implements HasSpread {
    private final String fName;
    private final String fFor;
    private final String fAgainst;

    public FootballTeam(String theName, String theFor, String theAgainst) {
        fName = theName;
        fFor = theFor;
        fAgainst = theAgainst;
    }


    @Override
    public int getSpread() {
        return Math.abs(parseInt(fFor) - parseInt(fAgainst));
    }

    public String getName() {
        return fName;
    }
}
