format PE Console ; говорим компилятору FASM какой файл делать

entry start ; говорим windows-у где из этой каши стартовать программу.

include 'includes\win32a.inc' ; подключаем библиотеку FASM-а
;можно и без нее но будет очень сложно.

section '.data' data readable writeable ; секция данных

	print_temp db 'Result %d',0
	hello db '%d',0
	new_take db ' %d',0
	number dd 0
	new_number dd 0
	additional dd 25
	subbing dd 1
	counter dd 0

section '.code' code readable writeable executable

start:
	push number
	push hello
	call [scanf]
	mov eax, [number]
	jnz take_new_number
	
	take_new_number:
		push new_number
		push new_take
		call [scanf]
		geting_number:
			mov eax, [new_number]
			xor edx, edx
			mov ecx, 10
			div ecx
			push eax
			mov eax, edx
			mov [additional], eax
			mov ebx, eax
			mov ecx, 3
			xor edx, edx
			div ecx
			mov ecx, eax
			mov eax, edx
			mov [additional], eax
			cmp eax, 0
			jnz more
				add ebx, [counter]
				mov [counter], ebx
			more:
				pop eax
				mov [new_number], eax
				mov eax, [new_number]
				cmp eax, 0
				jnz geting_number
			
		mov ecx, [number]
		sub ecx, 1
		mov [number], ecx
		mov [additional], ecx
		mov eax, [additional]
		cmp eax, 0
		jnz take_new_number
		

listening:
	mov eax, [counter]
	push eax
	push print_temp
	call [printf]
	
	call [getch]
	
	invoke ExitProcess, 0 

checked_div3:
	add ecx, [counter]
	mov [counter], ecx
	jp more
	

section '.idata' data import readable ; секция импорта
        library kernel, 'kernel32.dll',\
                msvcrt, 'msvcrt.dll'
  
	import kernel,\
  				ExitProcess, 'ExitProcess'
          
	import msvcrt,\
  				printf, 'printf',\
  				scanf,'scanf',\
          getch, '_getch'