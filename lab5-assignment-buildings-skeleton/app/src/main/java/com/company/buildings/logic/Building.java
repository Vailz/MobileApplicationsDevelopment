package com.company.buildings.logic;

public class Building {
    private int length;
    private int width;
    private int lotLength;
    private int lotWidth;

    public Building(int length, int width, int lotLength, int lotWidth) {
        this.length = length;
        this.width = width;
        this.lotLength = lotLength;
        this.lotWidth = lotWidth;
    }

    public int calcBuildingArea() {
        return getArea();
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getLotLength() {
        return lotLength;
    }

    public void setLotLength(int lotLength) {
        this.lotLength = lotLength;
    }

    public int getLotWidth() {
        return lotWidth;
    }

    public void setLotWidth(int lotWidth) {
        this.lotWidth = lotWidth;
    }

    public int getArea() {
        return length * width;
    }

    public int calcLotArea() {
        return lotLength * lotWidth;
    }

    @Override
    public String toString() {
        return "Building dimensions: " + length + " x " + width
                + ", lot dimensions: " + lotLength + " x " + lotWidth;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Building building = (Building) o;
        return length == building.length && width == building.width && lotLength == building.lotLength && lotWidth == building.lotWidth;
    }

    @Override
    public int hashCode() {
        int result = length;
        result = 31 * result + width;
        result = 31 * result + lotLength;
        result = 31 * result + lotWidth;
        return result;
    }
}