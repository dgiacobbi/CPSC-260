.global _start
.text

_start:
    # Print unalphabetized string
    movq    $1, %rax
    movq    $1, %rdi
    movq    $mystr, %rsi
    movq    $mylen, %rdx
    syscall

    # Clear the %rcx register
    movq    $0, %rcx
    
    # Set character length register
    movq    $mylen, %r10
    subq    $2, %r10

outer:
    # Get the next character
    movq    $mystr, %rax

    # Check if every character has been sorted
    incq    %rcx
    cmpq    %rcx, %r10
    js      done

    # Clear loop counter for inner loop
    movq    $0, %r8
    
inner:
    # Check if every character has been compared to current
    incq    %r8
    cmpq    %r8, %r10
    js      outer

    # Create a second pointer to compare literals
    movq    %rax, %r9
    incq    %r9

    # Compare literals of current pointers
    movb    (%rax), %bl
    movb    (%r9), %dl
    cmpb    %bl, %dl
    jns     increment

    # If left > right, swap literals
    movb    %dl, (%rax)
    incq    %rax
    movb    %bl, (%rax)
    decq    %rax
    jmp     increment

increment:
    # Move to the next index
    incq    %rax
    jmp     inner
    
done:
    # Print alphabetized string
    movq    $1, %rax
    movq    $1, %rdi
    movq    $mystr, %rsi
    movq    $mylen, %rdx
    syscall

    # Exit program
    movq    $60, %rax
    xor     %rdi, %rdi
    syscall

       .data
mystr: .ascii "GONZAGABULLDOGS\n"
       .equ mylen, (. - mystr)


















       