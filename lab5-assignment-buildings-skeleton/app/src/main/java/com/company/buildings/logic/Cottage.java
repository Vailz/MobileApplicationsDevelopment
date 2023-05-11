package com.company.buildings.logic;

/**
 * Коттедж расширяет класс Дом.
 */
public class Cottage
        extends House {

    // указываем поле, указывающее на наличие второго этажа в коттедже.
    private boolean mSecondFloor;

    // dimension измерение
    public Cottage(int dimension, int lotLength, int lotWidth) {
        super(dimension, dimension, lotLength, lotWidth);
        //  коттедж не имеет второго этажа по умолчанию
        mSecondFloor = false;
    }

    public Cottage(int dimension, int lotLength, int lotWidth, String owner, boolean secondFloor) {
        super(dimension, dimension, lotLength, lotWidth, owner);
        //указывает, имеет коттедж второй этаж.
        mSecondFloor = secondFloor;
    }
 // метод hasSecondFloor - есть второй этаж
    public boolean hasSecondFloor() {
        return mSecondFloor;
    }

    @Override
    public String toString() {
        String secondFloorString = mSecondFloor ? "со вторым этажом" : "без второго этажа";
        return "Коттедж этого человка: " + getOwner() + ", " + getLength() + "x" + getWidth() + ", " +
                "размер участка: " + getLotLength() + "x" + getLotWidth() + ", " + secondFloorString;
    }
}