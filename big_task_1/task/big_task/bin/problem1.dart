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
