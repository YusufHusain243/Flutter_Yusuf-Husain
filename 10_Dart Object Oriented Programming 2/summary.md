# (10) Dart Object Oriented Programming 2

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Dart Object Oriented Programming 2

1. constructor
   constructor adalah method yang dijalankan saat pembuatan objek dari sebuah class. method ini hampir sama dengan fungsi dimana dapat menerima parameter, namun tidak memiliki return. untuk penamaan constructor sama dengan nama class.
2. inheritance
   inheritance adalah membuat class baru dengan memanfaatkan class yang sudah ada. hal ini berutujuan agar kemampuan class yang sudah ada dapat dimiliki oleh class baru.
3. interface
   interface ini biasanya berupa class yang menunjukkan method apa saja yang ada pada suatu class. seluruh method wajin di override dan panggunaannya menggunakan implements.

selain ketiga poin diatas, ada juga method override. dimana override ini adalah menulis ulang method yang ada pada super-class. hal ini bertujuan agar class memiliki method yang sama, dengan proses yang berbeda

## Task

1. buatlah class dengan spesifikasi :
   - class BangunRuang
     - panjang
     - lebar
     - tinggi
     - volume()
   - class Kubus extends BangunRuang
     - sisi
   - class Balok extends BangunRuang
     dari rangkaian diatas, lalukan method overriding untuk membedakan tiap proses dalam method antar class!
2. buatlah class dengan spesifikasi :
   - class Matematika
     - hasil()
   - class KelipatanPersekutuanTerkecil implements Matematika
     - x
     - y
   - class FaktorPersekutuanTerbesa implements Matematika - x - y
     dari rangkaian class diatas, lengkapi kode berikut ini sehingga dapat menampilkan hasil pada layar

## Pembahasan

1. berikut adalah program dan output task nomor 1

   - program

     ```dart
     //membuat class bangun ruang -> super class
     class BangunRuang {
     //membuat property panjang tipe integer dengan value nullable
     int? panjang;
     //membuat property lebar tipe integer dengan value nullable
     int? lebar;
     //membuat property tinggi tipe integer dengan value nullable
     int? tinggi;

     //membuat constructor class bangun ruang
     BangunRuang({this.panjang, this.lebar, this.tinggi});

     //membuat method volume dengan tipe balikan integer
     int volume() {
         //menghitung hasil volume dengan tiap variabel wajib ada value dengan cara menambahkan tanda seru
         int hasil = this.panjang! * this.lebar! * this.tinggi!;
         //balikkan hasil
         return hasil;
     }
     }

     //membuat class kubus inheritance dari bangun ruang
     class Kubus extends BangunRuang {
     //membuat property sisi dengan tipe integer
     int sisi;
     //membuat constructor untuk class kubus
     Kubus(this.sisi);
     //override method volume yang ada di super class
     @override
     int volume() {
         //mencari volume kubus
         int hasil = sisi * sisi * sisi;
         //balikkan hasil
         return hasil;
     }
     }

     //membuat class balok inheritance dari class bangun ruang
     //class ini tidal memiliki property atau pun method
     class Balok extends BangunRuang {}

     //fungsi utama
     void main() {
     //membuat objek balok
     Balok balok = Balok();
     //membuat objek kubus dengan mengisi konstruktor dengan nilai 5
     Kubus kubus = Kubus(5);

     //mencetak fungsi volume pada class kubus
     print(kubus.volume());

     //mengisi property panjang pada class balok dengan nilai 2
     balok.panjang = 2;
     //mengisi property lebar pada class balok dengan nilai 4
     balok.lebar = 4;
     //mengisi property tinggi pada class balok dengan nilai 2
     balok.tinggi = 2;
     //mencetak fungsi volume pada class balok
     print(balok.volume());
     }
     ```

   - output
     ![](https://github.com/YusufHusain243/Flutter_Yusuf-Husain/blob/main/10_Dart%20Object%20Oriented%20Programming%202/screenshots/outputTask1.jpeg)

2. berikut adalah program dan output task nomor 2

   - program

     ```dart
     //membuat class matematika
     class Matematika {
     //membuat method hasil dengan parameter integer x dan y
     int hasil(int x, int y) {
         //return 0
         return 0;
     }
     }

     //membuat class KelipatanPersekutuanTerkecil yang merupakan interface dari class matematika
     class KelipatanPersekutuanTerkecil implements Matematika {
     //meng override method hasil
     @override
     int hasil(int x, int y) {
         //inisialisasi varibel hasil
         var hasil = x;
         //lakukan perulangan sampai hasil mod dari hasil dan y adalah 0
         while (hasil % y != 0) {
         //setiap perulangan variabel ditambah x
         hasil += x;
         }
         //balikkan variabel hasil
         return hasil;
     }
     }

     //membuat class FaktorPersekutuanTerbesar yang merupakan interface dari class matematika
     class FaktorPersekutuanTerbesar implements Matematika {
     //meng override method hasil
     @override
     int hasil(int x, int y) {
         //inisialisasi varibel hasil
         var hasil;
         //lakukan perulangan mulai dari 1 sampai x
         for (var i = 1; i <= x; i++) {
         //jika hasil mod x dan i == 0 && hasil mod y dan i == 0
         if (x % i == 0 && y % i == 0) {
             //maka hasil sama dengan i
             hasil = i;
         }
         }
         //balikkan hasil
         return hasil;
     }
     }

     //fungsi utama
     void main() {
     //membuat objek KelipatanPersekutuanTerkecil
     KelipatanPersekutuanTerkecil kelipatanPersekutuanTerkecil =
         KelipatanPersekutuanTerkecil();
     //mencetak fungsi hasil pada class KelipatanPersekutuanTerkecil dengan parameter 10 dan 20
     print(kelipatanPersekutuanTerkecil.hasil(10, 20));

     //membuat objek FaktorPersekutuanTerbesar
     FaktorPersekutuanTerbesar faktorPersekutuanTerbesar =
         FaktorPersekutuanTerbesar();
     //mencetak fungsi hasil pada class FaktorPersekutuanTerbesar dengan parameter 10 dan 20
     print(faktorPersekutuanTerbesar.hasil(10, 20));
     }

     ```

   - output
     ![](https://github.com/YusufHusain243/Flutter_Yusuf-Husain/blob/main/10_Dart%20Object%20Oriented%20Programming%202/screenshots/outputTask2.jpeg)
