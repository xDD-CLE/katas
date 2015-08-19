package com.xdd;

import com.xdd.data.models.ColumnData;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.function.Function;
import java.util.stream.Stream;

/**
 * Created by shah on 8/14/15.
 */
public class FileSystemDataProvider<T extends ColumnData> {

    private final Function<String, T> constructor;

    public FileSystemDataProvider(Function<String,T> constructor) {
        this.constructor = constructor;
    }

    public Stream<T> getValidColumnData(String fileLocation) throws IOException {
        Stream<String> lines = Files.lines(Paths.get(fileLocation));
        return lines.map(constructor).filter(T::isValid);
    }
}

