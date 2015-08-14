package shared;

import java.util.Map;

/**
 * Created by sam on 8/14/15.
 */
public abstract class AbstractData {

    protected String getColumnValue(String theHeaderText, String[] theLine, Map<String, Integer> theHeaders) {
        return cleanValue(theLine[theHeaders.get(theHeaderText)]);
    }

    abstract protected String cleanValue(String theValue);
}
