#include <stdio.h>

void selection_sort(int array[], int length);
void c_sort(int array[], int length);

int main(){

  // Test arrays for both programs
  int array1[] = {2, 5, 7, 2, 4, 5, 9, 1};
  int array2[] = {1, 3, 9, 2, 4};
  int array3[] = {8, 4, 1, 3, 9, 3, 5, 6, 0, 2};

  printf("C Program Sort:\n");
  c_sort(array1, 8);
  c_sort(array2, 5);
  c_sort(array3, 10);

  printf("\nAssembly Sort:\n");
  // ARRAY 1 Assembly Sort
  selection_sort(array1, 8);
  for (int i = 0; i < 8; i++){
    printf("%d ", array1[i]);
  }
  printf("\n");

  // ARRAY 2 Assembly Sort
  selection_sort(array2, 5);
  for (int i = 0; i < 5; i++){
    printf("%d ", array2[i]);
  }
  printf("\n");

  // ARRAY 3 Assembly Sort
  selection_sort(array3, 10);
  for (int i = 0; i < 10; i++){
    printf("%d ", array3[i]);
  }
  printf("\n");
  
  return 0;
}


// C-Program Function for Selection Sort (Question 4)
void c_sort(int array[], int length){
  
  // Track end index of sorted sublist
  for (int i = 0; i < length; i++){
    // Traverse unsorted sublist to find next minimum val index
    int currMin = array[i];
    int minIdx = i;
    for (int j = i; j < length; j++){
      if (array[j] < currMin){
        currMin = array[j];
        minIdx = j;
      }
    }
    // Swap minimum with beginning of unsorted
    int temp = array[i];
    array[i] = array[minIdx];
    array[minIdx] = temp;
  } 
  // Print out the new array
  for (int k = 0; k < length; k++)
    printf("%d ", array[k]);
  printf("\n");
}
