package com.company.buildings.logic;

/**
 * This is the office class file, it is a subclass of Building.
 */
public class Office
        extends Building {

    // TODO - Put your code here.
    private String mBusinessName;
    private int mParkingSpaces;
    private static int sTotalOffices;

    public Office(int length, int width, int lotLength, int lotWidth) {
        super(length, width, lotLength, lotWidth);
        mBusinessName = "";
        mParkingSpaces = 0;
        sTotalOffices++;
    }

    public Office(int length, int width, int lotLength, int lotWidth, String businessName) {
        super(length, width, lotLength, lotWidth);
        mBusinessName = businessName;
        mParkingSpaces = 0;
        sTotalOffices++;
    }

    public Office(int length, int width, int lotLength, int lotWidth, String businessName, int parkingSpaces) {
        super(length, width, lotLength, lotWidth);
        mBusinessName = businessName;
        mParkingSpaces = parkingSpaces;
        sTotalOffices++;
    }

    public String getBusinessName() {
        return mBusinessName;
    }

    public int getParkingSpaces() {
        return mParkingSpaces;
    }

    public void setBusinessName(String businessName) {
        mBusinessName = businessName;
    }

    public void setParkingSpaces(int parkingSpaces) {
        mParkingSpaces = parkingSpaces;
    }

    public String toString() {
        if (mBusinessName.equals("") && mParkingSpaces == 0) {
            return "Business: unoccupied (total offices: " + sTotalOffices + ")";
        } else {
            return "Business name: " + mBusinessName + ", Parking spaces: " + mParkingSpaces;
        }
    }

    public boolean equals(Object other) {
        if (other instanceof Office) {
            Office o = (Office) other;
            return calcBuildingArea() == o.calcBuildingArea() && mParkingSpaces == o.mParkingSpaces;
        }
        return false;
    }
}