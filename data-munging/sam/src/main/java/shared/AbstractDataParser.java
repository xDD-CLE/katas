package shared;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by sam on 8/14/15.
 */
public abstract class AbstractDataParser<T> {
    protected final String fFileName;
    protected List<T> fData = new ArrayList<T>();

    public AbstractDataParser(String theFileName) {
        fFileName = theFileName;
    }

    public void parse() throws IOException {
        File aFile = new File(getFileName());
        Map<String, Integer> aHeaders = null;
        if (aFile.exists()) {
            BufferedReader aBufferedReader = new BufferedReader(new FileReader(aFile));
            String aUnSplitLine;
            while ((aUnSplitLine = aBufferedReader.readLine()) != null) {
                aHeaders = readLine(aHeaders, aUnSplitLine);
            }
        }
    }

    private Map<String, Integer> readLine(Map<String, Integer> theHeaders, String theUnSplitLine) {
        try {
            String[] aLine = theUnSplitLine.split(getDelimiter());
            if (aLine.length > 1) {
                if (null == theHeaders) {
                    theHeaders = readHeaders(aLine);
                } else {
                    readDataLine(theHeaders, aLine);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return theHeaders;
    }

    protected abstract String getDelimiter();

    protected abstract void readDataLine(Map<String, Integer> theHeaders, String[] theLine);

    private Map<String, Integer> readHeaders(String[] theLine) {
        Map<String, Integer> aHeaders;
        aHeaders = new HashMap<String, Integer>();
        for (int i = 0; i < theLine.length; i++) {
            aHeaders.put(theLine[i], i);

        }
        return aHeaders;
    }

    public String getFileName() {
        return fFileName;
    }

    public List<T> getData() {
        return fData;
    }
}
