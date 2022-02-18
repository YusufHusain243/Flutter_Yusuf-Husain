import 'dart:io';

//function hitung luas lingkaran dengan parameter jari jari
void hitungLuasLingkaran(r) {
  //const phi
  final phi = 3.14;

  //proses hitung luas lingkaran
  double hasil = phi * (r * r);

  //cetak jari jari
  print("Jari Jari = $r");

  //cetak hasil perhitungan
  print("Luas Lingkaran = $hasil");
}

//function main atau function utama
void main(List<String> args) {
  //inisialisasi 3 string untuk judul
  String kata1 = 'Hitung ';
  String kata2 = 'Luas ';
  String kata3 = 'Lingkaran ';

  //penggabungan 3 string menjadi 1 kalimat
  print(kata1 + kata2 + kata3);

  //memanggil function hitung luas lingkaran dengan paramter bernilai 5
  hitungLuasLingkaran(5);
}
