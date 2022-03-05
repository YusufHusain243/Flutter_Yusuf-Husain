import 'dart:io';

int azimuth(int angka) {
  var temp;
  if (angka > 180) {
    temp = angka - 180;
    if (temp <= 0 || temp >= 360) {
      return 0;
    } else {
      return temp;
    }
  } else if (angka < 180) {
    temp = angka + 180;
    if (temp <= 0 || temp >= 360) {
      return 0;
    } else {
      return temp;
    }
  } else {
    return 0;
  }
}

void main() {
  stdout.write("Masukkan Angka : ");
  int? angka = int.parse(stdin.readLineSync()!);

  print(azimuth(angka));
}
