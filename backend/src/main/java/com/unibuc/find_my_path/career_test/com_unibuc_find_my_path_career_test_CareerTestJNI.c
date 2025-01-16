#ifndef JNI_INCLUDED
#include <jni.h>
#define JNI_INCLUDED
#endif

#include "com_unibuc_find_my_path_career_test_CareerTestJNI.h"

JNIEXPORT void JNICALL Java_com_unibuc_find_1my_1path_career_1test_CareerTestJNI_loadCareerTestResults
  (JNIEnv *, jobject) {
   printf("Career Test Results\n");
}