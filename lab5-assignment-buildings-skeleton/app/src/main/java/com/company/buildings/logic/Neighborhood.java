package com.company.buildings.logic;

import java.io.FileNotFoundException;

import com.company.buildings.ui.OutputInterface;

/**
 * This Neighborhood utility class provides static helper methods the
 * print a Building List and calculate the area of a Building list.
 * A utility class in Java should always be final and have a private
 * constructor, as per https://en.wikipedia.org/wiki/Utility_class.
 */

// объявляем класс
public final class Neighborhood {

    // объявление статического метода print, который принимает массив зданий, заголовок и объект OutputInterface для вывода информации в пользовательский интерфейс
    // buidlgin[] - массив, buildings - является ссылкой на этот массив. В этом массиве могут содержаться объекты класса House, Office и Cottage
    //String header выводит заголовки для зданий "House" "Office" "Коттедж"
    //OutputInterface out интерфейс для вывода на экран
    public static void print(Building[] buildings, String header, OutputInterface out) {
        out.print(header);

        // цикл, который проходится по всем объектам зданий, находящихся в массиве buildings и выводит информацию о каждом здании с помощью интерфейса OutputInterface.
        // Building building - объявление переменной building типа Building
        for (Building building : buildings) {
            out.print(building.toString());
        }
    }

// вычисляем общую площадь всех зданий
    public static int calcArea(Building[] buildings) {
        int area = 0;
        for (Building building : buildings) {
            area += building.calcBuildingArea();
        }
        return area;
    }
}