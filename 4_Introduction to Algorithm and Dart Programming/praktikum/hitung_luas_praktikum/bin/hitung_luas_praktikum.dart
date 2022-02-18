import 'dart:io';

//function hitung luas lingkaran dengan parameter jari jari
//SOAL NOMOR 1
Future<double> hitungLuasLingkaran(r) {
  //menggunakan future dengan delay selama 1 detik
  return Future.delayed(Duration(seconds: 1), () {
    //setelah 1 detik program dibawah ini dijalankan

    //inisialisasi nilai constanta
    final phi = 3.14;

    //proses perhitungan luas lingkaran
    var hasil = phi * (r * r);

    //mengembalikan hasil dari proses perthitungan
    return hasil;
  });
}

//function main atau function utama
void main() async {
  //inisialisasi 3 variabel string untuk judul
  String kata1 = 'Hitung ';
  String kata2 = 'Luas ';
  String kata3 = 'Lingkaran ';

  //inisialisasi variabel jari jari
  double r = 5;

  //penggabungan 3 string menjadi 1 kalimat
  //SOAL NOMOR 2
  print(kata1 + kata2 + kata3);

  //memanggil function hitung luas lingkaran dengan paramter bernilai 5
  var hasil = await hitungLuasLingkaran(r);

  //cetak hasil perhitungan
  print("Jari Jari : $r \nLuas Lingkaran : $hasil");
}
