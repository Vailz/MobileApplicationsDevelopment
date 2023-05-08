package com.company.buildings.logic;

/**
 * This is the Cottage class file. It is a subclass of House.
 */
public class Cottage extends House {
    private boolean mSecondFloor;

    public Cottage(int dimension, int lotLength, int lotWidth) {
        super(dimension, dimension, lotLength, lotWidth);
        mSecondFloor = false;
    }

    public Cottage(int dimension, int lotLength, int lotWidth, String owner, boolean secondFloor) {
        super(dimension, dimension, lotLength, lotWidth, owner);
        mSecondFloor = secondFloor;
    }

    public boolean hasSecondFloor() {
        return mSecondFloor;
    }

    @Override
    public String toString() {
        String result = "Cottage dimensions: " + super.getLength() + " x " + super.getWidth()
                + ", lot dimensions: " + super.getLotLength() + " x " + super.getLotWidth()
                + ", owner: " + super.getOwner();
        if (mSecondFloor) {
            result += ", with a second floor";
        } else {
            result += ", without a second floor";
        }
        return result;
    }
}
