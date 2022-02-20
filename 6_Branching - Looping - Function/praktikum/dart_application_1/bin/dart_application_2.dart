import 'dart:io';

double faktorial(double angka) {
  // if (angka == 0) {
  //   return 1;
  // } else {
  //   return angka * faktorial(angka - 1);
  // }
  double faktorial = 1;
  if (angka < 0) {
    print("Angka yang dimasukkan bukan bilangan bulat");
  } else {
    for (int i = 1; i <= angka; i++) {
      faktorial *= i;
    }
  }
  return faktorial;
}

void main() {
  print("Hitung Nilai faktorial");
  var angka = [10.0, 20.0, 30.0];
  for (var n in angka) {
    var hasilFaktorial = faktorial(n);
    print("Faktorial dari '$n' adalah '$hasilFaktorial'");
  }
}
