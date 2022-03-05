import 'dart:io';

void diagonal(int angka) {
  var i, j, k;
  for (i = 1; i <= angka; i++) {
    for (j = 1; j <= angka; j++) {
      if (i == j) {
        stdout.write("$i");
      } else {
        stdout.write(" ");
      }
    }
    stdout.writeln("");
  }
}

void main() {
  stdout.write("Masukkan Angka : ");
  int? angka = int.parse(stdin.readLineSync()!);
  diagonal(angka);
}
