#ifndef JNI_INCLUDED
#include <jni.h>
#define JNI_INCLUDED
#endif

#include "com_unibuc_find_my_path_career_test_CareerTestJNI.h"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SKILL_NUMBER 3
#define CAREER_RESULTS_SIZE 5

typedef struct {
    float* hardSkills;
    float* softSkills;
    float* interests;
} SkillSet;

typedef struct {
    int careerId;
    float compatibility;
} CareerPair;

// -------- Utils START --------

void printSkillSet(const SkillSet* skillSet, const int skillSetSize, const int hardSkillsSize, const int softSkillsSize, const int interestsSize) {
    for (int t = 0; t < skillSetSize; t++) {
        printf("Hard Skills: ");
        for (int i = 0; i < hardSkillsSize; i++) {
            printf("%.2f ", skillSet[t].hardSkills[i]);
        }
        printf("\n");

        printf("Soft Skills: ");
        for (int i = 0; i < softSkillsSize; i++) {
            printf("%.2f ", skillSet[t].softSkills[i]);
        }
        printf("\n");

        printf("Interests: ");
        for (int i = 0; i < interestsSize; i++) {
            printf("%.2f ", skillSet[t].interests[i]);
        }
        printf("\n");
    }
}

void printCStringArray(const char** array, const int size, const char* label) {
    printf("%s:\n", label);
    for (int i = 0; i < size; i++) {
        printf("  [%d]: %s\n", i, array[i]);
    }
    printf("\n");
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

// -------- Utils END --------


// -------- Calculate Normalized Results START --------

void updateSumSkillSet(const int skillListSize, const float* answersSkillList, float* sumSkillList, float* skillMax) {
    if (sumSkillList == NULL || answersSkillList == NULL) {
        printf("MAI AJUNG AICI??\n");
        return;
    }

    for (int j = 0; j < skillListSize; j++) {
        if (answersSkillList[j]) {
            sumSkillList[j] += answersSkillList[j];
            if (*skillMax < sumSkillList[j]) *skillMax = sumSkillList[j];
        }
    }
}

void normalizeSkillList(float* skillList, const int skillListSize, const float skillMax) {
    if (!skillList) return;

    for (int j = 0; j < skillListSize; j++) {
        skillList[j] /= skillMax;
    }
}

SkillSet* obtainResultSkillSet(const SkillSet* answersSkillSet, const int size,
                              const int hardSkillsSize, const int softSkillsSize, const int interestsSize) {
    SkillSet* sumSkillSet = (SkillSet*) malloc(sizeof(SkillSet));
    sumSkillSet->hardSkills = (float*) calloc(hardSkillsSize, sizeof(float));
    sumSkillSet->softSkills = (float*) calloc(softSkillsSize, sizeof(float));
    sumSkillSet->interests = (float*) calloc(interestsSize, sizeof(float));

    float hardSkillsMax = 0.0f, softSkillsMax = 0.0f, interestsMax = 0.0f;

    for (int i = 0; i < size; i++) {
        updateSumSkillSet(hardSkillsSize, answersSkillSet[i].hardSkills,
            sumSkillSet->hardSkills, &hardSkillsMax);
        updateSumSkillSet(softSkillsSize, answersSkillSet[i].softSkills,
            sumSkillSet->softSkills, &softSkillsMax);
        updateSumSkillSet(interestsSize, answersSkillSet[i].interests,
            sumSkillSet->interests, &interestsMax);
    }

    normalizeSkillList(sumSkillSet->hardSkills, hardSkillsSize, hardSkillsMax);
    normalizeSkillList(sumSkillSet->softSkills, softSkillsSize, softSkillsMax);
    normalizeSkillList(sumSkillSet->interests, interestsSize, interestsMax);

    return sumSkillSet;
}

// -------- Calculate Normalized Results END --------


// -------- Calculate Career Compatibility (Cosine Similarity) START --------
float calculateDotProduct(const float* vector1, const float* vector2, const int size) {
    float result = 0.0f;
    for (int i = 0; i < size; i++) {
        result += vector1[i] * vector2[i];
    }
    return result;
}

float calculateNorm(const float* vector, const int size) {
    float result = 0.0f;
    for (int i = 0; i < size; i++) {
        result += vector[i] * vector[i];
    }
    return sqrtf(result);
}

float calculateSkillCompatibility(const float* resultSkill, const float* careerSkill, const int size) {
    if (size == 0) return 0.0f;

    const float dotProduct = calculateDotProduct(resultSkill, careerSkill, size);
    const float normResultSkillVector = calculateNorm(resultSkill, size);
    const float normCareerSkillVector = calculateNorm(careerSkill, size);

    return dotProduct / (normResultSkillVector * normCareerSkillVector);
}

float* calculateCareersCompatibility(const SkillSet* resultSkillSet,
    const SkillSet* careersSkillSet, const int careersSkillSetSize,
    const int hardSkillsSize, const int softSkillsSize, const int interestsSize) {
    float* careersCompatibility = (float*) malloc(careersSkillSetSize * sizeof(float));
    for (int i = 0; i < careersSkillSetSize; i++) {
        const float hardSkillsCompatibility = calculateSkillCompatibility(
            resultSkillSet->hardSkills,
            careersSkillSet[i].hardSkills,
            hardSkillsSize);

        const float softSkillsCompatibility = calculateSkillCompatibility(
            resultSkillSet->softSkills,
            careersSkillSet[i].softSkills,
            softSkillsSize);

        const float interestsCompatibility = calculateSkillCompatibility(
            resultSkillSet->interests,
            careersSkillSet[i].interests,
            interestsSize);

        careersCompatibility[i] =
            (hardSkillsCompatibility + softSkillsCompatibility + interestsCompatibility) / SKILL_NUMBER;
    }

    return careersCompatibility;
}

// -------- Calculate Career Compatibility (Cosine Similarity) END --------


// -------- Get All Compatible Career Ids Sorted START --------

int comparePairs(const void* a, const void* b) {
    const float compatibilityA = ((CareerPair*)a)->compatibility;
    const float compatibilityB = ((CareerPair*)b)->compatibility;
    if (compatibilityA < compatibilityB) return 1;
    if (compatibilityA > compatibilityB) return -1;
    return 0;
}

int* getSortedCareerIds(const int* careerIds, const float* careerCompatibility, const int size) {
    CareerPair* pairs = (CareerPair*) malloc(size * sizeof(CareerPair));
    for (int i = 0; i < size; i++) {
        pairs[i].careerId = careerIds[i];
        pairs[i].compatibility = careerCompatibility[i];
    }

    qsort(pairs, size, sizeof(CareerPair), comparePairs);

    int* sortedCareerIds = (int*) malloc(size * sizeof(int));
    for (int i = 0; i < size; i++) {
        sortedCareerIds[i] = pairs[i].careerId;
    }

    free(pairs);

    return sortedCareerIds;
}

// -------- Get All Compatible Career Ids Sorted START --------


// -------- Map Java Objects To C Objects START --------

int indexOfSkillInSkillList(const char* skillName, const char** skillList, const int skillListSize) {
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
    for (int i = 0; i < arrayList3DSize; i++) {
        skillSet[i].hardSkills = (float*) calloc(hardSkillsSize, sizeof(float));
        skillSet[i].softSkills = (float*) calloc(softSkillsSize, sizeof(float));
        skillSet[i].interests = (float*) calloc(interestsSize, sizeof(float));
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
                    int index = indexOfSkillInSkillList(skillName, hardSkills, hardSkillsSize);
                    skillSet[i].hardSkills[index] = 1.0f;
                }
                if (j == 1) {
                    int index = indexOfSkillInSkillList(skillName, softSkills, softSkillsSize);
                    skillSet[i].softSkills[index] = 1.0f;
                }
                if (j == 2) {
                    int index = indexOfSkillInSkillList(skillName, interests, interestsSize);
                    skillSet[i].interests[index] = 1.0f;
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

void mapJavaObjectsToCObjects(JNIEnv *env, jobject jHardSkills, jobject jSoftSkills, jobject jInterests,
    jobject jAnswersSkillSet, jobject jCareersSkillSet, jobject jCareerIds,
    const char ***hardSkills, int *hardSkillsSize, const char ***softSkills, int *softSkillsSize, const char ***interests, int *interestsSize,
    SkillSet **answersSkillSet, int *answersSkillSetSize, SkillSet **careersSkillSet, int *careersSkillSetSize, int **careerIds, int *careerIdsSize) {

    *hardSkills = (const char**)mapJavaObjectToCStrings(env, jHardSkills, hardSkillsSize);
    *softSkills = (const char**)mapJavaObjectToCStrings(env, jSoftSkills, softSkillsSize);
    *interests = (const char**)mapJavaObjectToCStrings(env, jInterests, interestsSize);

    *answersSkillSet = mapJavaObjectsToCSkillSet(env, jAnswersSkillSet, answersSkillSetSize,
        *hardSkills, *hardSkillsSize, *softSkills, *softSkillsSize, *interests, *interestsSize);
    *careersSkillSet = mapJavaObjectsToCSkillSet(env, jCareersSkillSet, careersSkillSetSize,
        *hardSkills, *hardSkillsSize, *softSkills, *softSkillsSize, *interests, *interestsSize);

    *careerIds = mapJavaObjectsToCIntegers(env, jCareerIds, careerIdsSize);
}

// -------- Map Java Objects To C Objects END --------


// -------- Map Java Objects To C Objects START --------

jobject mapCLongArrayToJArrayList(JNIEnv* env, const long* results) {
    jclass jArrayListClass = (*env)->FindClass(env, "java/util/ArrayList");
    jmethodID jArrayListConstructor = (*env)->GetMethodID(env, jArrayListClass, "<init>", "()V");
    jobject jArrayList = (*env)->NewObject(env, jArrayListClass, jArrayListConstructor);
    jmethodID jArrayListAddMethod = (*env)->GetMethodID(env, jArrayListClass, "add", "(Ljava/lang/Object;)Z");

    for (int i = 0; i < CAREER_RESULTS_SIZE; i++) {
        jclass jLongClass = (*env)->FindClass(env, "java/lang/Long");
        jmethodID jLongConstructor = (*env)->GetMethodID(env, jLongClass, "<init>", "(J)V");
        jobject jLongObject = (*env)->NewObject(env, jLongClass, jLongConstructor, (jlong)results[i]);

        (*env)->CallBooleanMethod(env, jArrayList, jArrayListAddMethod, jLongObject);

        (*env)->DeleteLocalRef(env, jLongObject);
        (*env)->DeleteLocalRef(env, jLongClass);
    }

    return jArrayList;
}

// -------- Map Java Objects To C Objects END --------


int* processCareerTestResults(JNIEnv *env, jobject jAnswersSkillSet, jobject jCareersSkillSet,
    jobject jCareerIds, jobject jHardSkills, jobject jSoftSkills, jobject jInterests) {
    int hardSkillsSize, softSkillsSize, interestsSize, answersSkillSetSize, careersSkillSetSize, careerIdsSize;
    const char **hardSkills, **softSkills, **interests;
    SkillSet *answersSkillSet, *careersSkillSet;
    int *careerIds;

    mapJavaObjectsToCObjects(env,
        jHardSkills, jSoftSkills, jInterests,
        jAnswersSkillSet, jCareersSkillSet, jCareerIds,
        &hardSkills, &hardSkillsSize, &softSkills, &softSkillsSize, &interests, &interestsSize,
        &answersSkillSet, &answersSkillSetSize,
        &careersSkillSet, &careersSkillSetSize,
        &careerIds, &careerIdsSize
    );

    SkillSet* resultSkillSet = obtainResultSkillSet(answersSkillSet, answersSkillSetSize,
        hardSkillsSize, softSkillsSize, interestsSize);

    float* careersCompatibility = calculateCareersCompatibility((const SkillSet*) resultSkillSet,
        careersSkillSet, careersSkillSetSize, hardSkillsSize, softSkillsSize, interestsSize);

    int* sortedCareerIds = getSortedCareerIds(careerIds, careersCompatibility, careersSkillSetSize);

    free(hardSkills);
    free(softSkills);
    free(interests);
    free(careerIds);
    free(careersCompatibility);
    freeCSkillSet(resultSkillSet, 1);
    freeCSkillSet(answersSkillSet, answersSkillSetSize);
    freeCSkillSet(careersSkillSet, careersSkillSetSize);

    return sortedCareerIds;
}

JNIEXPORT jobject JNICALL Java_com_unibuc_find_1my_1path_career_1test_CareerTestJNI_processCareerTestResults
  (JNIEnv *env, jobject thisJObj,  jobject jAnswersSkillSet, jobject jCareerSkillSet, jobject jCareerIds,
      jobject jHardSkills, jobject jSoftSkills, jobject jInterests) {
    const long* careerTestResults = (long*) processCareerTestResults(env, jAnswersSkillSet, jCareerSkillSet,
        jCareerIds, jHardSkills, jSoftSkills, jInterests);

    return mapCLongArrayToJArrayList(env, careerTestResults);
}