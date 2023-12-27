.global selection_sort
.text

selection_sort:
  # Push callee-saved registers onto stack so they can be used
  pushq   %r12
  pushq   %r13
  pushq   %r14
  pushq   %r15
  pushq   %rbx

  # Move array address into rax
  movq    %rdi, %rax

  xorq    %r8, %r8
  xorq    %r9, %r9

# Track end of sorted sublist with rsi (length) checker
sorted_sublist:
  cmpq    %r8, %rsi # for(int i=0; i<length; i++)
  jl      done

  imulq   $4, %r8, %r13
  addq    %r13, %rax
  movl    (%rax), %r10d  # currMin = array[i]
  subq    %r13, %rax
  
  movq    %r8, %r11  # minIdx = i
  movq    %r8, %r9   # j = i
  
# Traverse unsorted sublist to find next minimum val index
find_unsorted_min:
  cmpq    %r9, %rsi  # for(int j=i; j<length, j++)
  jle     swap_index

  imulq   $4, %r9, %r13
  addq    %r13, %rax
  movl    (%rax), %r14d  # array[j] = %r14
  subq    %r13, %rax

  # if(array[j] < currMin), then update currMin and minIdx
  cmpq    %r10, %r14
  jge     increase
  movq    %r14, %r10   # currMin = array[j] -> %r14
  movq    %r9, %r11    # minIdx = j -> %r11
  jmp     increase

increase:
  incq    %r9
  jmp     find_unsorted_min
  
# Swap minimum with beginning of unsorted
swap_index:
  # tmp = array[i]
  imulq   $4, %r8, %r13
  addq    %r13, %rax
  movl    (%rax), %ebx
  movl    %ebx, %r15d
  subq    %r13, %rax

  # %ebx = array[minIdx]
  imulq   $4, %r11, %r13
  addq    %r13, %rax   
  movl    (%rax), %ebx  
  subq    %r13, %rax
  # array[i] = array[minIdx]
  imulq   $4, %r8, %r13
  addq    %r13, %rax
  movl    %ebx, (%rax)  
  subq    %r13, %rax

  # array[minIdx] = tmp
  imulq   $4, %r11, %r13
  addq    %r13, %rax   
  movl    %r15d, (%rax)
  subq    %r13, %rax
  incq    %r8
  jmp     sorted_sublist

# Return the modified array and pop stack values
done:
  popq   %rbx
  popq   %r15
  popq   %r14
  popq   %r13
  popq   %r12
  retq
  