.global _start
.text

_start:
    movb    $53, %al    # put value into low ax byte
    movb    $37, %bh    # put value into high bh byte
    # exit program
    movq    $60, %rax   # sys call 60 is exit
    xor     %rdi, %rdi  # return 0
    syscall