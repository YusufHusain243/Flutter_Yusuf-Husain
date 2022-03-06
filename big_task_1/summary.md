# Big_Task_1

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Task

1. Problem 1 - Ganjil atau Genap
   - Buatlah sebuah fungsi yang:
     - menerima sebuah angka
     - me-return true jika masukan genap
     - me-return false jika masukan ganjil
2. Problem 2 - Azimuth/Back-Azimuth
   - Buatlah sebuah fungsi yang:
     - menerima sebuah angka
     - jika masukan lebih dari 180 maka return masukan - 180
     - jika kurang dari 180 maka return masukan + 180
     - jika return kurang dari atau sama dengan 0 maka return 0
     - jika return lebih dari atau sama dengan 360 maka return 0
3. Problem 3 - Jam Pasir
   - Buatlah sebuah fungsi yang dapat:
     - menerima sebuah angka
     - menampilkan jam pasir sesuai dengan masukan
4. Problem 4 - Diagonal Angka
   - Buatlah sebuah fungsi yang dapat:
     - menerima sebuah angka
     - menampilkan angka secara diagonal

## Jawaban

1. berikut adalah program dan output untuk soal pertama

   - program

   ```dart
       import 'dart:io';

   //membuat fungsi dengan tipe balikan bool
   //fungsi ini memiliki parameter angka dengan tipe integer
   bool ganjilGenap(int angka) {
   //jika sisa bagi parameter dibagi 2 sama dengan 0
   if (angka % 2 == 0) {
       //maka kembalikan true
       return true;
       //jika tidak
   } else {
       //kembalikan false
       return false;
   }
   }

   //fungsi utama
   void main() {
   //cetak masukkan angka sebagai perintah
   stdout.write("Masukkan Angka : ");
   //membuat variabel integer dengan nama angka value optional
   //variabel ini diinput oleh user
   int? angka = int.parse(stdin.readLineSync()!);

   //memanggil fungsi ganjilGenap dengan parameter angka yang diinput user
   print(ganjilGenap(angka));
   }

   ```

   - output

2. berikut adalah program dan output untuk soal kedua

   - program

   ```dart
       import 'dart:io';

   //membuat fungsi dengan tipe integer dan memiliki parameter integer angka
   int azimuth(int angka) {
   //membuat variabel temp sebagai penampung;
   int? temp;
   //jika angka lebih dari 180
   if (angka > 180) {
       //maka angka dikurangi 180 dan dimasukkan ke temp
       temp = angka - 180;
       //jika temp <=0 atau temp >= 360
       if (temp <= 0 || temp >= 360) {
       //maka kembalikan 0
       return 0;
       //jika tidak
       } else {
       //kembalikan temp
       return temp;
       }
       //jika angka kurang dari 180
   } else if (angka < 180) {
       //maka angka ditambah 180 dan dimasukkan ke temp
       temp = angka + 180;
       //jika temp <= 0 atau >= 360
       if (temp <= 0 || temp >= 360) {
       //maka kembalikan 0
       return 0;
       //jika tidak
       } else {
       //maka kembalikan temp
       return temp;
       }
       //jika tidak
   } else {
       //maka kembalikan 0
       return 0;
   }
   }

   //fungsi utama
   void main() {
   //cetak masukkan angka sebagai perintah
   stdout.write("Masukkan Angka : ");
   //membuat variabel dengan tipe integer dan value optional
   //variabel angka ini diinput kan oleh user
   int? angka = int.parse(stdin.readLineSync()!);

   //cetak fungsi dengan parameter angka yang diinput
   print(azimuth(angka));
   }

   ```

   - output

3. berikut adalah program dan output untuk soal ketiga

   - program

   ```dart
       import 'dart:io';

   //membuat fungsi dengan tipe parameter integer
   void jamPasir(int angka) {
   //inisialisasi variabel i,j,k
   var i, j, k;
   //cetak parameter yang diinput
   print("Input = $angka");
   //membuat looping mulai dari 0 sampai angka parameter
   //kecil -> besar
   for (i = 0; i < angka; i++) {
       //membuat looping mulai dari 0 sampai index i dari setiap perulangan i
       for (j = 0; j < i; j++) {
       //cetak space sebanyak perulangan yang ada
       stdout.write(" ");
       }

       //membuat looping dimana nilai awal adalah nilai index i dan batas max adalah angka
       //misalnya sedang pada index ke 2 dan angka max 5
       for (k = i; k < angka; k++) {
       //maka cetak 3 bintang + space
       stdout.write("*" + " ");
       }
       //enter setiap perulangan
       stdout.writeln("");
   }

   //membuat looping mulai dari angka parameter ke 0
   //besar -> kecil
   for (i = angka - 1; i >= 0; i--) {
       //membuat looping mulai dari 0 sampai index i dari setiap perulangan i
       for (j = 0; j < i; j++) {
       //cetak space sebanyak perulangan yang ada
       stdout.write(" ");
       }

       //membuat looping dimana nilai awal adalah nilai index i dan batas max adalah angka
       //misalnya sedang pada index ke 2 dan angka max 5
       for (k = i; k < angka; k++) {
       //maka cetak 3 bintang + space
       stdout.write("*" + " ");
       }
       //setiap perulangan i, enter
       stdout.writeln("");
   }
   }

   //fungsi utama
   void main() {
   //membuat perintah input angka
   stdout.write("Masukkan Angka : ");
   //membuat variabel integer dengan nama angka dan value optional
   //variabel ini merupakan inputan user
   int? angka = int.parse(stdin.readLineSync()!);
   //panggil fungsi dengan prameter angka yang diinput
   jamPasir(angka);
   }

   ```

   - output

4. berikut adalah program dan output untuk soal keempat

   - program

   ```dart
       import 'dart:io';

   //membuat fungsi dengan parameter integer angka
   void diagonal(int angka) {
   //cetak angka yang diinput
   print("Input : $angka");
   //inisialisasi variabel i,j,k
   var i, j, k;
   //membuat looping mulai dari 1 sampai angka parameter
   for (i = 1; i <= angka; i++) {
       //di setiap perulangan i, maka dibuat perulangan j mulai dari 1 sampai angka parameter
       for (j = 1; j <= angka; j++) {
       //ketika di perulangan i, dan dilakukan perulangan j,
       //jika ada index yang sama
       if (i == j) {
           //maka cetak angka yang sama tersebut
           stdout.write("$i");
           //jika tidak
       } else {
           //maka cetak space
           stdout.write(" ");
       }
       }
       //syntak enter
       stdout.writeln("");
   }
   }

   //fungsi utama
   void main() {
   //membuat perintah input angka
   stdout.write("Masukkan Angka : ");
   //membuat variabel integer dengan nama angka dan value optional
   //variabel ini merupakan inputan user
   int? angka = int.parse(stdin.readLineSync()!);

   //panggil fungsi dengan prameter angka yang diinput
   diagonal(angka);
   }

   ```

   - output
