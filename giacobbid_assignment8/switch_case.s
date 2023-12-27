.global _start
.text

_start:
  # Move mystr address literal into %rax
  movq    $mystr, %r9
  movq    $mylen, %r10
  callq   switch_case

# Traverse string and check for switching cases each iteration
next_char:
  incq    %rcx
  cmpq    %rcx, %r10
  jl      done
  addq    $1, %r9 
  callq   switch_case
  jmp     next_char

# Check if current character meets requirements to be upper/lower case
switch_case:
  movb    (%r9), %bl
  movb    $65, %r8b
  cmpb    %bl, %r8b
  jle     check_upper
  jmp     exit

  # If pass first test, check if character falls in upper case bound
  check_upper:
  movb    $90, %r8b
  cmpb    %bl, %r8b
  jl      check_lower
  callq   to_lower_case
  jmp     exit

  # If fails upper check, determine if character in lower case bound
  check_lower:
  movb    $97, %r8b
  cmpb    %bl, %r8b
  jg      next_char
  movb    $122, %r8b
  cmpb    %bl, %r8b
  jl      exit
  callq   to_upper_case
  jmp     exit

  # Exit function, parameters not met or switch complete
  exit:
  retq

# All characters have been checked
done:
  # Write altered mystr (1, mystr, strlen)
  movq    $1, %rax
  movq    $1, %rdi
  movq    $mystr, %rsi
  movq    $mylen, %rdx
  syscall

  # Exit Program
  movq    $60, %rax
  xorq    %rdi, %rdi
  syscall

# Upper case function
to_upper_case:
  subb    $32, %bl      # make current character uppercase
  movb    %bl, (%r9)   # store result as pointer
  retq

# Lower case function
to_lower_case:
  addb    $32, %bl      # make current character lowercase
  movb    %bl, (%r9)   # store result as pointer
  retq

        .data
mystr:  .ascii "FOO_bar!\n"
        .equ mylen, (. - mystr)
