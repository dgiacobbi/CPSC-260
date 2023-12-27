.global _start
.text

_start:
    movw    $65535, %ax    # put value into ax
    movb    $0x01, %al     # put value into low ax byte
    # exit program
    movq    $60, %rax      # sys call 60 is exit
    xor     %rdi, %rdi     # return 0
    syscall