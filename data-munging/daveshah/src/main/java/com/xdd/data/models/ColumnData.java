package com.xdd.data.models;

/**
 * Created by shah on 8/18/15.
 */
public abstract class ColumnData implements Comparable<ColumnData> {

    protected String input;

    public ColumnData(String input) {
        this.input = input;
    }

    public boolean isValid() {
        return false;
    }

    abstract double getDifference();
}
