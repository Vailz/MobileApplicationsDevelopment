package com.company.buildings.logic;

/**
 * This is the House class file that extends Building.
 */
public class House
        extends Building {

    // TODO - Put your code here.
    private String mOwner;
    private boolean mPool;

    public House(int length, int width, int lotLength, int lotWidth) {
        super(length, width, lotLength, lotWidth);
    }

    public House(int length, int width, int lotLength, int lotWidth, String owner) {
        super(length, width, lotLength, lotWidth);
        mOwner = owner;
    }

    public House(int length, int width, int lotLength, int lotWidth, String owner, boolean pool) {
        super(length, width, lotLength, lotWidth);
        mOwner = owner;
        mPool = pool;
    }

    public String getOwner() {
        return mOwner;
    }

    public boolean hasPool() {
        return mPool;
    }

    public void setOwner(String owner) {
        mOwner = owner;
    }

    public void setPool(boolean pool) {
        mPool = pool;
    }

    @Override
    public String toString() {
        return "Owner: " + mOwner + "; has" + (mPool ? " a pool" : " a big open space");
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof House)) {
            return false;
        }
        House other = (House) obj;
        return calcBuildingArea() == super.calcBuildingArea() && mPool == other.mPool;
    }
}