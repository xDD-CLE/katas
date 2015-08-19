package com.xdd;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.function.Function;
import java.util.stream.Stream;

/**
 * Created by shah on 8/14/15.
 */
public class FileSystemDataProvider<T extends ColumnData> {

    private final String dayFilePath;

    public FileSystemDataProvider(String dayFilePath) {
        this.dayFilePath = dayFilePath;
    }

    public Stream<T> getValidColumnData(Function<String,T> constructor) throws IOException {
        Stream<String> lines = Files.lines(Paths.get(dayFilePath));
        return lines.map(constructor).filter(T::isValid);
    }
}

