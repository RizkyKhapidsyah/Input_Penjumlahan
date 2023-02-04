section .data
num1 db 'Masukkan angka pertama: ', 0
num1Len equ $ - num1
num2 db 'Masukkan angka kedua: ', 0
num2Len equ $ - num2
result db 'Hasil penambahan: ', 0
resultLen equ $ - result

section .bss
angka1 resb 2
angka2 resb 2
hasil resb 2

section .text
   global _start

_start:
   ;Menampilkan pesan "Masukkan angka pertama"
   mov eax, 4
   mov ebx, 1
   mov ecx, num1
   mov edx, num1Len
   int 0x80

   ;Membaca angka pertama
   mov eax, 3
   mov ebx, 0
   mov ecx, angka1
   mov edx, 2
   int 0x80

   ;Menampilkan pesan "Masukkan angka kedua"
   mov eax, 4
   mov ebx, 1
   mov ecx, num2
   mov edx, num2Len
   int 0x80

   ;Membaca angka kedua
   mov eax, 3
   mov ebx, 0
   mov ecx, angka2
   mov edx, 2
   int 0x80

   ;Menambahkan angka pertama dan angka kedua
   mov al, [angka1]
   mov bl, [angka2]
   add al, bl
   mov [hasil], al

   ;Menampilkan hasil penambahan
   mov eax, 4
   mov ebx, 1
   mov ecx, result
   mov edx, resultLen
   int 0x80

   ;Menampilkan hasil
   mov eax, 4
   mov ebx, 1
   mov ecx, hasil
   mov edx, 2
   int 0x80

   ;Mengakhiri program
   mov eax, 1
   xor ebx, ebx
   int 0x80