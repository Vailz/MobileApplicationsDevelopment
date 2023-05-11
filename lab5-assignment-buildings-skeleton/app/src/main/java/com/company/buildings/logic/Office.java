package com.company.buildings.logic;

import java.util.Objects;

/**
 * Класс Office является подклассом класса Building
 */
public class Office
        extends Building {

    // объявляем переменные
    private String mBusinessName; // название бизнеса
    private int mParkingSpaces; // количество парковочных мест
    private static int sTotalOffices; // общее количество офисов

    // конструктор класса Office, который принимает параметры length (длина), width (ширина), lotLength (длина участка) и lotWidth (ширина участка).
    public Office(int length, int width, int lotLength, int lotWidth) {
        super(length, width, lotLength, lotWidth);
        //инициализируем переменные
        mBusinessName = "";
        mParkingSpaces = 0;
        sTotalOffices++; // увеличивается значение переменной sTotalOffices на 1.
    }

    //еще один конструктор класса Office, который принимает дополнительный параметр businessName (название бизнеса).
    public Office(int length, int width, int lotLength, int lotWidth, String businessName) {
        super(length, width, lotLength, lotWidth);
        mBusinessName = businessName;
        mParkingSpaces = 0;
        sTotalOffices++;
    }

    //третий конструктор класса Office, который принимает дополнительные параметры businessName (название бизнеса) и parkingSpaces (количество парковочных мест
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

//    public String toString() {
//        //Создаем новую строку
//        String res = "Бизнес: ";
//        // Если имя бизнеса (mBusinessName) является null или пустой строкой, то мы добавляем "не занятый", иначе мы добавляем имя бизнеса с помощью метода getBusinessName().
//        res += (Objects.isNull(mBusinessName) || "".equals(mBusinessName)) ? "не занятый" : getBusinessName();
//        // Если количество парковочных мест (mParkingSpaces) равно 0, то мы ничего не добавляем, иначе мы добавляем строку "; имеет " + getParkingSpaces() + " парковочных мест", где getParkingSpaces() возвращает количество парковочных мест.
//        res += (mParkingSpaces == 0) ? "" : "; имеет" + getParkingSpaces() + " парковочных мест";
//        // Если количество офисов равно 0, тогда ничего, иначе выводим сколько всего офисов
//        res += (sTotalOffices == 0) ? "" : " (Всего офисов: " + sTotalOffices + ")";
//        return res;
//    }

    public String toString() {
        //Создаем новую строку
        String res = "Business: ";
        // // Если имя бизнеса (mBusinessName) является null или пустой строкой, то мы добавляем "не занятый", иначе мы добавляем имя бизнеса с помощью метода getBusinessName().
        res += (Objects.isNull(mBusinessName) || "".equals(mBusinessName)) ? "unoccupied" : getBusinessName();
        //  // Если количество парковочных мест (mParkingSpaces) равно 0, то мы ничего не добавляем, иначе мы добавляем строку "; имеет " + getParkingSpaces() + " парковочных мест", где getParkingSpaces() возвращает количество парковочных мест.
        res += (mParkingSpaces == 0) ? "" : "; has " + getParkingSpaces() + " parking spaces";
        // Если количество офисов равно 0, тогда ничего, иначе выводим сколько всего офисов
        res += (sTotalOffices == 0) ? "" : " (total offices: " + sTotalOffices + ")";
        return res;
    }

    public boolean equals(Object other) {
        // является ли переданный объект other офисом
        if (other instanceof Office) {

            // Если объект other является экземпляром класса Office, то приводим его к типу Office и сохраняем в переменную o.
            Office o = (Office) other;
            // Далее сравниваем площади двух зданий this и o с помощью метода calcBuildingArea() и количество парковочных мест mParkingSpaces в этих зданиях.
            return calcBuildingArea() == o.calcBuildingArea() && mParkingSpaces == o.mParkingSpaces;
        }
        // Если объект other не является экземпляром класса Office, то возвращаем false.
        return false;
    }
}