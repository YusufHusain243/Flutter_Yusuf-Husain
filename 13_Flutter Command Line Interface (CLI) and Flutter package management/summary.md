# (13) Flutter Command Line Interface(CLI) and Flutter package management

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Flutter Command Line Interface(CLI) and Flutter package management

1. flutter cli adalah alat yang digunakan untuk berinteraksi dengan flutter SDK, dan perintahnya dijalankan didalam terminal. ada beberapa CLI commands yang penting antara lain adalah flutter doctor, flutter create, flutter run, flutter emulator, flutter channel, flutter pub, flutter build, flutter clean
2. berikut adalah penjelasan dari beberapa CLI command diatas

   - flutter doctor
     adalah perintah untuk menampilkan informasi software yang dibutuhkan flutter
   - flutter create
     adalah perintah untuk membuat project aplikasi flutter baru di directory tertentu
   - flutter run
     flutter run adalah perintah untuk menjalankan project aplikasi didevice yang tersedia
   - flutter emulator
     adalah perintah untuk menampilkan daftar emulator yang terinstall dan menampilkan option untuk membuka emulator atau membuat emulator baru
   - flutter channel
     adalah perintah untuk menampilkan daftar flutter channel yang tersedia dan menunjukkan channel yang digunakan saat ini
   - flutter pub
     ada dua syntak yang bisa kita gunakan, yaitu :
     - flutter pub add, untuk menambahkan packages ke dependencies yang ada di pubspec.yaml
     - flutter pub get, untuk mendownload semua packages atau dependencies yang ada di pubspec.yaml
   - flutter build
     adalah perintah untuk memproduksi sebuah file aplikasi untuk keperluan deploy atau publish ke appstore ,playstore dll.
   - flutter clean
     adalah perintah untuk menghapus folder build seta file lainnya yang dihasilkan saat kita menjalankan aplikasi di emulator. perintah ini akan memperkecil ukuran project tersebut

3. packages management
   flutter mendukung sharing packages. packages ini dibuat developers lain dimana dengan ini dapat mempercepat pengembangan aplikasi karena tidak perlu membuat semuanya dari awal atau from scratch.

## Task

1. berikut adalah program dan output untuk task 1

   - program

     ```dart
     import 'package:flutter/material.dart';
     //mengimport package badges.dart agar bisa menggunakan widget badge
     import 'package:badges/badges.dart';

     void main() {
     runApp(const MyApp());
     }

     class MyApp extends StatelessWidget {
     const MyApp({Key? key}) : super(key: key);

     @override
     Widget build(BuildContext context) {
         return MaterialApp(
         debugShowCheckedModeBanner: false,
         home: SafeArea(
             child: Scaffold(
             appBar: AppBar(
                 title: Text('TesBadge'),
             ),
             body: Center(
                 child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                     //membuat chip bentukan chip hampir mirip dengan badge namun memiliki ukuran yang agak besar meskipun padding diset menjadi 0
                     Chip(
                     backgroundColor: Colors.deepPurple,
                     label: Text(
                         'BADGE',
                         style: TextStyle(
                         color: Colors.white,
                         ),
                     ),
                     ),
                     //badge memiliki customisasi yang lebih fleksibel
                     Badge(
                     //misal terdapat bentuk square dan circle
                     shape: BadgeShape.square,
                     badgeColor: Colors.deepPurple,
                     //bisa juga menambahkan border radius yang diinginkan
                     borderRadius: BorderRadius.circular(50),
                     badgeContent: Text(
                         'BADGE',
                         style: TextStyle(
                         color: Colors.white,
                         ),
                     ),
                     ),
                 ],
                 ),
             ),
             ),
         ),
         );
     }
     }

     ```

   - output<br>
      ![output_task1](https://user-images.githubusercontent.com/74952343/159168397-e71d95e4-c1c0-4a58-957b-d7c5c7366f92.jpeg)


2. berikut adalah program dan output untuk task 2

   - program

     ```dart
     import 'package:flutter/material.dart';
     //import barcode widget
     import 'package:barcode_widget/barcode_widget.dart';
     //import badges
     import 'package:badges/badges.dart';

     void main() {
     runApp(const MyApp());
     }

     //mebuat widget myapp dengan stateless
     class MyApp extends StatelessWidget {
     const MyApp({Key? key}) : super(key: key);

     @override
     Widget build(BuildContext context) {
         return MaterialApp(
         debugShowCheckedModeBanner: false,
         home: SafeArea(
             child: Scaffold(
             appBar: AppBar(
                 title: Text('TesBarcode'),
             ),
             body: Padding(
                 //pada bode memanggil class atau widget GenerateBarcode
                 padding: EdgeInsets.all(20),
                 child: GenerateBarcode(),
             ),
             ),
         ),
         );
     }
     }

     class GenerateBarcode extends StatefulWidget {
     GenerateBarcode({Key? key}) : super(key: key);

     @override
     State<GenerateBarcode> createState() => _GenerateBarcodeState();

     static code128() {}
     }

     class _GenerateBarcodeState extends State<GenerateBarcode> {
     String? data, type;
     List _valType = ["code128"];

     Widget generateBarcode() {
         if (data != null) {
         return BarcodeWidget(
             barcode: Barcode.code128(escapes: true),
             data: "$data",
             width: 300,
             height: 100,
         );
         } else {
         return Text(' ');
         }
     }

     @override
     Widget build(BuildContext context) {
         return Column(
         children: [
             TextField(
             decoration: InputDecoration(
                 hintText: 'Input your data',
                 hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
             ),
             onChanged: (value) {
                 setState(() {
                 data = value;
                 });
             },
             ),
             SizedBox(
             height: 20,
             ),
             Badge(
             shape: BadgeShape.square,
             badgeColor: Colors.deepPurple,
             borderRadius: BorderRadius.circular(50),
             badgeContent: Text(
                 'Hasil Barcode',
                 style: TextStyle(
                 color: Colors.white,
                 ),
             ),
             ),
             SizedBox(
             height: 20,
             ),
             generateBarcode(),
         ],
         );
     }
     }

     ```

   - output<br>
      ![output1_task2](https://user-images.githubusercontent.com/74952343/159168406-ac37b287-09fd-4d42-a555-97d43c2c7ab1.jpeg)
      ![output2_task2](https://user-images.githubusercontent.com/74952343/159168412-c9f8aa89-ce4a-48fd-b2b3-4b21062910a8.jpeg)
      ![output3_task2](https://user-images.githubusercontent.com/74952343/159168417-9ae2dfcf-a35c-4b25-aa03-f59dbc7d61dd.jpeg)



