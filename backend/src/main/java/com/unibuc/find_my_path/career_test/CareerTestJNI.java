package com.unibuc.find_my_path.career_test;

public class CareerTestJNI {
    static {
        System.loadLibrary("career_test");
    }

    private native void loadCareerTestResults();

    public void executeCareerTest(String[] args) {
        new CareerTestJNI().loadCareerTestResults();
    }
}
