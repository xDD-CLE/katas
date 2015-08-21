package weather;

import common.HasSpread;
import common.RowFactory;
import io.TabbedFileReader;

import java.io.FileNotFoundException;
import java.util.Iterator;

public class MyIterator implements Iterator<HasSpread> {

    private final TabbedFileReader fReader;
    private final RowFactory fFactory;
    private HasSpread fCache;

    public MyIterator(TabbedFileReader theReader, RowFactory theFactory) {
        fReader = theReader;
        try {
            fReader.open();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        fFactory = theFactory;
        fReader.next(); //skip blank line
        fReader.next(); //skip blank line
    }

    @Override
    public boolean hasNext() {
        if (fCache == null) {
            fCache = next();
        }
        return fCache != null;
    }

    @Override
    public HasSpread next() {
        if (fCache == null) {
            fCache = fFactory.create(fReader.next());
        }
        HasSpread aNext = fCache;
        fCache = null;
        return aNext;
    }

    @Override
    public void remove() {

    }
}
