.global _start
.text

_start:
    movw    $65535, %ax3    # put value into ax
    addw    $2, %ax         # ax = 2 + ax
    movw    %ax, %bx        # move ax value to bx
    addw    $-2, %bx        # bx = bx - 2
    # exit program
    movq    $60, %rax       # sys call 60 is exit
    xor     %rdi, %rdi      # return 0
    syscall
