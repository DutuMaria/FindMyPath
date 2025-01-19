package com.unibuc.find_my_path.utils;

import com.unibuc.find_my_path.career_test.CareerTestJNI;
import com.unibuc.find_my_path.model.HardSkill;
import com.unibuc.find_my_path.model.Interest;
import com.unibuc.find_my_path.model.SoftSkill;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Utils {

    public static ArrayList<ArrayList<String>> processSkillLists(
            List<HardSkill> hardSkills,
            List<SoftSkill> softSkills,
            List<Interest> interests
    ) {
        ArrayList<ArrayList<String>> skillSet = new ArrayList<>();
        skillSet.add(hardSkills.stream()
                .map(HardSkill::getHardSkillName)
                .collect(Collectors.toCollection(ArrayList::new)));
        skillSet.add(softSkills.stream()
                .map(SoftSkill::getSoftSkillName)
                .collect(Collectors.toCollection(ArrayList::new)));
        skillSet.add(interests.stream()
                .map(Interest::getInterestName)
                .collect(Collectors.toCollection(ArrayList::new)));
        return skillSet;
    }

    public static ArrayList<Long> executeCareerTest(
            ArrayList<ArrayList<ArrayList<String>>> answersSkillSet,
            ArrayList<ArrayList<ArrayList<String>>> careerSkillSet,
            ArrayList<Long> careerIds,
            ArrayList<String> hardSkills,
            ArrayList<String> softSkills,
            ArrayList<String> interests
    ) {
        return new CareerTestJNI().executeCareerTest(
                answersSkillSet, careerSkillSet, careerIds, hardSkills, softSkills, interests);
    }
}
