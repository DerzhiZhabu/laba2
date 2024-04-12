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
	call [scanf] ;потоковый ввод количества цифр
	mov eax, [number] ; помещаем врегистр eax значение из number
	jnz take_new_number
	
	take_new_number:
		push new_number
		push new_take
		call [scanf] ;потоковый ввод числа
		geting_number:
			mov eax, [new_number] ; помещаем в eax разбираемое число
			xor edx, edx
			mov ecx, 10
			div ecx ; делим eax на 10 остаток лежит в edx - это последняя цифра числа, в eax - частное(остальные цифры)
			push eax; засовываем в стек значение eax, потому что оно нам сейчас не нужно
			mov eax, edx
			mov [additional], eax
			mov ebx, eax ; резервируем цифру в ebx
			mov ecx, 3
			xor edx, edx ; очищаем регистр edx
			div ecx ; нажодим остаток от деления на 3
			mov ecx, eax
			mov eax, edx
			mov [additional], eax
			cmp eax, 0; проверяем есть ли остаток от деления на 3
			jnz more ; если остаток не ноль переходим к метке more
				add ebx, [counter]; если остаток ноль добавляем цифру из ebx в переменную-счётчик
				mov [counter], ebx
			more:
				pop eax ; вытаскиваем из стека цифры, которые мы еще не обработали
				mov [new_number], eax
				mov eax, [new_number]
				cmp eax, 0; если цифр не осталось идем дальше
				jnz geting_number; если цифры еще есть возвращаемся к метке geting_number и повторяем процесс с начала
			
		mov ecx, [number] 
		sub ecx, 1 ; меняем число цифр, которые будут введены
		mov [number], ecx 
		mov [additional], ecx
		mov eax, [additional]
		cmp eax, 0 ; если больше цифр вводится не будет, то переходим к завершению
		jnz take_new_number; если цифры еще будут вводиться, то возвращаемся к метке take_new_number и повторяем все с начала
		

listening:
	mov eax, [counter]
	push eax
	push print_temp
	call [printf]; выводим в потоковый вывод счётчик
	
	call [getch]
	
	invoke ExitProcess, 0  ;завершаем программу

checked_div3:
	add ecx, [counter]
	mov [counter], ecx
	jp more
	

section '.idata' data import readable ; секция импорта библиотек и функций
        library kernel, 'kernel32.dll',\
                msvcrt, 'msvcrt.dll'
  
	import kernel,\
  				ExitProcess, 'ExitProcess'
          
	import msvcrt,\
  				printf, 'printf',\
  				scanf,'scanf',\
          getch, '_getch'
