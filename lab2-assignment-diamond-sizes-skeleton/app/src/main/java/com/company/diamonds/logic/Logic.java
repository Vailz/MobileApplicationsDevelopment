package com.company.diamonds.logic;
import java.util.Arrays;
import com.company.diamonds.ui.OutputInterface;

/**
 * This is where the logic of this App is centralized for this assignment.
 * <p>
 * The assignments are designed this way to simplify your early
 * Android interactions.  Designing the assignments this way allows
 * you to first learn key 'Java' features without having to beforehand
 * learn the complexities of Android.
 */
public class Logic
       implements LogicInterface {
    /**
     * This is a String to be used in Logging (if/when you decide you
     * need it for debugging).
     */
    public static final String TAG = Logic.class.getName();

    /**
     * This is the variable that stores our OutputInterface instance.
     * <p>
     * This is how we will interact with the User Interface [MainActivity.java].
     * <p>
     * It is called 'out' because it is where we 'out-put' our
     * results. (It is also the 'in-put' from where we get values
     * from, but it only needs 1 name, and 'out' is good enough).
     */
    private OutputInterface mOut;

    /**
     * This is the constructor of this class.
     * <p>
     * It assigns the passed in [MainActivity] instance (which
     * implements [OutputInterface]) to 'out'.
     */
    public Logic(OutputInterface out){
        mOut = out;
    }

    /**
     * This is the method that will (eventually) get called when the
     * on-screen button labeled 'Process...' is pressed.
     */
    public void process(int size) {
        // Вычисляем длину строки, на основе размера алмаза
        int rowLength = 2 * size + 2;
        // Создаем массив символов для строки и заполняем его пробелами
        char[] row = new char[rowLength];
        Arrays.fill(row, ' ');

        // Перебираем все строки алмаза
        for (int i = -size; i <= size; i++) {
            // Если индекс выходит за границы строки, то переходим к следующей итерации
            if (i + size < 0 || i + size >= rowLength) {
                continue;
            }
            // Перебираем все символы в строке
            for (int j = -size - 1; j <= size + 1; j++) {
                // Если символ в середине строки, то переходим к следующей итерации
                if (j == 0) {
                    continue;
                }
                // Иначе выбираем символ в зависимости от его положения в строке
                switch (getSymbolType(i, j, size)) {
                    case 1:
                        mOut.print(Math.abs(i) == size ? "+" : "|");
                        break;
                    case 2:
                        mOut.print("-");
                        break;
                    case 3:
                        mOut.print(j == -size ? "<" : ">");
                        break;
                    case 4:
                        mOut.print("\\");
                        break;
                    case 5:
                        mOut.print("/");
                        break;
                    case 6:
                        mOut.print((size - i) % 2 != 0 ? "=" : "-");
                        break;
                    default:
                        mOut.print(" ");
                        break;
                }
            }
            // Переходим на новую строку
            mOut.println("");
        }
    }
//новый метод getSymbolType, который возвращает тип символа на основе его положения в строке.
    private int getSymbolType(int i, int j, int size) {
        if (Math.abs(j) == size + 1) {
            return 1;
        } else if (Math.abs(i) == size) {
            return 2;
        } else if (i == 0 && Math.abs(j) == size) {
            return 3;
        } else if (Math.abs(i - j) == size) {
            return 4;
        } else if (Math.abs(i + j) == size) {
            return 5;
        } else if (Math.abs(i) + Math.abs(j) < size) {
            return 6;
        } else {
            return 7;
        }
    }
}
