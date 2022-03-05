import 'dart:io';

bool ganjilGenap(int angka) {
  if (angka % 2 == 0) {
    return true;
  } else {
    return false;
  }
}

void main() {
  stdout.write("Masukkan Angka : ");
  int? angka = int.parse(stdin.readLineSync()!);

  print(ganjilGenap(angka));
}
