package com.company.buildings.logic;

import android.util.Log;

import com.company.buildings.ui.OutputInterface;

/**
 * This is where the logic of this App is centralized for this
 * assignment.
 * <p>
 * The assignments are designed this way to simplify your early
 * Android interactions.  Designing the assignments this way allows
 * you to first learn key 'Java' features without having to beforehand
 * learn the complexities of Android.
 */
public class Logic 
       implements LogicInterface {
    /**
     * Used for logging.
     */
    public static final String TAG =
        Logic.class.getName();

    /**
     * Reference to the output object.
     */
    private OutputInterface mOut;

    /**
     * инициализируем поле вывода на экран
     */
    public Logic(OutputInterface out){
        mOut = out;
    }

    /**
     * Perform the computation to print the houses and offices and the
     * total neighborhood area.
     */

    // proces выполняет вычисления, необходимые для вывода информации об имеющихся домах и офисах, а также общей площади в районе.
    @Override
    public void process() {
        // Сначала создается новый объект BuildingList, который содержит все дома и офисы в районе
        final BuildingList list =
            new BuildingList();

        // Создаем массив домов из BuildingList
        final House[] house =
            list.getHouses();

        // Создаем массив офисов из BuildingList
        final Office[] office =
            list.getOffices();

        //вызываем метод print() класса Neighborhood с аргументами house, "Дома" и mOut, что приводит к выводу информации о домах.
        Neighborhood.print(house, "Дома", mOut);
        mOut.println(""); // пустая строка между строками
        //вызываем метод print() класса Neighborhood с аргументами house, "Офисы" и mOut, что приводит к выводу информации о офисах.
        Neighborhood.print(office, "Офисы", mOut);

        mOut.println(""); // пустая строка между строками

        // общая площадь в районе, которая вычисляется как сумма площадей домов и офисов в районе.
        mOut.println("Общая площадь в районе,: " +
                     (Neighborhood.calcArea(house) +
                      Neighborhood.calcArea(office)));
    }
}
