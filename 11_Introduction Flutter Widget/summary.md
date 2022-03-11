# (11) Introduction Flutter Widget

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Introduction Flutter Widget

1. Apa itu Flutter
   flutter adalah alat pengembangan antarmuka pengguna yang digunakan untuk membuat aplikasi mobile, desktop, dan web
2. widget
   widget digunakan untuk membentuk antar muka atau UI. widget biasanya juga berupa class dan dapat terdiri dari beberapa widget lainnya. ada 2 jenis widget yaitu stateless dan stateful.
   - stateless widget
     - stateless widget tidak bergantung pada peruahan data dan hanya fokus pada tampilan saja. stateless widget dibuat dengan extend pada class statelesswidget.
   - stateful widget
     - stateful widget mementingkan pada perubahan data dan dibuat dengan exnteds pada class statefulwidget. 1 widget mengunakan 2 class (widget dan state).
3. Built in widget
   build in widget adalah widget yang dapat langsung digunakan dan sudah terinstall bersama flutter. contohnya adalah
   - MaterialApp
     - membangun aplikasi dengan desain material
   - Scaffold
     - Membentuk sebuah halaman
   - AppBar
     - membentuk application bar yang terletak pada bagian atas halaman
   - Text
     - Menampilkan Teks

## Task

1. Buatlah statefull widget yang kontennya dapat berubah setiap detik.
2. dari widget tersebut, pisahkan menjadi beberapa widget tanpa mengubah tampilannya

## Pembahasan

1. Berikut adalah program dan outputnya

```dart
//import material flutter
import 'package:flutter/material.dart';
//import async agar bisa menjalan kan ascyncronus
import 'dart:async';

//fungsi utama menjalankan class fluttertimedemo
void main() => runApp(FlutterTimeDemo());

//class flutter time demo menggunakan stateful widget
class FlutterTimeDemo extends StatefulWidget {
  @override
  _FlutterTimeDemoState createState() => _FlutterTimeDemoState();
}

class _FlutterTimeDemoState extends State<FlutterTimeDemo> {
  //inisialisasi variabel timestring
  String _timeString = '';

  //method init state
  @override
  void initState() {
    //pertama tama variabel timestring diisi jam skrg
    _timeString =
        "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
    //tapi setiap 1 detik memanggil jam yang baru dengan method getcurrenttime
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getCurrentTime());
    super.initState();
  }

  //build widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          //membuat appbar dengan title flutter widget
          appBar: AppBar(
            title: const Text('Fluter Widget Task 1'),
          ),
          //mmebuat body dengan alignt center
          body: Center(
            //body memiliki text yaitu variabel timestring dengan ukuran 30
            child: Text(
              _timeString,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }

  //method getcurrenttime
  void _getCurrentTime() {
    //mengeset variabel timestring dengan jam skrg
    setState(() {
      _timeString =
          "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
    });
  }
}

```
berikut adalah outputnya
![outputTask1](https://user-images.githubusercontent.com/74952343/157823437-a58c9a4b-01a4-47bc-b8c7-852805ddd1ce.jpeg)


2. Berikut adalah program dan outputnya

```dart
//import material flutter
import 'package:flutter/material.dart';
//import async agar bisa menjalan kan ascyncronus
import 'dart:async';

//fungsi utama menjalankan class fluttertimedemo
void main() => runApp(FlutterTimeDemo());

//class flutter time demo menggunakan stateful widget
class FlutterTimeDemo extends StatefulWidget {
  @override
  _FlutterTimeDemoState createState() => _FlutterTimeDemoState();
}

class _FlutterTimeDemoState extends State<FlutterTimeDemo> {
  //inisialisasi variabel timestring
  String _timeString = '';

  //method init state
  @override
  void initState() {
    //pertama tama variabel timestring diisi jam skrg
    _timeString =
        "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
    //tapi setiap 1 detik memanggil jam yang baru dengan method getcurrenttime
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getCurrentTime());
    super.initState();
  }

  //build widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          //membuat appbar dengan title flutter widget
          appBar: AppBar(
            title: const Text('Fluter Widget Task 2'),
          ),
          //mmebuat widget Time
          body: Time(timeString: _timeString),
        ),
      ),
    );
  }

  //method getcurrenttime
  void _getCurrentTime() {
    //mengeset variabel timestring dengan jam skrg
    setState(() {
      _timeString =
          "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
    });
  }
}

//membuat widget time
class Time extends StatelessWidget {
  const Time({
    Key? key,
    required String timeString,
  })  : _timeString = timeString,
        super(key: key);

  final String _timeString;

  @override
  Widget build(BuildContext context) {
    return Center(
      //body memiliki text yaitu variabel timestring dengan ukuran 30
      child: Text(
        _timeString,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}

```
berikut adalah outputnya
![outputTask2](https://user-images.githubusercontent.com/74952343/157823457-90ee4522-4f81-4a79-815d-2b98b681d64b.jpeg)
