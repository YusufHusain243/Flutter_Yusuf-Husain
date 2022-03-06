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
