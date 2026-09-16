;|===========NO=AI===============|
;|	BY ASTRONOMIA:2k26	 |	
;|===============================|

section .data
req: dd 0xa,0xa,0x9,"tenta ai fi",0xa,0x9
req_sz: equ $-req
warn: dd 0xa,0xa,0x9,"ó teu inject kkkkkkkk",0xa,0xa,">>"
warn_sz: equ $-warn
sf: dd 0xa,0xa,0x9,"ta safe (q cara bom) XD",0xa,0xa
sf_sz: equ $-sf

section .bss
inp resb 9
lixo resb 16


section .text


testing: 
	cmp byte [rel inp+8], 0xa
	jne gotcha

safe:
	mov rax, 1
	mov rdi, 1
	mov rsi, sf
	mov rdx, sf_sz
	syscall
	mov rax, 1
	mov rdi, 1
	lea rsi, inp
	mov rdx, 9
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, 0xa
	mov rdx, 1
	syscall
	jmp exit

global _start
_start:
	mov byte [rel lixo], -1
	mov rax, 1
	mov rdi, 1
	mov rsi, req
	mov rdx, req_sz
	syscall	
	mov rax, 0
	mov rdi, 0
	lea rsi, inp
	mov rdx, 9
	syscall
	cmp rax, 8
	jle safe 
	jg testing
gotcha:
	mov rax, 0
	mov rdi, 1
	lea rsi, lixo
	mov rdx, 16
	syscall
	cmp rax, 15
	jge gotcha
	mov rax, 1
	mov rdi, 1
	mov rsi, warn
	mov rdx, warn_sz
	syscall	
	mov rax, 1
	mov rdi, 1
	lea rsi, lixo-1
	mov rdx, 16
	syscall	
	mov rax, 1
	mov rdi, 1
	mov rsi, 0xa
	mov rdx, 1
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, 0xa
	mov rdx, 1
	syscall
exit:
	mov rax, 60
	mov rdi, 1
	syscall
