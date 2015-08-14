package shared;

/**
 * Created by sam on 8/14/15.
 */
public abstract class AbstractData {

    protected String getColumnValue(int thePosition, String[] theLine) {
        return cleanValue(theLine[thePosition]);
    }

    abstract protected String cleanValue(String theValue);
}
