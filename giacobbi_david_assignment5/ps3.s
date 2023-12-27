.global _start
.text

_start:
    movb    $0x01, %al	   # put value into low ax byte
    movw    $65535, %ax	   # put value into ax

    movq    $60, %rax
    xor     %rdi, %rdi
    syscall