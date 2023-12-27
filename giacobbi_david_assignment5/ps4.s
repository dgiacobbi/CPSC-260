.global _start
.text

_start:
    movw    $17, %ax    # put value into ax
    addw    $-17, %ax   # ax = -17 + ax
    movw    $23, %bx    # put value into bx
    subw    $23, %bx    # bx = bx - 23
    # exit program
    movq    $60, %rax   # sys call 60 is exit
    xor     %rdi, %rdi  # return 0
    syscall