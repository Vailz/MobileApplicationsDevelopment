package com.company.birthdayprob.logic;

import java.util.Random;

import com.company.birthdayprob.ui.OutputInterface;

/**
 * This is where the logic of this App is centralized for this assignment.
 * <p>
 * The assignments are designed this way to simplify your early Android interactions.
 * Designing the assignments this way allows you to first learn key 'Java' features without
 * having to beforehand learn the complexities of Android.
 *
 */
public class Logic 
       implements LogicInterface {
    /**
     * This is a String to be used in Logging (if/when you decide you
     * need it for debugging).
     */
    public static final String TAG =
        Logic.class.getName();

    /**
     * This is the variable that stores our OutputInterface instance.
     * <p>
     * This is how we will interact with the User Interface
     * [MainActivity.java].
     * <p>
     * It is called 'mOut' because it is where we 'out-put' our
     * results. (It is also the 'in-put' from where we get values
     * from, but it only needs 1 name, and 'mOut' is good enough).
    */
    OutputInterface mOut;

    /**
     * This is the constructor of this class.
     * <p>
     * It assigns the passed in [MainActivity] instance
     * (which implements [OutputInterface]) to 'out'
     */
    public Logic(OutputInterface out){
        mOut = out;
    }

    /**
     * This is the method that will (eventually) get called when the
     * on-screen button labelled 'Process...' is pressed.
     */
    public void process() {
        int groupSize = mOut.getSize();
        int simulationCount = mOut.getCount();

        if (groupSize < 2 || groupSize > 365) {
            mOut.makeAlertToast("Group Size must be in the range 2-365.");
            return;
        }
        if (simulationCount <= 0) {
            mOut.makeAlertToast("Simulation Count must be positive.");
            return;
        }

        double percent = calculate(groupSize, simulationCount);

        // report results
        mOut.println("For a group of " + groupSize + " people, the percentage");
        mOut.println("of times that two people share the same birthday is");
        mOut.println(String.format("%.2f%% of the time.", percent));

    }

    /**
     * This is the method that actually does the calculations.
     * <p>
     * We provide you this method that way we can test it with unit testing.
     */

    //объявление метода calculate с двумя аргументами - size (размер группы) и count (количество симуляций).
    public static double calculate(int size, int count) {
        //создание переменной для отслеживания количества симуляций, в которых были найдены пары с одинаковыми днями рождения.
        int matchCount = 0;
        //цикл для запуска симуляций count раз.
        for (int i = 0; i < count; i++) {
            //создание объекта Random для генерации случайных чисел для каждой симуляции.
            // Используется индекс симуляции i+1 для создания нового объекта Random на каждой итерации цикла, чтобы получить разные последовательности случайных чисел.
            Random random = new Random(i + 1);
            //создание массива для отслеживания числа людей, родившихся в каждый день года.
            int[] birthdays = new int[365];
            //создание переменной для отслеживания количества пар с одинаковыми днями рождения.
            int pairCount = 0;
            //цикл для генерации случайных дней рождения для каждого человека в группе.
            for (int j = 0; j < size; j++) {
                //генерация случайного числа в диапазоне от 0 до 364, соответствующего дню рождения.
                int birthday = random.nextInt(365);
                //увеличение счетчика людей, родившихся в этот день года.
                birthdays[birthday]++;
                //проверка, есть ли уже два человека, родившиеся в этот день года.
                if (birthdays[birthday] == 2) {
                    //если есть, то увеличиваем счетчик пар с одинаковыми днями рождения.
                    pairCount++;
                    //сбрасываем счетчик для этого дня года.
                    birthdays[birthday] = 0;
                }
            }
            //если была найдена хотя бы одна пара с одинаковыми днями рождения, увеличиваем счетчик совпадений.
            if (pairCount > 0) {
                matchCount++;
            }
        }
        //вычисление процента симуляций, в которых были найдены пары с одинаковыми днями рождения.
        return (double) matchCount / count * 100;
    }
}