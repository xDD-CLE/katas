package io;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class TabbedFileReader {
    private final String fPath;
    private Scanner fScan;

    public TabbedFileReader(String thePath) {
        fPath = thePath;
    }

    public void open() throws FileNotFoundException {
        fScan = new Scanner(new File(fPath));
    }

    public String[] next() {
        String aNext = fScan.nextLine().trim();
        return aNext.split("\\s+");
    }

    public void close() {
        //??
    }
}
