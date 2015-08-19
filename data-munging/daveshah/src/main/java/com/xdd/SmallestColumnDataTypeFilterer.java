package com.xdd;

import com.xdd.data.models.ColumnData;

import java.io.IOException;
import java.util.Optional;

/**
 * Created by shah on 8/19/15.
 */
public class SmallestColumnDataTypeFilterer<T extends ColumnData> {

    private final FileSystemDataProvider<T> fileSystemDataProvider;

    public SmallestColumnDataTypeFilterer(FileSystemDataProvider<T> fileSystemDataProvider){
        this.fileSystemDataProvider = fileSystemDataProvider;
    }

    public Optional<T> getDayWithTheSmallestTemperatureSpreadFrom(String fileLocation) throws IOException {
        return fileSystemDataProvider.getValidColumnData(fileLocation).min(T::compareTo);
    }
}
