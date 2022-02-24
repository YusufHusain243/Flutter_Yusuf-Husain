# (4) Introduction to algorithm and dart programming<br>
Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya
## Resume Introduction to algorithm and dart programming

1. poin pertama materi ini menjelaskan tentang pengertian dari bahasa pemrograman dart. dimana dart ini adalah bahasa pemrograman yang dirancang agar aplikasi berjalan dengan cepat, dart juga merupakan aplikasi yang berjalan disisi client(front end).

2. poin kedua adalah materi ini menjelaskan dasar pemrograman dart. dimaana menjelaskan hal basic mulai dari menampilkan teks menggunakan dart, memahami struktur folder dan fungsi mana yang akan dijalankan pertama kali bahkan sampai menulis komentar.

3. poin ketiga adalah materi ini mulai masuk ke dalam dunia programming dimana terdapat variabel, tipe data, dan operator. variabel digunakan untuk menyimpan data pada sebuah program. tipe data adalah jenis data yang dapat dikelola. operator digunakan untuk operasi pengolahan data.

## Task
1. implementasikan rumus luas lingkaran pada program dart!
2. buatlah 3 buah variabel yang berisi string, lalu sambungkan seluruh string tersebut, dan tampilkan pada layar!

## Pembahasan
pada latihan ini, saya menggabungkan kedua tugas diatas menjadi 1 buah program. berikut adalah penjelasannya. <br>

- membuat fungsi mencari luas lingkaran
```dart
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
```

- menggabungkan 3 buah string
untuk tugas ini, saya kerjakan di fungsi main. dimana saya mendeklarasikan 3 buah variabel string, lalu saya gabungkan menjadi judul output program ini. pada fungsi main ini juga dijalankan fungsi menghitung luas lingkaran dengan nilai parameter 5. fungsi main memerlukan async, karena didalamnya akan menjalankan fungsi future yaitu fungsi menghitung luas lingkaran
```dart
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
```