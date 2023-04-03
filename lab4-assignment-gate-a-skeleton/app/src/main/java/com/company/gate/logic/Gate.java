package com.company.gate.logic;

/**
 * This file defines the Gate class.
 */
public class Gate { //начало определения класса Gate.
    //класс имеет три неизменяемые статические переменные IN, OUT и CLOSED, которые определяют возможные направления поворота ворот и текущее состояние ворот.
    // Первоначально ворота устанавливаются в закрытое состояние.
    public static final int IN = 1; //определяет направление поворота ворот, когда они открыты, для того, чтобы улитки вползли в загон.

    public static final int OUT = -1; //определяет направление поворота ворот, когда они открыты, для того, чтобы улитки выползли из загона.
    public static final int CLOSED = 0; //объявляет публичное статическое неизменяемое целочисленное поле CLOSED со значением 0. Это поле определяет состояние ворот, когда они закрыты.

    private int mSwing = CLOSED; //объявляет приватное целочисленное поле mSwing со значением CLOSED. Это поле хранит текущее направление поворота ворот.

    public boolean setSwing(int direction) { //setSwing(int direction) устанавливает направление поворота ворот в указанном направлении (IN или OUT)
        if (direction == IN || direction == OUT) {
            mSwing = direction;
            return true;
        } else {
            return false;
        }
    }

    public boolean open(int direction) { //open(int direction): открывает ворота в указанном направлении (IN или OUT)
        if (direction == IN || direction == OUT) {
            mSwing = direction;
            return true;
        } else {
            return false;
        }
    }

    public void close() {
        mSwing = CLOSED;
    } // закрывает ворота.

    public int getSwingDirection() {
        return mSwing;
    } //возвращает текущее направление поворота ворот.

    public int thru(int count) { //возвращает количество улиток, прошедших через ворота в зависимости от направления поворота ворот.
        if (mSwing == IN) {
            return count;
        } else if (mSwing == OUT) {
            return -count;
        } else {
            return 0;
        }
    }

    @Override
    public String toString() { //возвращает строку, описывающую текущее состояние ворот (открыты или закрыты и направление поворота).
        if (mSwing == CLOSED) {
            return "This gate is closed";
        } else if (mSwing == IN) {
            return "This gate is open and swings to enter the pen only";
        } else if (mSwing == OUT) {
            return "This gate is open and swings to exit the pen only";
        } else {
            return "This gate has an invalid swing direction";
        }
    }
}

