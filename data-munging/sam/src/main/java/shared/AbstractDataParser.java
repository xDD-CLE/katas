package shared;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
        if (aFile.exists()) {
            BufferedReader aBufferedReader = new BufferedReader(new FileReader(aFile));
            String aUnSplitLine = aBufferedReader.readLine(); // flush header line
            while ((aUnSplitLine = aBufferedReader.readLine()) != null) {
                readLine(aUnSplitLine);
            }
        }
    }

    private void readLine(String theUnSplitLine) {
        try {
            String[] aLine = theUnSplitLine.split(getDelimiter());
            if (aLine.length > 1) {
                readDataLine(aLine);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected abstract String getDelimiter();

    protected abstract void readDataLine(String[] theLine);

    public String getFileName() {
        return fFileName;
    }

    public List<T> getData() {
        return fData;
    }
}
