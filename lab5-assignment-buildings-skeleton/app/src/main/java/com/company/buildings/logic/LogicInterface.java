package com.company.buildings.logic;

/**
 * This Interface exists to help simplify the interactions between the
 * UI (User Interface: [MainActivity.java] in this app) and the Logic
 * class [Logic.java].
 *
 * This Interface defines the 'void process()' method that
 * [Logic.java] will promise to implement. This allows
 * [MainActivity.java] to store an instance of [Logic.java] inside a
 * 'LogicInterface' variable (mLogic inside [MainActivity.java])
 */

// определяет единственный метод process(), который класс Logic обязуется реализовать.
// Метод process() в классе Logic выполняет вычисления для вывода информации о домах, офисах и общей площади района.
public interface LogicInterface {
    /**
     * This method gets called (indirectly via [MainActivity.java])
     * when the button labeled 'Process...' is pressed.
     */
    void process();
}
