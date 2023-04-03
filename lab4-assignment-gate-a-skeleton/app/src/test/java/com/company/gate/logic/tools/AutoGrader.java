package com.company.gate.logic.tools;

import android.util.Log;

import org.junit.Test;

import java.io.File;

import com.company.gate.logic.GateUnitTests;

/**
 * IGNORE THIS CLASS.
 * <p>
 * This class exists to assist in the auto-grading framework that we have developed.
 * Knowledge of this class and how it works will not be required in this course at all.
 */
public class AutoGrader {

    @Test
    public void mainTest(){
        try {
            AndroidHandinUtil.generateHandinPackage("Asgn2", new File("./build/results.txt"),
                    GateUnitTests.class);
        }catch(Exception e){
            Log.d("AutoGrader :", e.getMessage());
        }

    }
}
