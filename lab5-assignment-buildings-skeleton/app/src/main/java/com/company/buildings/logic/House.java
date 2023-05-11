package com.company.buildings.logic;

/**
 * Класс House расширяет класс Building, наследует все его поля и методыы. House - это жилой дом
 */
public class House
        extends Building {

    private String mOwner; // поле класса, которое хранит имя владельца дома
    private boolean mPool; // поле класса, которое определяет, имеет ли дом бассейн

    // инициализируем поля длины, ширины и размеров участка для дома.
    public House(int length, int width, int lotLength, int lotWidth) {
        super(length, width, lotLength, lotWidth);
    }

    // инициализируем поле владельца
    public House(int length, int width, int lotLength, int lotWidth, String owner) {
        super(length, width, lotLength, lotWidth);
        mOwner = owner;
    }

    // инициализируем поле бассейна
    public House(int length, int width, int lotLength, int lotWidth, String owner, boolean pool) {
        super(length, width, lotLength, lotWidth);
        mOwner = owner;
        mPool = pool;
    }

    public String getOwner() {
        return mOwner;
    } // метод, который возвращает имя владельца дома.

    public boolean hasPool() {
        return mPool;
    } // метод, который возвращает значение поля mPool, указывающее, имеет ли дом бассейн.

    public void setOwner(String owner) {
        mOwner = owner;
    } // метод, который устанавливает имя владельца дома.

    public void setPool(boolean pool) {
        mPool = pool;
    } // метод, который устанавливает значение поля (есть или нет)

    // возвращаем строку, содержащую информацию о доме, включая имя владельца и наличие бассейна.
    @Override
    public String toString() {
        // return "Владелец: " + mOwner + "; имеет" + (mPool ? " бассейн есть" : " большое открытое пространство");
        return "Owner: " + mOwner + "; has" + (mPool ? " a pool" : " a big open space");
    }
    // сравниваvм 2 объекта House и возвращаем true, если они имеют одинаковую площадь и наличие бассейна.
    @Override
    public boolean equals(Object obj) {
        // если первый объект дом и второй (если сравниваем одинаковые типы)
        if (obj == this) {
            return true;
        }
        // является ли переданный объект домом. Если это не так, метод возвращает false.
        if (!(obj instanceof House)) {
            return false;
        }
        // проверяем имеют ли одинаковую площадь и бассенн
        House other = (House) obj;
        return calcBuildingArea() == super.calcBuildingArea() && mPool == other.mPool;
    }
}