#ifndef JNI_INCLUDED
#include <jni.h>
#define JNI_INCLUDED
#endif

#include "com_unibuc_find_my_path_career_test_CareerTestJNI.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int* hardSkills;
    int* softSkills;
    int* interests;
} SkillSet;

char** mapJavaObjectToCStrings(JNIEnv *env, jobject arrayList, int *size) {
    jclass arrayListClass = (*env)->GetObjectClass(env, arrayList);
    jmethodID arrayListSizeMethod = (*env)->GetMethodID(env, arrayListClass, "size", "()I");
    jmethodID getMethod  = (*env)->GetMethodID(env, arrayListClass, "get", "(I)Ljava/lang/Object;");
    jint arrayListSize = (*env)->CallIntMethod(env, arrayList, arrayListSizeMethod);
    *size = arrayListSize;

    char **cString = (char**)malloc(arrayListSize * sizeof(char*));

    for (jint i = 0; i < arrayListSize; i++) {
        jstring jString = (*env)->CallObjectMethod(env, arrayList, getMethod, i);
        const char *tempString = (*env)->GetStringUTFChars(env, jString, NULL);

        cString[i] = strdup(tempString);

        (*env)->ReleaseStringUTFChars(env, jString, tempString);
        (*env)->DeleteLocalRef(env, jString);
    }

    (*env)->DeleteLocalRef(env, arrayListClass);

    return cString;
}

void freeCStrings(char** cStrings, const int arraySize) {
    if (cStrings != NULL) {
        for (int i = 0; i < arraySize; i++) {
            if (cStrings[i] != NULL) {
                free(cStrings[i]);
            }
        }
        free(cStrings);
    }
}

void freeCSkillSet(SkillSet* skillSet, const int skillSetSize) {
    if (skillSet != NULL) {
        for (int i = 0; i < skillSetSize; i++) {
            free(skillSet[i].hardSkills);
            free(skillSet[i].softSkills);
            free(skillSet[i].interests);
        }
        free(skillSet);
    }
}

int isSkillInSkillList(const char* skillName, const char** skillList, const int skillListSize) {
    if (skillName == NULL || skillList == NULL || skillListSize < 1) {
        return -1;
    }
    for (int i = 0; i < skillListSize; i++) {
        if (skillList[i] != NULL && !strcmp(skillList[i], skillName)) {
            return i;
        }
    }
    return -1;
}

SkillSet* mapJavaObjectsToCSkillSet(JNIEnv *env, jobject arrayList3D, int *size,
    const char** hardSkills, const int hardSkillsSize,
    const char** softSkills, const int softSkillsSize,
    const char** interests, const int interestsSize) {

    jclass arrayList3DClass = (*env)->GetObjectClass(env, arrayList3D);
    jmethodID arrayList3DSizeMethod = (*env)->GetMethodID(env, arrayList3DClass, "size", "()I");
    jmethodID arrayList3DGetMethod  = (*env)->GetMethodID(env, arrayList3DClass, "get", "(I)Ljava/lang/Object;");
    jint arrayList3DSize = (*env)->CallIntMethod(env, arrayList3D, arrayList3DSizeMethod);
    *size = arrayList3DSize;

    SkillSet* skillSet = (SkillSet*) malloc(arrayList3DSize * sizeof(SkillSet));
    memset(skillSet, 0, arrayList3DSize * sizeof(SkillSet));

    for (int i = 0; i < arrayList3DSize; i++) {
        skillSet[i].hardSkills = (int*) malloc(hardSkillsSize * sizeof(int));
        memset(skillSet[i].hardSkills, 0, hardSkillsSize * sizeof(int));

        skillSet[i].softSkills = (int*) malloc(softSkillsSize * sizeof(int));
        memset(skillSet[i].softSkills, 0, softSkillsSize * sizeof(int));

        skillSet[i].interests = (int*) malloc(interestsSize * sizeof(int));
        memset(skillSet[i].interests, 0, interestsSize * sizeof(int));
    }


    for (jint i = 0; i < arrayList3DSize; i++) {
        jobject arrayList2D = (*env)->CallObjectMethod(env, arrayList3D, arrayList3DGetMethod, i);

        jclass arrayList2DClass = (*env)->GetObjectClass(env, arrayList2D);
        jmethodID arrayList2DSizeMethod = (*env)->GetMethodID(env, arrayList2DClass, "size", "()I");
        jmethodID arrayList2DGetMethod  = (*env)->GetMethodID(env, arrayList2DClass, "get", "(I)Ljava/lang/Object;");
        jint arrayList2DSize = (*env)->CallIntMethod(env, arrayList2D, arrayList2DSizeMethod);

        for (jint j = 0; j < arrayList2DSize; j++) {
            jobject arrayList = (*env)->CallObjectMethod(env, arrayList2D, arrayList2DGetMethod, j);
            jclass arrayListClass = (*env)->GetObjectClass(env, arrayList);
            jmethodID arrayListSizeMethod = (*env)->GetMethodID(env, arrayListClass, "size", "()I");
            jmethodID arrayListGetMethod = (*env)->GetMethodID(env, arrayList2DClass, "get", "(I)Ljava/lang/Object;");
            jint arrayListSize = (*env)->CallIntMethod(env, arrayList, arrayListSizeMethod);

            for (jint k = 0; k < arrayListSize; k++) {
                jstring jSkillName = (*env)->CallObjectMethod(env, arrayList, arrayListGetMethod, k);
                const char *skillName = (*env)->GetStringUTFChars(env, jSkillName, NULL);

                if (j == 0) {
                    int index = isSkillInSkillList(skillName, hardSkills, hardSkillsSize);
                    skillSet[i].hardSkills[index] = 1;
                }
                if (j == 1) {
                    int index = isSkillInSkillList(skillName, softSkills, softSkillsSize);
                    skillSet[i].softSkills[index] = 1;
                }
                if (j == 2) {
                    int index = isSkillInSkillList(skillName, interests, interestsSize);
                    skillSet[i].interests[index] = 1;
                }

                (*env)->ReleaseStringUTFChars(env, jSkillName, skillName);
                (*env)->DeleteLocalRef(env, jSkillName);
            }
            (*env)->DeleteLocalRef(env, arrayListClass);
            (*env)->DeleteLocalRef(env, arrayList);
        }
        (*env)->DeleteLocalRef(env, arrayList2D);
    }
    (*env)->DeleteLocalRef(env, arrayList3D);

    return skillSet;
}

int* mapJavaObjectsToCIntegers(JNIEnv *env, jobject arrayList, int *size) {
    jclass arrayListClass = (*env)->GetObjectClass(env, arrayList);
    jmethodID arrayListSizeMethod = (*env)->GetMethodID(env, arrayListClass, "size", "()I");
    jmethodID arrayListGetMethod = (*env)->GetMethodID(env, arrayListClass, "get", "(I)Ljava/lang/Object;");
    jint arrayListSize = (*env)->CallIntMethod(env, arrayList, arrayListSizeMethod);
    *size = arrayListSize;

    int* integerArray = (int*) malloc(arrayListSize * sizeof(int));
    if (integerArray == NULL) {
        (*env)->DeleteLocalRef(env, arrayListClass);
        return NULL;
    }

    jclass longClass = (*env)->FindClass(env, "java/lang/Long");
    jmethodID longValueMethod = (*env)->GetMethodID(env, longClass, "longValue", "()J");

    for (jint i = 0; i < arrayListSize; i++) {
        jobject longObject = (*env)->CallObjectMethod(env, arrayList, arrayListGetMethod, i);
        if (longObject != NULL) {
            jlong longValue = (*env)->CallLongMethod(env, longObject, longValueMethod);
            integerArray[i] = (int) longValue;
            (*env)->DeleteLocalRef(env, longObject);
        } else {
            integerArray[i] = 0;
        }
    }

    (*env)->DeleteLocalRef(env, arrayListClass);
    (*env)->DeleteLocalRef(env, longClass);

    return integerArray;
}

void mapJavaObjectsToCObjects(JNIEnv *env, jobject jAnswersSkillSet, jobject jCareersSkillSet,
    jobject jCareerIds, jobject jHardSkills, jobject jSoftSkills, jobject jInterests) {
    int hardSkillsSize, softSkillsSize, interestsSize, answersSkillSetSize, careersSkillSetSize, careerIdsSize;
    const char** hardSkills = (const char**)mapJavaObjectToCStrings(env, jHardSkills, &hardSkillsSize);
    const char** softSkills = (const char**)mapJavaObjectToCStrings(env, jSoftSkills, &softSkillsSize);
    const char** interests = (const char**)mapJavaObjectToCStrings(env, jInterests, &interestsSize);
    SkillSet* answersSkillSet = mapJavaObjectsToCSkillSet(env, jAnswersSkillSet, &answersSkillSetSize,
        hardSkills, hardSkillsSize, softSkills, softSkillsSize, interests, interestsSize);
    SkillSet* careersSkillSet = mapJavaObjectsToCSkillSet(env, jCareersSkillSet, &careersSkillSetSize,
        hardSkills, hardSkillsSize, softSkills, softSkillsSize, interests, interestsSize);
    int* careerIds = mapJavaObjectsToCIntegers(env, jCareerIds, &careerIdsSize);

}

JNIEXPORT jobject JNICALL Java_com_unibuc_find_1my_1path_career_1test_CareerTestJNI_processCareerTestResults
  (JNIEnv *env, jobject thisJObj,  jobject jAnswersSkillSet, jobject jCareerSkillSet, jobject jCareerIds,
      jobject jHardSkills, jobject jSoftSkills, jobject jInterests) {
    mapJavaObjectsToCObjects(env, jAnswersSkillSet, jCareerSkillSet,
        jCareerIds, jHardSkills, jSoftSkills, jInterests);

    return NULL;
}