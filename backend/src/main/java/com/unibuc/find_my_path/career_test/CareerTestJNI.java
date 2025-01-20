package com.unibuc.find_my_path.career_test;

import java.util.ArrayList;

public class CareerTestJNI {
    static {
        System.loadLibrary("career_test");
    }

    private native ArrayList<Long> processCareerTestResults(
        ArrayList<ArrayList<ArrayList<String>>> answersSkillSet,
        ArrayList<ArrayList<ArrayList<String>>> careerSkillSet,
        ArrayList<Long> careerIds,
        ArrayList<String> hardSkills,
        ArrayList<String> softSkills,
        ArrayList<String> interests
    );

    public ArrayList<Long> executeCareerTest(
        ArrayList<ArrayList<ArrayList<String>>> answersSkillSet,
        ArrayList<ArrayList<ArrayList<String>>> careerSkillSet,
        ArrayList<Long> careerIds,
        ArrayList<String> hardSkills,
        ArrayList<String> softSkills,
        ArrayList<String> interests
    ) {
        return new CareerTestJNI().processCareerTestResults(
                answersSkillSet, careerSkillSet, careerIds, hardSkills, softSkills, interests);
    }
}
