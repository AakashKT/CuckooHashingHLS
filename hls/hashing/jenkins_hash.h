#ifndef JENKINS_HASH_
#define JENKINS_HASH_

#include<stdio.h>
#include<math.h>
#include<stdint.h>

uint32_t jenkins_one_at_a_time(int length, const char key[1000]);

#endif
