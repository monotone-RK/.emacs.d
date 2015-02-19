#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define NUM 100
#define MIN 0
#define MAX NUM - 1
#define DADDR 10 //ADDR <= NUM
#define HADDR 2*DADDR //ADDR <= NUM
#define TRUE 1
#define FALSE 0

int GetRandom(int min,int max) {
  return min + (int)(rand()*(max-min+1.0)/(1.0+RAND_MAX));
}

int main(int argc, char *argv[]) {
  
  if (argc == 1) {
    printf("usage: ./liner value\n");
    return 1;
  } else if (argc != 2) {
    printf("error! The number of argument is wrong.\n");
    return 1;
  }
  
  int init_data[NUM];
  int arrayD[DADDR] = {0};
  int arrayH[HADDR] = {0};
  /**********************************************************************/ //Initialize
  srand((unsigned int)time(NULL));

  for (int i = 0; i < NUM; i++) {   
    init_data[i] = i + 1; /* 1 - 100 */  
  }
  
  for (int i = 0; i < DADDR; i++) {
    int random_addr = GetRandom(MIN, MAX);
    if (init_data[random_addr] != 0) {
      arrayD[i] = init_data[random_addr];
      init_data[random_addr] = 0;
    } else {
      i--;
    }
  }
  /**********************************************************************/
  
  /**********************************************************************/ //store value
  for (int i = 0; i < DADDR; i++) {
    int hash = arrayD[i] % (HADDR);
    int flag;
    do {
      if (arrayH[hash] == 0) {
        arrayH[hash] = arrayD[i];
        flag = FALSE;
      } else {
        hash = (hash + 1) % (HADDR);
        flag = TRUE;
      }
    } while(flag);
  }
  /**********************************************************************/
  
  for (int i = 0; i < DADDR; i++) {
    printf("arrayD[%d] : %d\n", i, arrayD[i]);
  }
  printf("\n");
  for (int i = 0; i < HADDR; i++) {
    printf("arrayH[%d] : %d\n", i, arrayH[i]);
  }
  printf("\n");
  
  /**********************************************************************/ //search
  int find = atoi(argv[1]);
  int hash = find % (HADDR);

  while (arrayH[hash] != 0) {
    if (arrayH[hash] == find) {
      printf("found what you are looking for!\n");
      printf("arrayH[%d] : %d\n", hash, arrayH[hash]);
      return 0;
    } else {
      hash = (hash + 1) % (HADDR);
    }
  }
  printf("404 not found\n");
  printf("value: %d\n", find);
  return 0;
}
/**********************************************************************/ 
