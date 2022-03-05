import 'dart:io';

void jamPasir(int angka) {
  var i, j, k;
  print("Input = $angka");
  for (i = 0; i <= angka - 1; i++) {
    for (j = 0; j < i; j++) {
      stdout.write(" ");
    }
    for (k = i; k <= angka - 1; k++) {
      stdout.write("*" + " ");
    }
    stdout.writeln("");
  }
  for (i = angka - 1; i >= 0; i--) {
    for (j = 0; j < i; j++) {
      stdout.write(" ");
    }
    for (k = i; k <= angka - 1; k++) {
      stdout.write("*" + " ");
    }
    stdout.writeln("");
  }
}

void main() {
  stdout.write("Masukkan Angka : ");
  int? angka = int.parse(stdin.readLineSync()!);
  jamPasir(angka);
}
