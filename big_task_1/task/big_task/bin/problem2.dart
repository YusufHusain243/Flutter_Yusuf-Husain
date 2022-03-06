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
