package football;

import common.HasSpread;
import common.RowFactory;

public class FootballFactory implements RowFactory {

    private final String[] fHeaders;

    public FootballFactory(String[] theHeaders) {
        fHeaders = theHeaders;
    }

    @Override
    public HasSpread create(String... theValues) {
        if (theValues.length == 10) {
            return new FootballTeam(theValues[1], theValues[6], theValues[8]);
        }

        return null;
    }
}
