package com.company.buildings.logic;

public class Building {
    //объявляем переменные length - длина здания, width - ширина здания, lotLength - длина участка, lotWidth - ширина участка
    private int length;
    private int width;
    private int lotLength;
    private int lotWidth;

    // конструктор класса Building для инициализации и установки начальных значений
    //принимаем параметры, this. для присвоения значений переданных параметров четырем приватным переменным класса.
    public Building(int length, int width, int lotLength, int lotWidth) {
        this.length = length;
        this.width = width;
        this.lotLength = lotLength;
        this.lotWidth = lotWidth;
    }
     //Метод getArea() вычисляет и возвращает площадь здания.
    public int calcBuildingArea() {
        return getArea();
    }

    //Методы доступа (getter и setter) для четырех приватных переменных класса.
    // get - получение значения переменной из объекта этого класса, set - для изменение значения переменной в объекте этого класса.

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

    // Выводим информацию о здании
    @Override
    public String toString() {
        String result = "";
        if (length == 0 || width == 0) {
            result += "Неверные размеры здания";
        } else {
            result += "Размеры здания: " + length + " x " + width + ". ";
        }
        if (lotLength == 0 || lotWidth == 0) {
            result += "Неверные размеры участка";
        } else {
            result += "Размеры участка: " + lotLength + " x " +lotWidth + ".";
        }
        return result;
    }
}