# (5) Basic Dart Programming<br>
Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Basic Dart Programming

1. function pada materi ini dijelaskan beberapa contoh function yang ada di dalam dart. contohnya adalah anonymous function dan juga arrow function.anonymous function adalah function yang tidak memiliki nama, fungsi ini juga bersifat sebagai data dari sebuah variabel contoh
```dart
var a = (){
  print('hello');
}
```
contoh kedua adalah arrow function. arrow function ini dapat menuliskan sebuah function menjadi lebih ringkas contoh 
```dart
var a = () => print('hello');
```

2. asynchronous pada materi ini dijelaskan mengenai fungsi async-await. dimana fungsi ini menjalankan beberapa proses secara asyncronous. dan fungsi await akan menunggu proses async selesai. setelah itu juga ada tipe data future. dimana dengan menggunakan future dapat menjalan kan proses dengan diberi waktu atau durasi. tipe data future memerlukan async untuk menjalankan prosesnya.

3. collection pada materi ini dijelaskan 2 bentuk collection yaitu list dan juga map. collection sendiri memiliki pengertian kumpulan data pada satu tempat. contoh pertama adalah list. list akan menyimpan data secara dalam bentuk baris, dan setiap data memiliki index. contoh kedua adalah map. dimana map akan menyimpan data secara key-value.

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