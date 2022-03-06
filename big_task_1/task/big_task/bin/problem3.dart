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
