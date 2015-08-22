package com.xdd;

import com.xdd.data.models.ColumnData;

import java.io.IOException;
import java.util.Optional;
import java.util.function.Function;

/**
 * Created by shah on 8/19/15.
 */
public class SmallestColumnDataTypeFilterer<T extends ColumnData> {

    private final FileSystemDataProvider<T> fileSystemDataProvider;

    public SmallestColumnDataTypeFilterer(FileSystemDataProvider<T> fileSystemDataProvider){
        this.fileSystemDataProvider = fileSystemDataProvider;
    }

    public Optional<T> smallestFromFile(String fileLocation, Function<String, T> constructor) throws IOException {
        return fileSystemDataProvider.createFromLinesInFile(fileLocation,constructor).min(T::compareTo);
    }
}
